# 💼 TUM Group Holdings — Enterprise Pricing Policy & SLA Terms
**Document Reference:** TUM-MKT-2026-PRC-001  
**Classification:** Commercial in Confidence / Enterprise Client Facing  
**Version:** 1.0  
**Effective Date:** 10 พฤศจิกายน 2026  

---

## 1. ปรัชญาการคิดราคาเชิงพาณิชย์ (Pricing Philosophy)

TUM Group Holdings ยึดมั่นในนโยบาย **"โปร่งใส คาดการณ์ได้ และปราศจากค่าใช้จ่ายแอบแฝง (Transparent, Predictable & No Ingestion Tax)"** เพื่อแก้ปัญหาที่องค์กรธุรกิจมักเผชิญจากผู้ให้บริการต่างชาติ (เช่น Splunk หรือ Cloud SIEM ที่เก็บค่าบริการตามปริมาณกิกะไบต์ของ Log จนงบบานปลาย)

---

## 2. ตารางแพ็กเกจราคาผลิตภัณฑ์ (Product Pricing Tiers)

### 2.1 TUM Trust Security (Kiosk Hardware Identity Suite)
- **Community / Dev Sandbox:** ฟรีสำหรับการพัฒนาในห้องทดสอบ (จำกัด 1 เครื่องอ่าน)
- **Standard Kiosk Edition:** 15,000 บาท / ตู้ Kiosk / ปี (รวมสิทธิ์ใช้งาน Windows Service + Electron Diagnostics Tool + อัปเดตไดรเวอร์)
- **High-Security Banking & Border Edition:** 45,000 บาท / ตู้ Kiosk / ปี (รวมฟีเจอร์ ICAO ePassport + 3D Biometric Anti-Spoofing PAD + บริการ Support 24x7)

### 2.2 TUMQuantum Gateway Appliance
- **Evaluation License:** ฟรี 60 วัน สำหรับการทำ PoC ในสภาพแวดล้อมจำลอง
- **Enterprise PQC Gateway:** 280,000 บาท / Instance / ปี (รองรับได้สูงสุด 50 Web Domains หลังเกตเวย์ พร้อมการสลับคีย์ FIPS 203/204 ไม่จำกัดจำนวนครั้ง)
- **National Defense & CII License:** สัญญาแบบไม่จำกัดจำนวนโหนด (Site License) พร้อมการรับประกันด้านวิศวกรรมเฉพาะทาง (ติดต่อฝ่ายขาย)

### 2.3 TUMSocs Enterprise OpenSIEM Appliance
- **Node-Based Flat Rate (เหมาจ่ายรายโหนด):** 1,200 บาท / เครื่องเซิร์ฟเวอร์ / เดือน (ส่ง Log ได้ไม่จำกัด GB ไม่มีค่าใช้จ่ายส่วนเกินตามปริมาณข้อมูล)
- **All-in-One Appliance License:** 350,000 บาท / Cluster / ปี (รวม Ingestion Engine, ClickHouse, และ Web/Electron HUD)
- **Managed SOC Add-On:** เพิ่มเติมตามระดับความต้องการของศูนย์ปฏิบัติการ

### 2.4 TUM Agentic WorkOS & e-Tax Engine
- **Standard ERP Integration:** 120,000 บาท / ปี (รวมโมดูล P2P 3-Way Match และสิทธิ์การใช้งาน Web Admin Console สูงสุด 20 บัญชีผู้ใช้)
- **Enterprise e-Tax Unlimited:** 180,000 บาท / ปี (ออกใบกำกับภาษีอิเล็กทรอนิกส์ XML ETDA v2.1 และส่งมอบกรมสรรพากรไม่จำกัดจำนวนใบ)

---

## 3. ระดับการให้บริการและการรับประกัน (Service Level Agreements - SLA)

| ระดับความรุนแรง (Severity) | คำจำกัดความ (Definition) | เวลาตอบกลับขั้นต่ำ (Response SLA) | เวลาแก้ไขปัญหาเบื้องต้น (Resolution Target) |
| :--- | :--- | :---: | :---: |
| **Severity 1 (Critical)** | ระบบหลักล่มโดยสมบูรณ์ ไม่สามารถยืนยันตัวตนหรือบันทึก Log ได้ | **&le; 15 นาที** | **&le; 2 ชั่วโมง** |
| **Severity 2 (High)** | ฟังก์ชันสำคัญทำงานผิดพลาดบางส่วน แต่ระบบโดยรวมยังให้บริการได้ | **&le; 1 ชั่วโมง** | **&le; 8 ชั่วโมง** |
| **Severity 3 (Medium)** | ปัญหาการใช้งานทั่วไป หรือฟังก์ชันที่ไม่กระทบต่อการให้บริการหลัก | **&le; 4 ชั่วโมง** | **&le; 24 ชั่วโมง** |
| **Severity 4 (Low)** | คำขอข้อมูลทางเทคนิค คำแนะนำการปรับแต่ง หรือข้อเสนอแนะ | **&le; 8 ชั่วโมง** | **ตามรอบอัปเดตถัดไป** |

---

## 4. ช่องทางการติดต่อฝ่ายบริการลูกค้าองค์กร (Enterprise Support Contacts)

- **Dedicated Helpdesk Portal:** `https://support.tumgroup.holdings`
- **Emergency Incident Hotline (24/7/365):** +66 (0) 2-000-0099
- **Enterprise Support Email:** `enterprise-support@tumgroup.holdings`
