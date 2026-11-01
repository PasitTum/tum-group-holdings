# 🔄 TUM Continuous SDLC Operating Manual (Research ➔ Develop Loop)
**รหัสระเบียบปฏิบัติ:** `TUM-SOP-SDLC-2026-002`  
**กำกับดูแลโดย:** TUM Group Enterprise Working Group (EWG)  
**เป้าหมาย:** กำหนดมาตรฐานวงจรชีวิตการพัฒนาระบบระดับ Enterprise แบบวนซ้ำต่อเนื่อง (Continuous Innovation Cycle)

---

## 1. ปรัชญาและโครงสร้างวงจร (The Cyclic Framework)

การพัฒนาผลิตภัณฑ์ในเครือ TUM จะไม่หยุดนิ่ง แต่จะหมุนวนเป็นลูปตาม 4 ขั้นตอนอย่างเป็นระบบ:

```
                  ┌─────────────────────────────────────────┐
                  │          PHASE 1: RESEARCH              │
                  │ • ทบทวน CVEs, SOTA, มาตรฐานสากล        │
                  │ • จัดทำ Technical Specs / Math Proofs   │
                  └────────────────────┬────────────────────┘
                                       │
                                       ▼
 ┌─────────────────────────────────────────┐         ┌─────────────────────────────────────────┐
 │       PHASE 4: WORKING GROUP            │         │          PHASE 2: DEVELOP               │
 │ • สรุปผลงานต่อบอร์ดบริหาร               │         │ • Clean Architecture / Production Code  │
 │ • ประเมินผลตอบรับและเติม Backlog รอบใหม่│         │ • Type Safety & Strict Contracts        │
 └────────────────────▲────────────────────┘         └────────────────────┬────────────────────┘
                      │                                                   │
                      └───────────────────────────────────────────────────┘
                                       │
                                       ▼
                  ┌─────────────────────────────────────────┐
                  │         PHASE 3: AUDIT & VERIFY         │
                  │ • Automated Tests Coverage >= 85%       │
                  │ • Audit-TumProducts.ps1 Script Gate     │
                  │ • ปฏิเสธ Mockup / ปฏิเสธของเด็กเล่น     │
                  └─────────────────────────────────────────┘
```

---

## 2. ขั้นตอนการปฏิบัติงาน 4 เฟสในแต่ละ Sprint (Bi-Weekly Cycle)

### 🔬 Phase 1: Research & Feasibility (สัปดาห์ที่ 1, วันที่ 1-3)
- ทีม Frontier Research ทำการสำรวจเทคโนโลยี ช่องว่างทางไซเบอร์ (CVEs) หรือมาตรฐานใหม่ (เช่น NIST PQC, ICAO Doc 9303, ISO 42001)
- จัดทำ RFC (Request for Comments) และระบุความต้องการทางสถาปัตยกรรม (Architecture Blueprints)
- นำเสนอต่อ Working Group เพื่อแปลงเป็น User Stories และบรรจุลงใน Backlog

### 💻 Phase 2: Enterprise Development (สัปดาห์ที่ 1 วันที่ 4 ถึงสัปดาห์ที่ 2 วันที่ 3)
- พัฒนาโค้ดจริงใน Git Worktree แยกต่างหากผ่าน Orca
- ปฏิบัติตามหลัก Clean Architecture:
  - **Domain:** Pure Business Logic, Entities, Value Objects
  - **Application:** Use Cases, Orchestration Services, DTOs
  - **Infrastructure:** Database Adapters, Hardware Drivers, Sockets
  - **Presentation:** Modern UI Components, OpenAPI Controllers
- ห้ามเขียนสคริปต์สุ่มตัวเลข Mock เด็ดขาด ทุกฟังก์ชันต้องมี Logic คำนวณจริง

### 🛡️ Phase 3: Audit & Verification Gate (สัปดาห์ที่ 2, วันที่ 4)
- รันชุดทดสอบอัตโนมัติทั้งหมด (`dotnet test`, `npm test`)
- ตรวจสอบผ่านสคริปต์กลาง `Audit-TumProducts.ps1`
- บันทึก Coverage Scorecard หากมีโมดูลใดไม่ผ่านการทดสอบ จะถูก Block ไม่ให้ Merge สู่ `develop`

### 📢 Phase 4: Working Group Sprint Review (สัปดาห์ที่ 2, วันที่ 5)
- จัดการประชุม Working Group แสดงผลลัพธ์การทำงานจริงบนหน้าจอ Orca ให้ผู้บริหารรับชม
- สรุปว่า Sprint นี้ได้ทำอะไรไปบ้าง และมีอะไรเพิ่มขึ้นมาใหม่
- ตกผลึกประเด็นที่ค้นพบเพื่อนำกลับไปเป็นหัวข้อ Research ในรอบถัดไป
