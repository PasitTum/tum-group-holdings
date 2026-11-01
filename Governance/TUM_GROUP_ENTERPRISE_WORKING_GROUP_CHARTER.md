# 🏛️ TUM Group Enterprise Working Group (EWG) Charter
## ธรรมนูญคณะทำงานควบคุมมาตรฐานและกำหนดทิศทางผลิตภัณฑ์เครือ TUM Group Holdings
**รหัสเอกสาร:** `TUM-GOV-EWG-2026-001`  
**มีผลบังคับใช้:** 1 พฤศจิกายน 2026  
**ผู้อนุมัติ:** ท่านประธานกรรมการและประธานเจ้าหน้าที่บริหาร (Chairman & CEO)  
**ขอบเขตอำนาจ:** ครอบคลุม 8 สายผลิตภัณฑ์หลักของเครือ TUM Group Holdings ทั้งหมด

---

## 1. วัตถุประสงค์และภารกิจหลัก (Mission & Authority)

TUM Group Enterprise Working Group (EWG) ถูกจัดตั้งขึ้นภายใต้คำสั่งของท่านประธาน เพื่อทำหน้าที่เป็น **"คณะกรรมการบริหารกลาง (Central Control & Steering Authority)"** โดยมีอำนาจและหน้าที่รับผิดชอบเด็ดขาดใน 3 เสาหลัก:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 TUM GROUP ENTERPRISE WORKING GROUP (EWG)                    │
├──────────────────────────────┬──────────────────────────────┬───────────────┤
│    1. Product Inspection     │    2. Feature Direction      │ 3. Continuous │
│       & Quality Control      │       & Roadmapping          │    SDLC Cycle │
│ • ตรวจสอบสถาปัตยกรรมทุก Repo │ • กำหนดทิศทางและ Roadmap รวม │ • วงจร R&D     │
│ • ห้าม Mockup / ห้ามของเด็กเล่น│ • จัดสรร Backlog ข้ามสาย     │   Research -> │
│ • บังคับ Test Coverage > 85% │ • อนุมัติการเปิดตัวสู่ตลาด   │   Develop วนลูป│
└──────────────────────────────┴──────────────────────────────┴───────────────┘
```

1. **คอยตรวจสอบการทำงานของแต่ละ Product (Quality & Architectural Gatekeeper):**
   - ตรวจสอบโค้ด, Build Health, Type Safety, และความครอบคลุมของการทดสอบ (Automated Test Suites)
   - **นโยบาย Zero-Mockup:** ไม่อนุญาตให้ส่งมอบงานแบบ Mockup, ไฟล์ HTML โดดเดี่ยว, หรือสคริปต์หลอกๆ โดยเด็ดขาด โค้ดทุกบรรทัดต้องเป็นไปตามมาตรฐาน Clean Architecture / Hexagonal Architecture และทำงานได้จริง
2. **เป็นผู้กำหนดทิศทางการทำงานและ Feature ของแต่ละ Product (Strategic Feature Steering):**
   - ควบคุม Product Vision, Architecture Blueprints, และจัดลำดับความสำคัญของ Epics / User Stories
   - ดูแลความสอดคล้องและการทำงานร่วมกันข้ามผลิตภัณฑ์ (Cross-Product Synergy) ทั้ง 8 สายผลิตภัณฑ์
3. **กำกับดูแลวงจรการพัฒนาแบบต่อเนื่อง (Continuous Research-to-Dev SDLC):**
   - บังคับใช้วงจร **Research $\rightarrow$ Develop $\rightarrow$ Evaluate/Audit $\rightarrow$ Iterate** อย่างต่อเนื่องทุก 2 สัปดาห์ (Bi-Weekly Sprint Cadence)
   - จัดการประชุม Working Group สรุปความก้าวหน้าและการทดสอบจริงในทุก Sprint

---

## 2. โครงสร้างบุคลากรของคณะทำงานกลาง (Working Group Committee Roster)

| ตำแหน่งในคณะทำงาน | ผู้รับผิดชอบ | บทบาทหน้าที่หลัก |
| :--- | :--- | :--- |
| **Working Group Chairman** | ท่านประธาน (Chairman & CEO) | ผู้อนุมัติยุทธศาสตร์สูงสุด, ตรวจรับผลงาน และกำหนดวิสัยทัศน์ |
| **Group Chief Enterprise Architect** | Dr. Ake / Chief Architect Squad | ควบคุมสถาปัตยกรรมทางเทคนิคทุกโปรดักต์, ตรวจสอบ Code Quality Gates, ห้าม Mockup |
| **Group Head of Product & Feature Governance** | K. Somchai / Product Council | จัดการ Roadmap, ลำดับความสำคัญของ Backlog, และประสานงานข้ามโปรดักต์ |
| **Continuous SDLC & Innovation Lead** | K. Pongsak / Deep-Tech Lead | นำกระบวนการ Research เทคโนโลยีคลื่นลูกใหม่ และแปลงผลวิจัยสู่ข้อกำหนดการพัฒนา |
| **Working Group Secretariat & Audit Officer** | เลขานุการคณะทำงานกลาง | บันทึกรายงานการประชุม, รันสคริปต์ Audit ประจำ Sprint, และจัดทำ Executive Dispatch |

---

## 3. ขอบเขตการกำกับดูแล 8 สายผลิตภัณฑ์ (The 8 Managed Product Fleets)

```
[CORE SOVEREIGN INFRASTRUCTURE]
1. tum-trust-security   ── Sovereign Identity & Hardware SDK (ICAO Doc 9303, DOPA ThaiID)
2. tum-quantum          ── Post-Quantum Cryptography Engine (NIST FIPS 203/204)
3. tum-socs             ── Full-Spectrum Cyber Defense & OpenSIEM (eBPF Telemetry)
4. tum-central-director ── Sovereign AgentOS Desktop Control-Plane & Multi-Worktree Hub

[FLAGSHIP ENTERPRISE MEGA-PLATFORMS]
5. tum-agentic-workos   ── Autonomous AI Enterprise Operating System & Process ERP (Jira: SCRUM-28)
6. tum-cybermesh        ── Unified Defense Cloud & Autonomous XSIAM Platform (Jira: SCRUM-29)
7. tum-trust-fabric     ── National Digital Identity & Legal Super-Infrastructure (Jira: SCRUM-30)

[GROUP GOVERNANCE & RESEARCH]
8. tum-group-holdings   ── Group Strategy, OKRs, Working Group Secretariat & Standards
```

---

## 4. มาตรฐานการตรวจรับงานระดับ Enterprise (Strict Quality Acceptance Gate)

ทุกฟีเจอร์ที่พัฒนาจะต้องผ่านการตรวจสอบ 5 ขั้นตอน (5-Step Quality Gate) ก่อนที่ Working Group จะรับรองสถานะ:
1. **Clean Architecture Compliance:** มีการแยก Layer ชัดเจน (Domain, Application, Infrastructure, Presentation)
2. **Type Safety & Data Contracts:** กำหนด DTO, Request/Response Schema และ Validation ชัดเจน 100%
3. **Automated Test Coverage:** ต้องมี Unit Tests และ Integration Tests ผ่านการรันจริง โดยมี Coverage $\ge 85\%$
4. **Sovereign Security Integration:** ทุกคำสั่งและธุรกรรมสำคัญต้องมี cryptographic verification ผูกกับระบบ Identity หรือ Quantum ของ TUM
5. **No Isolated Flat Files:** ห้ามสร้างไฟล์ HTML/Script ลอยๆ เพื่อจำลองการแสดงผลเด็ดขาด
