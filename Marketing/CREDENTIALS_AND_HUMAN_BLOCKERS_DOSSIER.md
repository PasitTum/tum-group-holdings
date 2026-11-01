# 🚨 TUM GROUP HOLDINGS — CREDENTIALS & HUMAN BLOCKERS DOSSIER
**Document Code:** `TUM-EXEC-DOSSIER-BLOCKERS-2026`  
**Classification:** Board Level / Strictly Confidential — Requires Human Executive Action  
**Target Action Takers:** Chairman of the Board (Khun Pasit), Group Chief Executive Officer (CEO), Legal Counsel, CFO  
**Status:** ACTION REQUIRED PRIOR TO GLOBAL BROADCAST 🛑  
**Author:** Chief Marketing & Commercialization Officer (CMO), TUM Group Holdings  

---

```
  ██████╗ ██╗      ██████╗  ██████╗██╗  ██╗███████╗██████╗ ███████╗
  ██╔══██╗██║     ██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗██╔════╝
  ██████╔╝██║     ██║   ██║██║     █████╔╝ █████╗  ██████╔╝███████╗
  ██╔══██╗██║     ██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗╚════██║
  ██████╔╝███████╗╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║███████║
  ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
```

---

## 1. Executive Summary: Why Human / CEO Action is Non-Negotiable

While the TUM engineering guilds and AI autonomous systems have developed and validated the production software, architecture, documentation, and benchmark suites, **autonomous systems cannot legally or physically execute external corporate identity, financial, legal, and regulatory operations.**

This dossier lists the **exhaustive inventory of external credentials, domain assets, bank authorizations, government filings, and physical hardware requirements** that strictly require **Human / CEO Action** before public commercial launch.

---

## 2. Master Blocker Matrix (Executive Action Checklist)

| Ref # | Category | Asset / Blocker Description | Required Action Owner | Est. Budget / Cost | Lead Time | Blocker Severity |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **BLK-01** | Domain & DNS | Corporate Domain Acquisition (`tumgroup.com`, etc.) | CEO / IT Admin | $150 – $3,500 | 24 Hours | `CRITICAL 🔴` |
| **BLK-02** | DNS & CDN | Cloudflare Enterprise + DNSSEC Setup | IT Admin / CFO Card | $250 / mo | 4 Hours | `CRITICAL 🔴` |
| **BLK-03** | Social Handles | LinkedIn Company Page & Executive Verification | CEO / CMO | $0 | 2 Hours | `CRITICAL 🔴` |
| **BLK-04** | Social Handles | X (Twitter) Corporate Verified Organization (@TUMGroupHQ) | CEO / Corporate Card | $200 / mo | 48 Hours | `HIGH 🟠` |
| **BLK-05** | Community | GitHub Enterprise Org (`github.com/tum-holdings`) | CTO / CEO Card | $210 / mo | 1 Hour | `CRITICAL 🔴` |
| **BLK-06** | Developer Seed | HackerNews Official Launch Account & Karma Seeding | Lead Dev (Human) | $0 | 3 Days | `HIGH 🟠` |
| **BLK-07** | Community | Discord Community Server Vanity URL & Phone 2FA | Community Lead | $0 – $35 / mo | 2 Hours | `MEDIUM 🟡` |
| **BLK-08** | Cloud Billing | AWS / Azure GovCloud Sovereign Tenant Setup | CEO / CFO Signature | Variable ($5k pool)| 5 Days | `CRITICAL 🔴` |
| **BLK-09** | Cloud Sinks | ClickHouse Cloud Production Dedicated Cluster | CFO Card / PO | $800 / mo | 24 Hours | `HIGH 🟠` |
| **BLK-10** | GovTech Access | DOPA Production API Agreement & Ministry Clearance | CEO Pasit / Legal | Statutory / Gov MOU| 14–21 Days | `CRITICAL 🔴` |
| **BLK-11** | Cyber CNI | NCSA (สกมช.) CNI Technology Registration Notice | Legal Counsel | Formal Filing | 10 Days | `HIGH 🟠` |
| **BLK-12** | Regulatory | ETDA Electronic Seal & QTSP Compliance Filing | Legal / Compliance | $1,200 | 14 Days | `HIGH 🟠` |
| **BLK-13** | Hardware HSM | Physical Thales Luna HSM / YubiHSM2 Purchase | CFO / Procurement | $6,500 | 7 Days | `CRITICAL 🔴` |
| **BLK-14** | Code Signing | DigiCert Extended Validation (EV) Code Signing Cert | CEO Identity / Legal | $850 / yr | 3–5 Days | `CRITICAL 🔴` |
| **BLK-15** | Wire PR | PR Newswire / InfoQuest Press Distribution Blast | CMO / CFO Card | $2,500 | 24 Hours | `HIGH 🟠` |
| **BLK-16** | Email Deliver | SendGrid / Resend Dedicated IP & DMARC/DKIM/SPF | IT Admin / Card | $100 / mo | 48 Hours | `HIGH 🟠` |
| **BLK-17** | Merchant | Stripe / 2C2P Corporate Merchant Account Activation | CFO / Corporate Bank | Bank Approval | 3–5 Days | `HIGH 🟠` |
| **BLK-18** | Trademarks | DIP & WIPO Trademark Filings for TUM Brand Assets | Legal Counsel | $1,500 | Immediate | `MEDIUM 🟡` |

---

## 3. Detailed Action Specifications by Category

---

### CATEGORY 1: Domain Names, DNS & Infrastructure Security

#### Ref BLK-01: Sovereign Domain Portfolio Purchase
* **Owner:** Group CEO / Chief Information Officer
* **Action Required:**
  1. Purchase and register the primary corporate domains via Cloudflare Registrar or MarkMonitor:
     * `tumgroup.com` (Global Corporate Portal)
     * `tumgroup.holdings` (Corporate Governance & Investor Relations)
     * `tum.holdings` (Short URL)
     * `tumsocs.com` (Cyber Defense Cloud)
     * `tumtrust.io` (Identity Super-Infrastructure)
     * `tumworkos.com` (Agentic Enterprise OS)
  2. Ensure WHOIS privacy and Registrar-Lock are active.
* **Blocker Impact:** Documentation and press release URLs currently refer to these domains; live links will 404 until registered.

#### Ref BLK-02: Cloudflare Enterprise & DNSSEC Configuration
* **Owner:** IT Operations / CFO Credit Card
* **Action Required:**
  1. Create a Cloudflare Organization under `admin@tumgroup.com`.
  2. Configure Nameservers and activate DNSSEC with DS records propagated to the registrar.
  3. Deploy Edge Certificates (TLS 1.3 only, HSTS Preload, min TLS version 1.2).
  4. Point subdomains (`developer.tumgroup.com`, `sandbox.tumgroup.com`, `api.tumgroup.com`) to Cloudflare Workers and origin endpoints.
* **Blocker Impact:** Prevents Man-in-the-Middle (MitM) attacks during developer traffic and PR broadcasts.

---

### CATEGORY 2: Social Media, Community & Media Handles

#### Ref BLK-03: LinkedIn Official Corporate Page
* **Owner:** CEO Pasit / CMO
* **Action Required:**
  1. Establish official LinkedIn Company Page: `linkedin.com/company/tum-group-holdings`.
  2. Verify domain ownership via `dns-txt` or corporate email address (`pasit@tumgroup.com`).
  3. Assign executive Admin permissions to Chairman Khun Pasit and CMO.
  4. Upload high-res SVG logos, executive banners, and corporate manifesto.
* **Blocker Impact:** Cannot launch the C-level thought leadership campaign or publish the Executive Carousel.

#### Ref BLK-04: X (Twitter) Corporate Verified Organization
* **Owner:** CEO / Corporate Credit Card
* **Action Required:**
  1. Claim or take over `@TUMGroupHQ` on X.
  2. Apply for Verified Organization status (Gold Checkmark) to establish defense-grade institutional credibility.
  3. Link affiliated executive accounts (Khun Pasit, CEO, Head of Engineering).
* **Blocker Impact:** Unverified handles on X are susceptible to impersonation and phishing during a major crypto/defense launch.

#### Ref BLK-05: GitHub Enterprise Organization (`github.com/tum-holdings`)
* **Owner:** CTO / CEO Corporate Card
* **Action Required:**
  1. Create `tum-holdings` organization on GitHub.
  2. Upgrade to GitHub Enterprise Cloud to unlock SAML SSO, branch protection rules, and enterprise audit logs.
  3. Generate and securely store physical 2FA emergency recovery keys in the corporate safe.
  4. Grant write access to lead engineering service accounts.
* **Blocker Impact:** Open-source core repositories (`tum-socs`, `tum-trust-fabric`) cannot be cloned by the public until published here.

#### Ref BLK-06: HackerNews Official Account & Reputation Warming
* **Owner:** Human Engineering Lead / Founder
* **Action Required:**
  1. Ensure a legitimate human account (non-bot, non-spam) with existing comment history is designated to submit the *Show HN*.
  2. HackerNews algorithms auto-shadowban brand-new zero-karma accounts posting Show HN submissions.
  3. Prepare human engineering team to participate natively in comments.
* **Blocker Impact:** Submission will be killed or flagged by HN anti-spam filters if submitted via automated or brand-new accounts.

---

### CATEGORY 3: Cloud Infrastructure & Production Billing

#### Ref BLK-08: Sovereign Cloud Accounts (AWS / Azure)
* **Owner:** CEO / CFO Signing Authority
* **Action Required:**
  1. Establish corporate AWS and Azure commercial master billing accounts with direct invoice wire agreements.
  2. Provision primary VPCs in Singapore (`ap-southeast-1`) and regional Bangkok local zones (`ap-southeast-7`).
  3. Attach dedicated enterprise support tiers (AWS Enterprise Support) for 15-minute P1 response times.
* **Blocker Impact:** Production clusters for the interactive API playground and live telemetry sinks cannot scale without validated billing.

#### Ref BLK-09: ClickHouse Cloud Production Cluster
* **Owner:** CFO Corporate Card
* **Action Required:**
  1. Provision dedicated ClickHouse Cloud Enterprise Cluster to act as the cloud columnar sink for TUMSocs.
  2. Configure IP allowlists to accept traffic from edge defense nodes.
* **Blocker Impact:** Live demonstration of 8.8M EPS log sinks will default to local mock storage without live ClickHouse backend.

---

### CATEGORY 4: Government, National Security & Legal Authorizations

#### Ref BLK-10: DOPA (กรมการปกครอง) Production API Clearance
* **Owner:** Chairman Khun Pasit / Group CEO / Legal Counsel
* **Action Required:**
  1. Execute official Memorandum of Understanding (MOU) with the Department of Provincial Administration (DOPA), Ministry of Interior.
  2. Obtain physical DOPA Smartcard PKI tokens, IPsec VPN credentials, and production client certificates.
  3. Ensure physical security compliance audits of server environments processing Thai citizen records.
* **Blocker Impact:** The offline MRZ TD1 and Modulo 11 check digit verification works immediately in software, but direct real-time status query against the national civil registration database requires this ministerial sign-off.

#### Ref BLK-11: National Cyber Security Agency (NCSA / สกมช.) Notification
* **Owner:** Legal Counsel / CISO
* **Action Required:**
  1. Submit formal technology dossier to NCSA regarding the deployment of TUMSocs within Critical Information Infrastructure (CII) organizations.
  2. Register TUM-OpenSIEM as an approved domestic cyber defense framework under Thailand Cyber Security Act B.E. 2562 (2019).
* **Blocker Impact:** Enterprise banking and government clients require NCSA compliance certification during enterprise procurement tenders.

#### Ref BLK-12: ETDA Qualified Electronic Seal Certification
* **Owner:** Legal Counsel / Compliance Lead
* **Action Required:**
  1. Submit the NIST FIPS 204 ML-DSA-87 and hybrid envelope architecture to the Electronic Transactions Development Agency (ETDA).
  2. Obtain recognition under the Thai Electronic Transactions Act B.E. 2544 (Section 26 & 28) for qualified legal e-seals.
* **Blocker Impact:** Legal non-repudiation in Thai civil courts requires ETDA-aligned qualified trust credentials.

---

### CATEGORY 5: Cryptographic Hardware & Code Signing Assets

#### Ref BLK-13: Procurement of Physical Hardware Security Modules (HSM)
* **Owner:** CFO / Chief Cryptographer
* **Action Required:**
  1. Procure two (2) FIPS 140-3 Level 3 compliant Hardware Security Modules (Thales Luna HSM or YubiHSM 2).
  2. Conduct an official **Ceremony of Root Key Generation** attended by Khun Pasit and designated Human Key Custodians.
  3. Deposit M-of-N hardware backup smartcards into safety deposit boxes at Bangkok Bank Sathorn Branch and Kasikornbank Head Office.
* **Blocker Impact:** Root CSCA and NIST FIPS 204 Master Keys cannot legally or securely reside in software memory on commodity cloud servers.

#### Ref BLK-14: DigiCert Extended Validation (EV) Code Signing Certificate
* **Owner:** CEO Pasit (Requires Government Notarization & Video Verification)
* **Action Required:**
  1. Submit company incorporation documents, DBD certificate, and CEO passport to DigiCert or Sectigo.
  2. Receive physical USB token (Yubikey FIPS) containing the EV private key.
  3. Sign all compiled .NET Native AOT binaries, Kiosk installers, and Windows kernel eBPF drivers.
* **Blocker Impact:** Without an EV Code Signing Certificate, Windows Defender SmartScreen blocks users from downloading or running TUM binaries with a red warning banner.

---

### CATEGORY 6: Global Press Wire, Email & Commercial Merchant

#### Ref BLK-15: Commercial Press Wire Service Authorization
* **Owner:** CMO / CFO Corporate Card
* **Action Required:**
  1. Contract with PR Newswire (Cision) or InfoQuest (Thailand) for immediate wire dissemination.
  2. Provide signed authorization letter on corporate letterhead confirming Khun Pasit’s quote release.
  3. Fund the wire dissemination budget ($2,500 USD).
* **Blocker Impact:** Release remains internal markdown until transmitted across global financial news terminals (Bloomberg, Dow Jones, Reuters).

#### Ref BLK-16: Dedicated Transactional Email Deliverability Setup
* **Owner:** IT Admin / Corporate Card
* **Action Required:**
  1. Provision dedicated IP address on SendGrid or Resend.
  2. Configure DNS records: SPF (`v=spf1 include:sendgrid.net ~all`), DKIM (`k=rsa; p=...`), and DMARC (`v=DMARC1; p=reject; rua=mailto:dmarc@tumgroup.com`).
  3. Warm up the IP pool over 7 days prior to sending mass launch announcements.
* **Blocker Impact:** Prevents marketing and password-reset emails from dropping into spam folders.

#### Ref BLK-17: Corporate Payment Merchant (Stripe / 2C2P)
* **Owner:** CFO / Legal Signatory
* **Action Required:**
  1. Complete KYC verification on Stripe Thailand / 2C2P using TUM Group Holdings corporate bank account and DBD papers.
  2. Generate production API keys (`pk_live_...`, `sk_live_...`).
* **Blocker Impact:** Enterprise customers and developers cannot purchase self-serve SaaS subscriptions or cloud credits.

---

## 4. CEO Immediate Next Steps (Priority Execution Order)

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│                        IMMEDIATE 72-HOUR CEO ACTION PATH                               │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ STEP 1 (Hours 0 - 4):                                                                  │
│ • Delegate credit card authorization for Domains (Ref BLK-01) & Cloudflare (Ref BLK-02)│
│ • Instruct IT to register and claim GitHub Org 'tum-holdings' (Ref BLK-05)             │
│                                                                                        │
│ STEP 2 (Hours 4 - 24):                                                                 │
│ • Authorize DigiCert EV Code Signing Identity Verification call (Ref BLK-14)           │
│ • Approve LinkedIn Corporate Company Page & X Verified Org submission (Ref BLK-03/04)  │
│                                                                                        │
│ STEP 3 (Hours 24 - 48):                                                                │
│ • Sign PR Newswire Broadcast Authorization Form & release budget (Ref BLK-15)         │
│ • Schedule DOPA & NCSA official introductory filing with Legal Counsel (Ref BLK-10/11) │
│                                                                                        │
│ STEP 4 (Hours 48 - 72):                                                                │
│ • Authorize HSM Hardware Purchase for Root Key Ceremony (Ref BLK-13)                  │
└────────────────────────────────────────────────────────────────────────────────────────┘
```
