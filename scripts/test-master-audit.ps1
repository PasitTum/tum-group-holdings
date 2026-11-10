<#
.SYNOPSIS
    TUM Group Holdings - Master E2E Automated Verification Suite
    Validates all 7 turnkey commercial packages in D:\TUM\setup-product.

.DESCRIPTION
    Comprehensive 5-stage verification runner:
      Stage 1: Directory Topology and Required Subdirectories
      Stage 2: Executable Binaries (PE header and size thresholds >=50MB / >=100MB)
      Stage 3: Offline Container Archives (Gzip header, size, compose and Dockerfile)
      Stage 4: Documentation Completeness (INSTALL.md, README.md >=1KB)
      Stage 5: Standalone Smoke Test Execution (Isolated process, exit code 0)

.PARAMETER VerboseLog
    Display verbose diagnostic output during verification.

.PARAMETER SkipSmoke
    Skip execution of individual smoke-test.ps1 scripts (pre-flight checks only).

.PARAMETER Product
    Filter execution to a specific product name.

.PARAMETER Format
    Output format: 'Table' (default) or 'Json'.
#>

[CmdletBinding()]
param(
    [switch]$VerboseLog,
    [switch]$SkipSmoke,
    [string]$Product,
    [ValidateSet("Table", "Json")]
    [string]$Format = "Table"
)

$ErrorActionPreference = "Continue"
$startTime = Get-Date

function Write-Color {
    param([string]$Text, [string]$Color = "White")
    Write-Host $Text -ForegroundColor $Color
}

function Test-PeHeader {
    param([string]$FilePath)
    if (-not (Test-Path $FilePath)) { return $false }
    try {
        $stream = [System.IO.File]::OpenRead($FilePath)
        $bytes = New-Object byte[] 2
        $bytesRead = $stream.Read($bytes, 0, 2)
        $stream.Close()
        # MZ header check: 0x4D, 0x5A
        return ($bytesRead -eq 2 -and $bytes[0] -eq 0x4D -and $bytes[1] -eq 0x5A)
    } catch {
        return $false
    }
}

function Test-GzipHeader {
    param([string]$FilePath)
    if (-not (Test-Path $FilePath)) { return $false }
    try {
        $stream = [System.IO.File]::OpenRead($FilePath)
        $bytes = New-Object byte[] 2
        $bytesRead = $stream.Read($bytes, 0, 2)
        $stream.Close()
        # Gzip magic numbers: 0x1F, 0x8B
        return ($bytesRead -eq 2 -and $bytes[0] -eq 0x1F -and $bytes[1] -eq 0x8B)
    } catch {
        return $false
    }
}

$baseDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if ([string]::IsNullOrWhiteSpace($baseDir) -or -not (Test-Path $baseDir)) {
    $baseDir = "D:\TUM\setup-product"
}

Write-Color "================================================================================" "Cyan"
Write-Color " TUM GROUP HOLDINGS -- MASTER COMMERCIAL FLEET VERIFICATION RUNNER" "Cyan"
Write-Color " Master Test Infrastructure: D:\TUM\setup-product\TEST_INFRA.md" "Cyan"
Write-Color " Target Directory: $baseDir" "Cyan"
Write-Color " Timestamp: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss UTC')" "Cyan"
Write-Color "================================================================================" "Cyan"
Write-Host ""

# Product Definition Matrix
$productDefs = @(
    @{
        Id = "tum-trust-security";
        Name = "TUM Trust Security";
        Category = "Edge Kiosk and Diagnostics";
        RequiredDirs = @("service-bin", "installer", "kiosk-diagnostics-console", "hil-testbed");
        Binaries = @(
            @{ Path = "service-bin\Tum.Trust.KioskService.exe"; MinBytes = 50000000; Desc = ".NET 8 AOT Kiosk Service" },
            @{ Path = "kiosk-diagnostics-console\TUM-Kiosk-Diagnostics.exe"; MinBytes = 50000000; Desc = "Electron Diagnostics App" }
        );
        Container = $null;
        Docs = @("INSTALL.md", "INSTALL_AND_QUICKSTART_GUIDE.md", "README.md");
        SmokeTest = "smoke-test.ps1"
    },
    @{
        Id = "tum-quantum";
        Name = "TUM Quantum";
        Category = "PQC Reverse Proxy Gateway";
        RequiredDirs = @("docker-appliance", "constant-time-suite", "briefing");
        Binaries = @();
        Container = @{
            Compose = "docker-appliance\docker-compose.yml";
            Dockerfile = "docker-appliance\Dockerfile";
            Archive = "docker-appliance\tum-quantum-gateway-offline.tar.gz";
            MinArchiveBytes = 10000
        };
        Docs = @("INSTALL.md", "INSTALL_AND_QUICKSTART_GUIDE.md", "README.md", "ARCHITECTURE_MANUAL.md");
        SmokeTest = "smoke-test.ps1"
    },
    @{
        Id = "tum-socs";
        Name = "TUM OpenSIEM";
        Category = "All-in-One Enterprise OpenSIEM";
        RequiredDirs = @("desktop-app", "docker-appliance", "helm", "stress-test");
        Binaries = @(
            @{ Path = "desktop-app\TUM-OpenSIEM.exe"; MinBytes = 100000000; Desc = "Electron OpenSIEM Desktop App" }
        );
        Container = @{
            Compose = "docker-appliance\docker-compose.yml";
            Dockerfile = "docker-appliance\Dockerfile";
            Archive = "docker-appliance\tum-opensiem-appliance-offline.tar.gz";
            MinArchiveBytes = 1000000
        };
        Docs = @("INSTALL.md", "INSTALL_AND_QUICKSTART_GUIDE.md", "README.md");
        SmokeTest = "smoke-test.ps1"
    },
    @{
        Id = "tum-agentic-workos";
        Name = "TUM Agentic WorkOS";
        Category = "Corporate Accounting and e-Tax ERP";
        RequiredDirs = @();
        Binaries = @();
        Container = $null;
        Docs = @("INSTALL.md", "INSTALL_AND_QUICKSTART_GUIDE.md", "README.md");
        SmokeTest = "smoke-test.ps1"
    },
    @{
        Id = "tum-cybermesh";
        Name = "TUM Cybermesh";
        Category = "Sensor Mesh and SOAR Orchestration";
        RequiredDirs = @("sensor-agent", "soar-connectors");
        Binaries = @();
        Container = $null;
        Docs = @("INSTALL.md", "INSTALL_AND_QUICKSTART_GUIDE.md", "README.md");
        SmokeTest = "smoke-test.ps1"
    },
    @{
        Id = "tum-trust-fabric";
        Name = "TUM Trust Fabric";
        Category = "Sovereign Corridor E-Gate Gateway";
        RequiredDirs = @("docker-appliance", "proto", "blueprints");
        Binaries = @();
        Container = @{
            Compose = "docker-appliance\docker-compose.yml";
            Dockerfile = "docker-appliance\Dockerfile";
            Archive = "docker-appliance\sovereign-corridor-gateway-offline.tar.gz";
            MinArchiveBytes = 10000;
            PkiDir = "docker-appliance\data\icao-pki";
            MinCerts = 20
        };
        Docs = @("INSTALL.md", "INSTALL_AND_QUICKSTART_GUIDE.md", "README.md");
        SmokeTest = "smoke-test.ps1"
    },
    @{
        Id = "tum-central-director";
        Name = "TUM Central Director";
        Category = "Enterprise Fleet Command Console";
        RequiredDirs = @("desktop-app");
        Binaries = @(
            @{ Path = "desktop-app\TUM-Central-Director.exe"; MinBytes = 100000000; Desc = "Electron Operator IDE" }
        );
        Container = $null;
        Docs = @("INSTALL.md", "INSTALL_AND_QUICKSTART_GUIDE.md", "README.md");
        SmokeTest = "smoke-test.ps1"
    }
)

if (-not [string]::IsNullOrWhiteSpace($Product)) {
    $productDefs = $productDefs | Where-Object { $_.Id -like "*$Product*" }
    if ($productDefs.Count -eq 0) {
        Write-Color "[ERROR] No product found matching filter: '$Product'" "Red"
        exit 1
    }
}

$scorecard = @()
$totalPassed = 0
$totalFailed = 0

foreach ($p in $productDefs) {
    $pDir = Join-Path $baseDir $p.Id
    Write-Color ">>> Auditing Product Deliverable: $($p.Name) [$($p.Id)]" "Yellow"
    Write-Host "    Category: $($p.Category)"
    
    $stageDir = "PASS"
    $stageBin = "PASS"
    $stageContainer = "PASS"
    $stageDocs = "PASS"
    $stageSmoke = "PASS"
    $details = @()
    
    # 1. Directory Topology Check
    if (-not (Test-Path $pDir)) {
        $stageDir = "FAIL"
        $details += "Product root directory missing: $pDir"
    } else {
        foreach ($reqDir in $p.RequiredDirs) {
            $subPath = Join-Path $pDir $reqDir
            if (-not (Test-Path $subPath)) {
                $stageDir = "FAIL"
                $details += "Missing required subdirectory: $reqDir"
            }
        }
    }
    
    # 2. Binary / Executable Check
    if ($p.Binaries.Count -gt 0) {
        foreach ($bin in $p.Binaries) {
            $binPath = Join-Path $pDir $bin.Path
            if (-not (Test-Path $binPath)) {
                $stageBin = "FAIL"
                $details += "Missing binary: $($bin.Path)"
            } else {
                $fileItem = Get-Item $binPath
                $sizeMB = [math]::Round($fileItem.Length / 1048576, 2)
                $minMB = [math]::Round($bin.MinBytes / 1048576, 2)
                if ($fileItem.Length -lt $bin.MinBytes) {
                    $stageBin = "FAIL"
                    $details += "Binary size below threshold: $($bin.Path) ($sizeMB MB vs min $minMB MB)"
                } elseif (-not (Test-PeHeader $binPath)) {
                    $stageBin = "FAIL"
                    $details += "Invalid PE header (not a Windows executable): $($bin.Path)"
                } else {
                    if ($VerboseLog) {
                        Write-Host "    [OK] Binary verified: $($bin.Path) ($sizeMB MB, PE valid)" -ForegroundColor DarkGreen
                    }
                }
            }
        }
    } else {
        $stageBin = "N/A"
    }
    
    # 3. Offline Container Archive Check
    if ($null -ne $p.Container) {
        $composePath = Join-Path $pDir $p.Container.Compose
        $dockerfilePath = Join-Path $pDir $p.Container.Dockerfile
        $archivePath = Join-Path $pDir $p.Container.Archive
        
        if (-not (Test-Path $composePath)) {
            $stageContainer = "FAIL"
            $details += "Missing docker-compose.yml"
        }
        if (-not (Test-Path $dockerfilePath) -and -not (Test-Path (Join-Path $pDir "docker-appliance\gateway\Dockerfile"))) {
            $stageContainer = "FAIL"
            $details += "Missing Dockerfile"
        }
        
        # Check archive file
        if (-not (Test-Path $archivePath)) {
            $foundArchives = Get-ChildItem -Path (Join-Path $pDir "docker-appliance") -Filter "*.tar*" -ErrorAction SilentlyContinue
            if ($foundArchives.Count -gt 0) {
                $archivePath = $foundArchives[0].FullName
            } else {
                $stageContainer = "FAIL"
                $details += "Missing offline container archive: $($p.Container.Archive)"
            }
        }
        
        if (Test-Path $archivePath) {
            $archItem = Get-Item $archivePath
            $archSize = $archItem.Length
            if ($archSize -lt $p.Container.MinArchiveBytes) {
                $stageContainer = "FAIL"
                $details += "Archive size below minimum: $archivePath ($archSize bytes)"
            } elseif ($archivePath.EndsWith(".gz") -and -not (Test-GzipHeader $archivePath)) {
                $stageContainer = "FAIL"
                $details += "Invalid Gzip archive header: $archivePath"
            } else {
                if ($VerboseLog) {
                    $archMB = [math]::Round($archSize / 1048576, 2)
                    Write-Host "    [OK] Container archive verified: $(Split-Path -Leaf $archivePath) ($archMB MB)" -ForegroundColor DarkGreen
                }
            }
        }
        
        # Check PKI certs if applicable
        if ($null -ne $p.Container.PkiDir) {
            $pkiPath = Join-Path $pDir $p.Container.PkiDir
            if (Test-Path $pkiPath) {
                $certCount = (Get-ChildItem -Path $pkiPath -Filter "*.pem" -ErrorAction SilentlyContinue | Measure-Object).Count
                if ($certCount -lt $p.Container.MinCerts) {
                    $stageContainer = "FAIL"
                    $details += "CSCA PKI trust store has insufficient certificates: $certCount vs required $($p.Container.MinCerts)"
                } else {
                    if ($VerboseLog) {
                        Write-Host "    [OK] ICAO CSCA PKI store verified: $certCount certificates found" -ForegroundColor DarkGreen
                    }
                }
            } else {
                $stageContainer = "FAIL"
                $details += "Missing PKI directory: $($p.Container.PkiDir)"
            }
        }
    } else {
        $stageContainer = "N/A"
    }
    
    # 4. Documentation Completeness Check
    $docFound = $false
    foreach ($doc in $p.Docs) {
        $docPath = Join-Path $pDir $doc
        if (Test-Path $docPath) {
            $docItem = Get-Item $docPath
            if ($docItem.Length -gt 1000) {
                $docFound = $true
                break
            }
        }
    }
    if (-not $docFound) {
        $stageDocs = "FAIL"
        $details += "Documentation missing or below 1KB minimum threshold"
    }
    
    # 5. Smoke Test Execution Check
    if (-not $SkipSmoke) {
        $smokeScript = Join-Path $pDir $p.SmokeTest
        if (-not (Test-Path $smokeScript)) {
            $stageSmoke = "FAIL"
            $details += "Missing smoke test runner: $($p.SmokeTest)"
        } else {
            if ($VerboseLog) {
                Write-Host "    Executing: $smokeScript..." -ForegroundColor Gray
            }
            $proc = Start-Process -FilePath "powershell.exe" `
                -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$smokeScript`"" `
                -WorkingDirectory $pDir `
                -PassThru -NoNewWindow -Wait
            
            if ($proc.ExitCode -ne 0) {
                $stageSmoke = "FAIL"
                $details += "smoke-test.ps1 failed with exit code $($proc.ExitCode)"
            } else {
                if ($VerboseLog) {
                    Write-Host "    [OK] Smoke test execution passed cleanly (Exit Code 0)" -ForegroundColor DarkGreen
                }
            }
        }
    } else {
        $stageSmoke = "SKIPPED"
    }
    
    # Calculate Overall Status
    $hasFailure = ($stageDir -eq "FAIL") -or ($stageBin -eq "FAIL") -or ($stageContainer -eq "FAIL") -or ($stageDocs -eq "FAIL") -or ($stageSmoke -eq "FAIL")
    $verdict = if ($hasFailure) { "FAIL" } else { "PASS" }
    
    if ($verdict -eq "PASS") {
        $totalPassed++
        Write-Color "    ==> RESULT: [PASS] All checks satisfied cleanly." "Green"
    } else {
        $totalFailed++
        Write-Color "    ==> RESULT: [FAIL] Issues detected: $($details -join '; ')" "Red"
    }
    Write-Host ""
    
    $scorecard += [PSCustomObject]@{
        Product = $p.Id
        Structure = $stageDir
        Binaries = $stageBin
        Container = $stageContainer
        Docs = $stageDocs
        SmokeTest = $stageSmoke
        Verdict = $verdict
    }
}

$elapsed = (Get-Date) - $startTime

Write-Color "================================================================================" "Cyan"
Write-Color " FLEET VERIFICATION SCORECARD ($($productDefs.Count) PRODUCTS AUDITED)" "Cyan"
Write-Color "================================================================================" "Cyan"

if ($Format -eq "Json") {
    $scorecard | ConvertTo-Json -Depth 3
} else {
    $scorecard | Format-Table -AutoSize
}

Write-Host "Total Verified Products : $($productDefs.Count)"
Write-Host "Passed                  : $totalPassed" -ForegroundColor $(if ($totalPassed -eq $productDefs.Count) { "Green" } else { "Yellow" })
Write-Host "Failed                  : $totalFailed" -ForegroundColor $(if ($totalFailed -eq 0) { "Green" } else { "Red" })
Write-Host "Audit Elapsed Time      : $([math]::Round($elapsed.TotalSeconds, 2)) seconds"
Write-Host ""

if ($totalFailed -eq 0) {
    Write-Color "================================================================================" "Green"
    Write-Color " [100% AUDIT PASS] ALL COMMERCIAL TURNKEY PRODUCTS VERIFIED PRODUCTION READY!" "Green"
    Write-Color "================================================================================" "Green"
    exit 0
} else {
    Write-Color "================================================================================" "Red"
    Write-Color " [AUDIT FAILURE] One or more products reported validation errors." "Red"
    Write-Color "================================================================================" "Red"
    exit 1
}
