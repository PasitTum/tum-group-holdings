# TUM Group Holdings — Sovereign Engineering & CTA Verification Manual
**Document Code:** TUM-CTA-MANUAL-2026-V1  
**Authority:** Office of the Chief Technical Auditor (CTA) & Chairman of the Board  
**Target:** Engineering Leads, Product Architects, Security Guilds, and Autonomous Coding Agents  
**Classification:** MANDATORY REPOSITORY CORPUS  

---

## 1. Executive Summary & Epistemic Foundation

เอกสารฉบับนี้คือ **"คลังองค์ความรู้และคู่มือปฏิบัติการทางวิศวกรรมฉบับสมบูรณ์"** ที่ตกผลึกจากการปฏิรูปความจริงทางวิศวกรรมของ TUM Group ภายใต้คำสั่งประธานกรรมการบริหาร (คุณ Pasit) 

สาเหตุที่ต้องสถาปนาคู่มือฉบับนี้ เกิดจากวิกฤตความน่าเชื่อถือทางวิศวกรรมที่พบว่า ผลิตภัณฑ์หลายตัวในเครือตกอยู่ในสภาวะ **"Fluency without Truth" (ความลื่นไหลที่กลวงเปล่า)** มีการสร้างภาพลวงตาด้วย Mock และเอกสารรับรองเท็จ

---

## 2. Compendium of Foundational Research (คลังงานวิจัยอ้างอิงระดับโลก)

### 2.1 The Danger of Unearned Confidence in AI-Assisted Code
* **งานวิจัย:** *Do Users Write More Insecure Code with AI Assistants?* (Stanford University, 2022/2023)
* **คณะผู้วิจัย:** Neil Perry, Megha Srivastava, Deepak Kumar, Dan Boneh (arXiv:2211.03622)
* **หลักการวิศวกรรมที่นำมาใช้:**
  - AI ทำให้ผู้พัฒนาเกิด **"Overconfidence" (ความมั่นใจผิดๆ)** คิดว่าโค้ดที่เจนออกมานั้นปลอดภัยแล้ว
  - **ข้อบังคับ:** ห้ามเชื่อใจโค้ดที่ AI สร้างขึ้นแม้แต่บรรทัดเดียว โค้ดด้าน Cryptography, Auth, และ DB I/O ต้องผ่านการตรวจสอบโดยมนุษย์หรือเครื่องมือ Static/Dynamic Analysis ภายนอกเสมอ

### 2.2 Prevalence of Critical Weaknesses in Commercial LLMs
* **งานวิจัย:** *Asleep at the Keyboard? Assessing the Security of GitHub Copilot's Code Contributions* (NYU / IEEE S&P 2022)
* **คณะผู้วิจัย:** Hammond Pearce, Benjamin Tan, Baleegh Ahmad, Ramesh Karri, Brendan Dolan-Gavitt
* **หลักการวิศวกรรมที่นำมาใช้:**
  - กว่า **40% ของโค้ดที่ AI สร้างขึ้นมีช่องโหว่ความปลอดภัยระดับร้ายแรง** (MITRE Top 25 CWE)
  - **ข้อบังคับ:** การเขียนโค้ดต้องมีการทดสอบเชิงปฏิปักษ์ (Adversarial Testing) ทดสอบกรณี Buffer Corrupt, Injection, และ Timeout Failure เสมอ

### 2.3 The Escalation from Sycophancy to Subterfuge
* **งานวิจัย:** *Sycophancy to Subterfuge: Investigating Reward-Tampering in Large Language Models* (Anthropic Alignment Team, June 2024)
* **คณะผู้วิจัย:** Carson Denison, Monte MacDiarmid, Fazl Barez et al. (arXiv:2406.10162)
* **หลักการวิศวกรรมที่นำมาใช้:**
  - การปล่อยให้ AI ประจบ (Flattery) หรือตอบเอาใจ คือ **บันไดก้าวแรกสู่การแอบแก้โค้ดและปลอมแปลงผลการทดสอบ (Subterfuge)**
  - **ข้อบังคับ:** กำจัดวัฒนธรรม "Polite Liar" และ "Meta-Sycophancy" ทันที ห้าม Agent ใช้คำชมทิพย์หรือการเลี่ยงบาลี

### 2.4 Epistemic Abstention & Evidential Sufficiency
* **งานวิจัย:** *Learning to Abstain: Epistemic Pruning and Selective Classification* (ICLR / OpenReview)
* **หลักการวิศวกรรมที่นำมาใช้:**
  - เมื่อระบบไม่มีฮาร์ดแวร์จริงหรือข้อมูลเชิงประจักษ์ **ทางเลือกเดียวที่ถูกต้องคือการงดออกความเห็น (Abstain)**
  - **ข้อบังคับ:** รันไทม์ต้อง **Fail Closed** ทันทีหากไม่มีอุปกรณ์ต่ออยู่จริง ห้ามสลับไปใช้ Mock เงียบๆ เด็ดขาด

---

## 3. International Standards Alignment (การเชื่อมโยงมาตรฐานสากล)

### 3.1 NIST AI RMF 1.0 (NIST AI 100-1)
- **เสาหลัก "Valid & Reliable":** ระบบต้องทำงานได้ตามวัตถุประสงค์จริงในสภาวะแวดล้อมจริง ไม่ใช่ผ่านแค่ในแล็บจำลอง
- **ฟังก์ชัน GOVERN, MAP, MEASURE, MANAGE:** บังคับใช้ในกระบวนการทำงานของ CTA ในการตรวจรับงานทุก Sprint

### 3.2 ISO/IEC 42001:2023 (Artificial Intelligence Management System)
- กำหนดให้มี **Systematic AI Verification & Validation** พร้อม Audit Trail ที่ตรวจสอบย้อนกลับไปยังแหล่งข้อมูลจริง

### 3.3 NIST SP 800-218 (Secure Software Development Framework - SSDF)
- แนวปฏิบัติหมวด **PW.8:** ห้ามตรวจรับงานจากเอกสารกระดาษหรือเช็กลิสต์ แต่ต้องทดสอบจากผลรันไทม์จริงและ Dynamic Analysis

---

## 4. Advanced Verification Methodologies (ระเบียบวิธีตรวจสอบระดับลึก)

### 4.1 Metamorphic Testing (MT) Protocol
*เพื่อทำลาย Mock ตรวจสตริง "MISMATCH" หรือ "PRINT_ATTACK" ใน Biometrics และ Cryptography:*
1. **Transformative Invariance:** ป้อนภาพใบหน้าปกติ -> บันทึกคะแนน
2. **Perturbation Test:** ทำการหมุนภาพ 180 องศา, ปรับ Contrast, หรือสลับตำแหน่งพิกเซล
3. **Assertion Rule:** หากคะแนน Similarity Score ยังคงตอบกลับมาเป็น `0.982` แข็งทื่อเหมือนเดิมโดยไม่แปรผันตามคุณสมบัติทางฟิสิกส์ **ให้ปรับตกทันทีฐาน "Hardcoded Mock Fraud"**

### 4.2 Mutation Testing Protocol
*เพื่อกำจัด Test Suite ผักชีโรยหน้า:*
1. ทำการฉีดข้อผิดพลาด (Mutant) ลงในโค้ด เช่น สลับเครื่องหมายบวกเป็นลบ, บังคับให้ Function คืนค่า `false`
2. รัน Test Suite: หากชุดเทสยังคงรายงานผลเป็น `[PASS]` แสดงว่าเทสนั้นคือเทสหลอก (Blind Test) และต้องถูกระงับสิทธิ์ทันที

---

## 5. CTA Operational Checkpoints (ด่านตรวจรับงานจริง 5 ด่าน)

| ด่านที่ | ชื่อด่านตรวจ | เกณฑ์ผ่าน (PASS) | สิ่งที่ถูกปรับตกทันที (FAIL) |
|:---:|---|---|---|
| **1** | **Physical Socket Gate** | มีการเชื่อมต่อ Port, USB PCSC, หรือ DB Socket จริง และคืนค่า Status รหัส 200/503 ตามสภาวะจริง | ใช้ Mock Server หรือ In-memory RAM Map จำลองการเชื่อมต่อ |
| **2** | **Cryptographic Math Gate** | ใช้ Open-Source ที่ผ่านการ Peer-Review เช่น `liboqs` หรือ BouncyCastle | ใช้การสุ่มไบต์ XOR ลูป หรือเอาตัวอักษร 'a'/'b' มาต่อท้ายสตริง |
| **3** | **Biometric Reality Gate** | ใช้โมเดล Deep Learning จริง (ONNX Runtime, InsightFace) มีการคำนวณเวกเตอร์ 512-d จากพิกเซลจริง | ตรวจจับคำว่า "MISMATCH" หรือ "PRINT_ATTACK" จาก Array |
| **4** | **Persistence Gate** | มี Schema DDL และบันทึก Transaction ลงดิสก์จริง (PostgreSQL / SQLite / ClickHouse) | บันทึกข้อมูลลงใน `Map<string, any>` ในหน่วยความจำ |
| **5** | **Zero-Persona Audit Gate** | เอกสารและผลเทสมีไฟล์ Raw Log พร้อม Timestamp ระบุเครื่องและฮาร์ดแวร์ชัดเจน | มีคำโฆษณา "Military Grade", Pop-up `alert()`, หรือ Math.random() |

---

## 6. Codification & Baseline Governance Standard
* **Ratified Standard:** [TUM Group Engineering Integrity & Verification Standard (EI-VS) v2.0.0](file:///D:/TUM/GEMINI.md) (Document Code: `TUM-STD-ENG-001`).
* **Enforcement:** Codified directly into repository configuration files (`GEMINI.md`) across all TUM Group engineering units. All audit checkpoints above are formally bound by the principles, risk tiers, and Delegation of Authority (DoA) established in EI-VS v2.0.0.

