# คู่มือปฏิบัติการของผู้บริหาร: การจดโดเมนเนมและตั้งค่า GitHub Organization ทางการ
## Executive Operational Action Guide: Sovereign Domains, DNS & GitHub Setup
**รหัสเอกสาร:** `TUM-EXEC-GUIDE-DOMAINS-GITHUB-2026`  
**เป้าหมาย:** ชี้แจงขั้นตอนทีละสเต็ป (Step-by-Step) เพื่อให้ท่านประธานและทีมไอทีผู้บริหารสามารถปลดล็อก Blocker เร่งด่วน (Priority 1) ได้ทันทีในเวลาไม่เกิน 15-30 นาที

---

## 1. การจดทะเบียนโดเมนเนมทางการผ่าน Cloudflare Registrar (ประมาณ 10 นาที)

### 1.1 รายชื่อโดเมนเนมเป้าหมายที่ต้องกดสั่งซื้อ:
1. `tumgroup.com` — พอร์ทัลหลักของกลุ่มบริษัท (Global Corporate Portal)
2. `tumworkos.com` — หน้าผลิตภัณฑ์ Autonomous AI WorkOS & ERP
3. `tumsocs.com` — หน้าผลิตภัณฑ์ CyberMesh Defense Cloud & OpenSIEM
4. `tumtrust.io` — หน้าโครงสร้างพื้นฐาน National Digital Identity & Legal Notary

### 1.2 ขั้นตอนการสั่งซื้อ:
1. ล็อกอินเข้าสู่แดชบอร์ด **[Cloudflare Dashboard](https://dash.cloudflare.com/)**
2. ไปที่เมนูซ้ายมือ: **Domain Registration** $\rightarrow$ **Register Domains**
3. ค้นหาชื่อโดเมนเนมข้างต้นและกด **Purchase** (ระบบ Cloudflare จำหน่ายตามราคาทุนจริง ไม่มีค่า Markup รายปี)
4. เลือกระยะเวลาถือครอง (แนะนำ 2-5 ปี) พร้อมเปิดฟังก์ชัน **WHOIS Privacy (ฟรี)** และ **Auto-Renew**

---

## 2. การตั้งค่าระเบียน DNS (DNS Records Architecture)

เมื่อจดโดเมนเนมบน Cloudflare เรียบร้อย ให้ไปที่แท็บ **DNS** $\rightarrow$ **Records** และเพิ่มระเบียนดังต่อไปนี้:

### ตารางระเบียน DNS สำหรับ `tumgroup.com`:
| Type | Name / Host | Content / Target | Proxy Status | คำอธิบาย |
| :---: | :---: | :---: | :---: | :--- |
| **A** | `@` (Root) | `192.0.2.1` (หรือ IP เซิร์ฟเวอร์ Landing Page) | Proxied (ส้ม ☁️) | เว็บไซต์หลักของกลุ่มบริษัท |
| **CNAME** | `www` | `tumgroup.com` | Proxied (ส้ม ☁️) | ซิงค์ www ไปยัง root |
| **CNAME** | `developer` | `tum-developer-portal.pages.dev` | Proxied (ส้ม ☁️) | พอร์ทัลนักพัฒนาและเอกสาร API |
| **CNAME** | `api` | `gateway.tumgroup.com` | Proxied (ส้ม ☁️) | ศูนย์รวม API Gateway กลาง |
| **CNAME** | `director` | `director-cloud.tumgroup.com` | Proxied (ส้ม ☁️) | Sovereign AgentOS Control Plane |
| **TXT** | `@` | `v=spf1 include:_spf.google.com ~all` | DNS Only | อีเมลองค์กรความปลอดภัย SPF |

> **ข้อแนะนำความปลอดภัย:** เปิดใช้งานฟังก์ชัน **DNSSEC (One-Click Enable)** ใน Cloudflare เพื่อป้องกันการปลอมแปลง DNS ระดับสากล

---

## 3. การเปิดบัญชีองค์กร GitHub Enterprise Organization (ประมาณ 5 นาที)

### 3.1 ขั้นตอนการสร้างองค์กร:
1. เข้าไปที่ **[GitHub New Organization](https://github.com/account/organizations/new)**
2. ตั้งชื่อ Organization Account Name: **`tum-holdings`** (หรือ `tum-group-holdings`)
3. ระบุ Contact Email ขององค์กร: (เช่น `admin@tumgroup.com` หรืออีเมลของท่านประธาน)
4. เลือกแพ็กเกจ (เริ่มต้นด้วย Free หรือ Team เพื่อเปิดเป็น Public Open Source)

### 3.2 ขั้นตอนการโอนย้าย Repositories สู่องค์กรทางการ:
ทีมวิศวกรรมได้เตรียมซอร์สโค้ดไว้สะอาด 100% พร้อมให้สั่งย้าย (Transfer) จากโปรไฟล์ส่วนตัวของท่านประธาน (`https://github.com/PasitTum/...`) เข้าสู่องค์กรใหม่ได้ในคลิกเดียว:
1. เปิดหน้าแต่ละ Repository (เช่น `tum-agentic-workos`) $\rightarrow$ เข้า **Settings**
2. เลื่อนลงล่างสุดไปที่ **Danger Zone** $\rightarrow$ กดปุ่ม **Transfer repository**
3. ระบุเป้าหมาย: `tum-holdings` แล้วกดยืนยัน

### 3.3 การสร้าง Team และกำหนดสิทธิ์:
- **`core-maintainers`:** สิทธิ์ Admin สำหรับผู้ดูแลสถาปัตยกรรมกลาง
- **`marketing-gtm`:** สิทธิ์ Write สำหรับเอกสารประชาสัมพันธ์และ Portal
- **`public-community`:** สิทธิ์ Read สำหรับนักพัฒนาภายนอก (เมื่อเปิด Public)

---

## 4. การเคลมชื่อบัญชีโซเชียลมีเดียทางการ (Social Media Brand Ownership)

1. **LinkedIn Company Page:**
   - เข้า [LinkedIn Company Create](https://www.linkedin.com/company/setup/new/)
   - ตั้งชื่อหน้าเพจ: **TUM Group Holdings**
   - URL: `linkedin.com/company/tum-group-holdings`
   - ใส่โลโก้และคำอธิบายตามข้อความใน [`PUBLIC_LAUNCH_PRESS_RELEASE.md`](file:///D:/TUM/tum-group-holdings/Marketing/PUBLIC_LAUNCH_PRESS_RELEASE.md)
2. **X (Twitter) Corporate Profile:**
   - สมัครหรือเปลี่ยน Handle เป็น: **`@TUMGroupHQ`** หรือ **`@TUMHoldings`**
   - ยื่นขอตราสัญลักษณ์องค์กรยืนยันตัวตน (Verified Organization)

---
**จัดทำโดย:** คณะทำงานกลาง Enterprise Working Group (EWG)  
TUM Group Holdings
