# 🛠️ TUM DEVELOPER PORTAL & INTERACTIVE SANDBOX BLUEPRINT
**Portal Domain:** `https://developer.tumgroup.com` | `https://sandbox.tumgroup.com`  
**Classification:** Technical Architecture Specification & Developer Experience (DX) Blueprint  
**Target Audience:** Enterprise Software Architects, SecOps Engineers, GovTech Integrators, Open-Source Contributors  
**Author:** Chief Marketing & Commercialization Officer (CMO) in coordination with TUM Engineering Guilds  

---

```
  ██████╗ ███████╗██╗   ██╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ██╗     
  ██╔══██╗██╔════╝██║   ██║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║     
  ██║  ██║█████╗  ██║   ██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██║     
  ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║     
  ██████╔╝███████╗ ╚████╔╝ ██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║███████╗
  ╚═════╝ ╚══════╝  ╚═══╝  ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝
```

---

## 1. Developer Experience (DX) Philosophy & System Architecture

The TUM Developer Portal is built on three core DX principles:
1. **Zero-Friction Time-to-First-Call (TTFC < 3 Minutes):** A developer must be able to test an API endpoint or verify a cryptographic passport checksum directly in the browser without creating an account or providing a credit card.
2. **Client-Side WebAssembly (Wasm) Cryptographic Sandbox:** To ensure absolute privacy and compliance with data sovereignty, the interactive sandbox runs the identity and biometric parser locally inside the developer's browser via WebAssembly—no raw identity documents or biometric photos ever leave the client machine.
3. **Multi-Language Type Safety:** All SDKs and APIs are generated from a canonical OpenAPI 3.1 & Protocol Buffers (gRPC) schema, guaranteeing type-safe contracts for TypeScript, C# (.NET 8/10), Python, Go, and Rust.

```mermaid
flowchart TD
    subgraph BrowserClient["Browser Developer Environment (developer.tumgroup.com)"]
        UI["Modern Next.js 15 UI / Tailwind"]
        Monaco["Monaco Code Editor & Live JSON Runner"]
        WasmRuntime["Client-Side Wasm Sandbox (Zero Data Leakage)"]
    end

    subgraph EdgeMesh["TUM Global Edge Mesh (Cloudflare Workers / Envoy)"]
        RateLimit["Rate Limiting & Token Bucket Interceptor"]
        mTLS["mTLS / TLS 1.3 Termination"]
    end

    subgraph CoreServices["TUM Sovereign Core Services"]
        IdSvc["Identity Super-Infrastructure (/v1/identity)"]
        SocSvc["Defense Cloud Ingestion Engine (/v1/defense)"]
        PqcSvc["Post-Quantum Cryptography Service (/v1/quantum)"]
        WorkSvc["Agentic WorkOS Gateway (/v1/workos)"]
    end

    BrowserClient --> EdgeMesh
    EdgeMesh --> CoreServices
```

---

## 2. Interactive API Playground Specifications

The developer sandbox provides live interactive execution for five core sovereign capabilities:

---

### Endpoint 1: Sovereign MRZ & ePassport Verification
* **Method & Path:** `POST /v1/identity/verify-mrz`
* **Description:** Parses and validates ICAO Doc 9303 Machine Readable Zone (MRZ) TD3 (Passports) and TD1/TD2 (ID cards), verifying Modulo 10, 7-3-1 weighting checksums, and expiration validity.
* **Sandbox Request Schema:**
```json
{
  "document_type": "TD3",
  "mrz_line1": "P<THASOMCHAI<<CHAIYAPHUM<<<<<<<<<<<<<<<<<<<",
  "mrz_line2": "AA01234567THA9001015M3001012110050012345610"
}
```
* **Sandbox Response Schema:**
```json
{
  "status": "VALID",
  "document_number": "AA0123456",
  "document_number_checksum_valid": true,
  "issuing_state": "THA",
  "nationality": "THA",
  "birth_date": "1990-01-01",
  "birth_date_checksum_valid": true,
  "sex": "MALE",
  "expiry_date": "2030-01-01",
  "expiry_date_checksum_valid": true,
  "personal_number": "1100500123456",
  "composite_checksum_valid": true,
  "execution_time_ms": 1.45,
  "quantum_tamper_seal": "ntk_pqc_mldsa87_9f8a84c2..."
}
```

---

### Endpoint 2: Zero-Knowledge Privacy Age & Solvency Proof
* **Method & Path:** `POST /v1/identity/zkp/issue-age-proof`
* **Description:** Issues a Pedersen Commitment and Non-Interactive Zero-Knowledge (NIZK) Schnorr-Fiat-Shamir proof confirming an individual is $\ge 20$ years old without disclosing the citizen ID, full name, or birthdate.
* **Sandbox Request Schema:**
```json
{
  "subject_secret_birthdate": "2000-05-15",
  "minimum_required_age": 20,
  "current_timestamp_utc": 1793520000,
  "client_blinding_nonce": "9e1c3a7f8b2d4e6a0c5b8d1f2e4a6c8e"
}
```
* **Sandbox Response Schema:**
```json
{
  "proof_status": "PROVEN_VALID",
  "assertion": "AGE_GREATER_THAN_OR_EQUAL_TO_THRESHOLD",
  "pedersen_commitment": "0x4a9f8b1c2d3e...",
  "nizk_proof_token": "zkp_tum_age20_a8f9c1e7b2d4...",
  "disclosed_attributes": {
    "is_adult": true
  },
  "raw_pii_leaked": false,
  "pdpa_compliance_guarantee": "ZERO_PII_TRANSMITTED"
}
```

---

### Endpoint 3: Zero-Allocation High-Throughput Telemetry Ingestion
* **Method & Path:** `POST /v1/defense/telemetry/ingest`
* **Description:** Streams Syslog or JSON security events directly into the lock-free RingBuffer ingestion pipeline.
* **Headers:** `X-TUM-Tenant-Key: sec_live_...` | `Content-Type: application/json`
* **Sandbox Request Schema:**
```json
{
  "events": [
    {
      "source_ip": "192.168.1.105",
      "destination_ip": "10.0.0.1",
      "destination_port": 443,
      "protocol": "TCP",
      "process_name": "powershell.exe",
      "command_line": "powershell.exe -enc SQBFAFgA...",
      "timestamp": "2026-11-01T08:00:00.124Z"
    }
  ]
}
```
* **Sandbox Response Schema:**
```json
{
  "status": "INGESTED",
  "ingested_count": 1,
  "queue_latency_us": 42,
  "risk_attribution": {
    "score": 98,
    "severity": "CRITICAL",
    "threat_category": "SUSPICIOUS_ENCODED_POWERSHELL",
    "mitre_technique": "T1059.001",
    "action_taken": "ACTIVE_ISOLATION_TRIGGERED"
  },
  "merkle_worm_block_height": 1840291,
  "merkle_batch_root": "0x5e8c1b9a..."
}
```

---

### Endpoint 4: NIST FIPS 204 Quantum e-Seal Generation
* **Method & Path:** `POST /v1/quantum/pqc-seal`
* **Description:** Generates a dual-envelope hybrid legal seal combining ML-DSA-87 (CRYSTALS-Dilithium Category 5) and Ed25519 over arbitrary enterprise document hashes.
* **Sandbox Request Schema:**
```json
{
  "document_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
  "signatory_entity_id": "TUM-GOV-ID-00918",
  "algorithm_mode": "HYBRID_FIPS204_ED25519"
}
```
* **Sandbox Response Schema:**
```json
{
  "status": "SEALED",
  "hybrid_envelope": {
    "classical_algorithm": "Ed25519",
    "classical_signature": "7a8b9c...",
    "pqc_algorithm": "NIST_FIPS_204_ML_DSA_87",
    "pqc_signature": "91a2b3c4d5e6f7a8b9c0d1e2...",
    "combined_token": "seal_tum_pqc_hybrid_98a7c1e..."
  },
  "rfc3161_timestamp": "2026-11-01T08:00:01.002Z",
  "legal_validity": "ETSI_EN_319_QUALIFIED_ELECTRONIC_SEAL"
}
```

---

### Endpoint 5: Delegated Agent Credential (DAC) Minting
* **Method & Path:** `POST /v1/workos/agents/mint-dac`
* **Description:** Issues a cryptographically scoped delegation token authorizing an autonomous AI agent to execute transactions on behalf of an executive within exact monetary and scope limits.
* **Sandbox Request Schema:**
```json
{
  "human_authorizer_id": "usr_exec_pasit_01",
  "delegate_agent_id": "agent_procure_bot_7",
  "delegated_scope": "PROCUREMENT_P2P_3WAY_MATCH",
  "max_transaction_limit_thb": 500000.00,
  "valid_until_epoch": 1793550000,
  "ebpf_sandbox_enforced": true
}
```
* **Sandbox Response Schema:**
```json
{
  "dac_token": "dac_tum_agent_7f8a9b1c2d3e4f...",
  "quantum_signature": "fips204_mldsa65_3a9e1c...",
  "execution_boundary": {
    "ip_allowlist": ["10.200.0.0/16"],
    "permitted_verbs": ["POST /v1/erp/invoices/match", "POST /v1/erp/payments/release"],
    "forbidden_syscalls": ["fork", "execve", "raw_socket"]
  },
  "revocation_uri": "https://director.tumgroup.com/v1/dac/revoke/dac_tum_agent_7f8a9b"
}
```

---

## 3. Multi-Language Quickstart Guides

Developers can integrate with TUM in 5 lines of code across all modern stacks:

### 1. cURL Quickstart
```bash
# Verify passport MRZ TD3 via cURL
curl -X POST https://api.tumgroup.com/v1/identity/verify-mrz \
  -H "Authorization: Bearer ntk_test_sandbox_token" \
  -H "Content-Type: application/json" \
  -d '{
    "document_type": "TD3",
    "mrz_line1": "P<THASOMCHAI<<CHAIYAPHUM<<<<<<<<<<<<<<<<<<<",
    "mrz_line2": "AA01234567THA9001015M3001012110050012345610"
  }'
```

### 2. TypeScript / Node.js Quickstart
```typescript
import { TumClient } from '@tum/sdk';

const tum = new TumClient({ apiKey: process.env.TUM_API_KEY });

async function verifyCitizenAndSeal() {
  // 1. Verify Thai Citizen ID Modulo 11
  const idResult = await tum.identity.verifyThaiId({
    citizenId: '1100500123456',
    laserCode: 'JT0-1234567-89'
  });
  console.log(`Identity Status: ${idResult.isValid}`);

  // 2. Issue NIST FIPS 204 Quantum Seal
  const seal = await tum.quantum.createHybridSeal({
    documentHash: 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  });
  console.log(`Quantum Seal: ${seal.combinedToken}`);
}

verifyCitizenAndSeal();
```

### 3. C# (.NET 8/10 Native AOT) Quickstart
```csharp
using Tum.Log.Engine;
using Tum.Quantum.Engine;

// Zero-allocation high-speed ingestion client
var client = new TumSocsClient(new TumClientOptions {
    Endpoint = "https://ingest.tumsocs.com",
    TenantToken = "sec_live_a89f71c..."
});

// Stream security telemetry with sub-millisecond risk attribution
var riskReport = await client.IngestAndEvaluateAsync(new SecurityEvent {
    SourceIp = "192.168.1.105",
    CommandLine = "powershell.exe -enc ...",
    Timestamp = DateTimeOffset.UtcNow
});

Console.WriteLine($"Risk Score: {riskReport.RiskScore}/100, Action: {riskReport.ActionTaken}");
```

### 4. Python (Data Science & SecOps) Quickstart
```python
import os
from tum_sdk import TumSovereignClient

client = TumSovereignClient(api_key=os.environ["TUM_API_KEY"])

# Zero-Knowledge Age Proof Assertion
proof = client.identity.verify_zkp_age(
    commitment_token="zkp_tum_age20_a8f9c1e7b2d4",
    threshold_age=20
)

print(f"Citizen is adult (>= 20): {proof.is_valid}. Zero PII leaked: {proof.zero_pii_guarantee}")
```

### 5. Go (Cloud-Native Infrastructure) Quickstart
```go
package main

import (
	"context"
	"fmt"
	"github.com/tum-holdings/tum-go-sdk/workos"
)

func main() {
	client := workos.NewClient("sec_live_key_9981")
	dac, err := client.MintDelegatedCredential(context.Background(), workos.MintOptions{
		AuthorizerID: "usr_exec_pasit_01",
		AgentID:      "agent_procure_bot_7",
		Scope:        "PROCUREMENT_P2P_3WAY_MATCH",
		MaxLimitTHB:  500000.00,
	})
	if err != nil {
		panic(err)
	}
	fmt.Printf("Issued Quantum DAC: %s\n", dac.Token)
}
```

---

## 4. Complete Documentation Sitemap

```
developer.tumgroup.com/
├── 📚 Getting Started
│   ├── Overview & Sovereign Architecture
│   ├── 3-Minute Quickstart (All Languages)
│   ├── Authentication & API Key Management
│   └── SDKs & Official Libraries (TS, C#, Python, Go, Rust)
├── 🪪 Identity Super-Infrastructure (TUM Trust Fabric)
│   ├── Thai Citizen ID (DOPA Modulo 11 & Laser Code)
│   ├── International Passports (ICAO Doc 9303 TD1/TD2/TD3)
│   ├── Mobile Driving Licenses (ISO/IEC 18013-5 mDL)
│   ├── 3D Presentation Attack Detection (ISO 30107 Level 2)
│   └── Zero-Knowledge Privacy Fabric (Pedersen Commitments)
├── 🛡️ Post-Quantum Defense Cloud (TUMSocs / OpenSIEM)
│   ├── High-Throughput Ingestion (8.8M EPS Benchmark Harness)
│   ├── Native SigmaHQ Rule Compilation Engine
│   ├── Dynamic Risk Pipeline & Active Isolation
│   ├── ClickHouse & DuckDB OLAP Columnar Sink Adapters
│   └── Cryptographic WORM Ledger (Thai Computer Crimes Act Sec 26)
├── ⚛️ Post-Quantum Cryptography (TUM Quantum)
│   ├── NIST FIPS 204 (ML-DSA / CRYSTALS-Dilithium) Implementation
│   ├── NIST FIPS 203 (ML-KEM / CRYSTALS-Kyber) Key Exchange
│   ├── Hybrid Permissive Dual-Envelope Migration Guide
│   └── Quantum Readiness Audit Tooling
├── 🏛️ Enterprise Operating System (TUM Agentic WorkOS)
│   ├── Autonomous Workforce Directory
│   ├── Autonomous 3-Way P2P Matching Engine
│   ├── Delegated Agent Credentials (DAC) Specification
│   ├── eBPF Runtime Sandbox Guardrails
│   └── SAP S/4HANA & Salesforce Bi-Directional Adapters
├── 🎮 Interactive Sandbox & API Playground
│   ├── In-Browser WebAssembly Passport Parser
│   ├── Interactive SigmaHQ Rule Simulator
│   ├── Live ZKP Age & Solvency Proof Generator
│   └── Quantum Signature Verifier Tool
└── 🤝 Governance & Community
    ├── Engineering Standards & Git Flow
    ├── Contributing to OpenSIEM (Good First Issues)
    └── Security Vulnerability Disclosure & Bug Bounty
```

---

## 5. Developer Guild Contribution & Verification Guidelines

* **Issue Tracking:** GitHub Issues with standardized PR prefixes (`feat:`, `fix:`, `perf:`, `security:`).
* **Automated CI/CD Gates:**
  1. Unit Test Coverage $\ge 85\%$ across all runtimes (.NET 8/10, Node 22, Python 3.12).
  2. Zero SonarQube Blocker or Critical CVEs.
  3. Strict Benchmark Regression Test: No PR merged if hot-path allocation increases by $>0$ bytes.
