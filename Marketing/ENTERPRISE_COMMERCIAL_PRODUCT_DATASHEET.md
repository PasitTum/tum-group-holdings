# 🏛️ TUM Group Holdings — Enterprise Commercial Product Datasheet
**Document Reference:** TUM-MKT-2026-DS-001  
**Classification:** Commercial in Confidence / Enterprise Client Facing  
**Version:** 2.0 (Post-Productization Overhaul)  
**Effective Date:** 10 พฤศจิกายน 2026  

---

## Executive Summary (บทสรุปสำหรับผู้บริหาร)

กลุ่มบริษัท **TUM Group Holdings Co., Ltd.** ส่งมอบโซลูชันด้านความมั่นคงปลอดภัยทางดิจิทัล วิทยาการรหัสลับขั้นสูง และระบบปฏิบัติการองค์กรอัตโนมัติในรูปแบบ **Turnkey Commercial Appliances & Native Multi-Platform Applications** ที่พร้อมติดตั้งและใช้งานได้ทันที (Ready-to-Deploy) ปราศจากการพึ่งพา Cloud ภายนอก (100% On-Premise & Data Sovereignty)

---

## 1. TUM Trust Security Suite: Kiosk & Hardware Identity
**ผู้รับผิดชอบ:** TUM Trust Security Co., Ltd.  
**กลุ่มเป้าหมาย:** สถาบันการเงิน, โรงงานผลิตตู้บริการอัตโนมัติ, ผู้บริหารระบบอาคารอัจฉริยะ, ท่าอากาศยาน

### 1.1 ภาพรวมผลิตภัณฑ์ (Product Overview)
ชุดซอฟต์แวร์ควบคุมและเชื่อมต่ออุปกรณ์ฮาร์ดแวร์ยืนยันตัวตนระดับมาตรฐานสากล ทำงานในรูปแบบ **Windows Background Service Daemon** พร้อมระบบ **Electron Multi-Platform Diagnostics Tool** ที่ช่วยให้ช่างเทคนิคหน้าตู้สามารถตรวจเช็กสถานะเซ็นเซอร์, เครื่องอ่านสมาร์ตการ์ด, และกล้องตรวจจับใบหน้าได้ทันที

### 1.2 ฟีเจอร์หลัก (Key Enterprise Features)
- **DOPA Smart Card HAL:** อ่านและตรวจสอบความถูกต้องของชิปบัตรประชาชนไทย (APDU command set) ตามมาตรฐาน ม.17 ด้วยความเร็ว < 1.0 วินาที
- **ICAO 9303 ePassport MRZ & NFC Engine:** ถอดรหัส Machine Readable Zone (TD1, TD2, TD3) และอ่านข้อมูลชิปไร้สาย NFC (Passive & Active Authentication)
- **Presentation Attack Detection (PAD):** ระบบตรวจสอบใบหน้าชีวมิติป้องกันการปลอมแปลง (Liveness Detection) ตามมาตรฐาน ISO/IEC 30107 ป้องกันภาพถ่าย, วิดีโอบนหน้าจอ, และหน้ากากซิลิโคน 3D
- **Resilient Auto-Recovery:** ระบบตรวจจับการหลุดของการเชื่อมต่อพอร์ต USB และสายสัญญาณ พร้อมกลไก Reconnect อัตโนมัติในระดับมิลลิวินาทีโดยไม่ทำให้ตู้ Kiosk ค้าง

### 1.3 ความต้องการของระบบ (System Requirements)
- **OS:** Windows 10/11 IoT Enterprise (x64), Ubuntu Linux 22.04 LTS (x64/ARM64)
- **Memory:** ขั้นต่ำ 4 GB RAM (แนะนำ 8 GB RAM)
- **Interface:** USB 2.0/3.0 สำหรับเครื่องอ่าน PC/SC CCID, กล้อง UVC/DirectShow
- **Form Factor:** MSI Installer สำหรับ Windows Service / AppImage สำหรับ Linux

---

## 2. TUMQuantum Gateway Appliance
**ผู้รับผิดชอบ:** TUMQuantum Co., Ltd.  
**กลุ่มเป้าหมาย:** โครงสร้างพื้นฐานสำคัญ (CII), ธนาคารพาณิชย์, หน่วยงานความมั่นคงภาครัฐ

### 2.1 ภาพรวมผลิตภัณฑ์ (Product Overview)
แอพพลายแอนซ์สลับสัญญาณความปลอดภัยยุคหลังควอนตัม (Post-Quantum Cryptography Reverse Proxy Gateway) บรรจุในรูปแบบ Docker Container สำเร็จรูป ติดตั้งคั่นหน้า Web Server หรือ API Gateway เดิมขององค์กร เพื่อยกระดับการแลกเปลี่ยนคีย์และลายมือชื่อสู่มาตรฐานสากล NIST ยุคใหม่ทันทีโดยไม่ต้องแก้ซอร์สโค้ดของแอปพลิเคชันหลัก

### 2.2 ฟีเจอร์หลัก (Key Enterprise Features)
- **NIST FIPS 203 (ML-KEM):** การแลกเปลี่ยนคีย์ลับแบบ Quantum-Safe Key Encapsulation Mechanism (ML-KEM-512, 768, 1024)
- **NIST FIPS 204 (ML-DSA):** การลงลายมือชื่อดิจิทัลต้านทานคอมพิวเตอร์ควอนตัม (ML-DSA-44, 65, 87)
- **Constant-Time Cryptographic Execution:** อัลกอริทึม SHAKE-256 และ Lattice Vector Math ผ่านการทดสอบ Timing Analysis การันตีไร้ช่องโหว่ Side-Channel Leakage
- **Permissive Hybrid Migration Mode:** รองรับการเชื่อมต่อพร้อมกันทั้ง Classical TLS (RSA/ECDSA) และ Quantum TLS (ML-KEM) ในช่วงเปลี่ยนผ่าน

### 2.3 ความต้องการของระบบ (System Requirements)
- **Environment:** Docker Engine 24+ / Kubernetes Helm Chart 3+
- **CPU:** 4 vCPU รองรับคำสั่ง AVX2 / AVX-512
- **Memory:** 4 GB RAM

---

## 3. TUMSocs All-in-One Enterprise SIEM Appliance
**ผู้รับผิดชอบ:** TUMSocs Co., Ltd.  
**กลุ่มเป้าหมาย:** ศูนย์ปฏิบัติการความปลอดภัย (SOC), องค์กรที่ต้องปฏิบัติตาม พ.ร.บ.คอมพิวเตอร์ ม.26, ISO 27001

### 3.1 ภาพรวมผลิตภัณฑ์ (Product Overview)
ศูนย์รวมระบบเฝ้าระวังภัยคุกคามทางไซเบอร์และการจัดการข้อมูลจราจรทางคอมพิวเตอร์ครบวงจรในหนึ่งเดียว บรรจุ Collector, Columnar Lakehouse Storage, Rule Evaluator, และ Real-time Electron/React Monitoring HUD เข้าด้วยกัน รองรับการติดตั้งแบบ On-Premise ในเวลาไม่เกิน 15 นาที

### 3.2 ฟีเจอร์หลัก (Key Enterprise Features)
- **High-Throughput Ingestion:** รองรับการรับสตรีม Syslog, Windows Event Forwarding, eBPF Telemetry ระดับ 50,000 – 100,000 EPS ต่อเนื่อง
- **ClickHouse Columnar Storage:** จัดเก็บและบีบอัดข้อมูลจราจรประหยัดพื้นที่กว่า 70% รองรับการค้นหาย้อนหลัง 90 วันตาม พ.ร.บ.คอมพิวเตอร์ ม.26
- **Native Sigma Rule Engine:** ตรวจจับพฤติกรรมบุกรุกตามกรอบ MITRE ATT&CK แบบเรียลไทม์
- **Multi-Tenant & Licensing Core:** ระบบจัดการสิทธิ์การเข้าถึงข้อมูลแยกบริษัทย่อย (Tenant Segregation) และการบริหารไลเซนส์ตามจำนวนโหนด

### 3.3 ความต้องการของระบบ (System Requirements)
- **Hardware Appliance:** 8 vCPU, 16 GB RAM, SSD NVMe Storage สำหรับ Hot/Warm Tier
- **Client Console:** Electron Desktop App สำหรับ Windows 11 และ macOS

---

## 4. TUM Agentic WorkOS Enterprise Edition
**ผู้รับผิดชอบ:** TUM Agentic Operations  
**กลุ่มเป้าหมาย:** ฝ่ายบัญชีและการเงินองค์กร, บริษัทตรวจสอบบัญชี, องค์กรที่มีการจัดซื้อจัดจ้างปริมาณสูง

### 4.1 ภาพรวมผลิตภัณฑ์ (Product Overview)
ระบบปฏิบัติการองค์กรอัตโนมัติที่ช่วยลดภาระงานตรวจสอบบัญชีและการจัดการภาษี ผสานระบบกระทบยอดใบสั่งซื้อและใบส่งสินค้าอัตโนมัติ (P2P 3-Way Match) เข้ากับโมดูลจัดทำใบกำกับภาษีอิเล็กทรอนิกส์ (e-Tax Invoice XML) พร้อมหน้าจออนุมัติจ่ายเงินสำหรับผู้บริหารการเงิน (Human-in-the-Loop Approval UI)

### 4.2 ฟีเจอร์หลัก (Key Enterprise Features)
- **Autonomous P2P 3-Way Reconciliation:** ตรวจสอบความถูกต้องระหว่าง Purchase Order (PO), Goods Receipt Note (GRN), และ Vendor Invoice ด้วยเกณฑ์ความคลาดเคลื่อน 0.00%
- **Thai Revenue e-Tax XML Engine:** สร้างไฟล์ XML ใบกำกับภาษีตามมาตรฐาน ขมธอ. (ETDA v2.1) พร้อมระบบประทับลายมือชื่อดิจิทัล PKCS#7 / XAdES
- **Human-in-the-Loop Approval Dashboard:** หน้าจอ Web UI ที่ออกแบบเรียบหรู ปราศจากความซับซ้อน ช่วยให้ผู้มีอำนาจตรวจสอบและกดอนุมัติการเบิกจ่ายได้ทันที

---
**ติดต่อฝ่ายขายองค์กร:**  
Email: enterprise@tumgroup.holdings | Phone: +66 (0) 2-000-0000  
TUM Group Holdings Co., Ltd.
