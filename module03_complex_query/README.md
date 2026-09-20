# Module 03: การเชื่อมโยงข้อมูลและการทำ Query ซับซ้อน (Joins, Subqueries & CTEs)

โมดูลนี้ครอบคลุมแนวคิดการเชื่อมโยงตารางข้อมูลหลายตาราง (Joins), การใช้งาน Subquery, การทำ Common Table Expressions (`WITH` clause) และการรวมเซตข้อมูลด้วย Set Operations

---

## 📖 เนื้อหาทฤษฎี (Lecture Content)

---

### 1. การเชื่อมโยงตาราง (Table Joins & Types)

การใช้ `JOIN` คือการนำตารางตั้งแต่ 2 ตารางขึ้นไปมารวมกันตามเงื่อนไขความสัมพันธ์ (Join Condition):

- **`INNER JOIN`:** คืนค่าเฉพาะแถวที่มี Key ตรงกันทั้งสองตารางเท่านั้น
- **`LEFT JOIN` (Left Outer Join):** คืนค่าทุกแถวจากตารางฝั่งซ้าย หากตารางฝั่งขวาไม่มีข้อมูลตรงกันจะเติมค่า `NULL`
- **`RIGHT JOIN` (Right Outer Join):** คืนค่าทุกแถวจากตารางฝั่งขวา
- **`FULL OUTER JOIN`:** คืนค่าทุกแถวจากทั้งสองตาราง หากฝั่งใดฝั่งหนึ่งไม่มีข้อมูลตรงกันจะแสดง `NULL`
- **`CROSS JOIN`:** ผลคูณคาร์ทีเซียน (Cartesian Product) นำทุกแถวของตารางซ้ายจับคู่กับทุกแถวของตารางขวา (จำนวนแถวผลลัพธ์ = N × M)

---

### 2. คิวรีย่อย (Subqueries) & ประเภทการทำงาน

Subquery คือการซ้อนคำสั่ง `SELECT` ภายใน Query หลัก:

- **Scalar Subquery:** คืนค่าเดี่ยว (1 แถว 1 คอลัมน์) เช่น หาค่าเฉลี่ย เพื่อนำไปใช้เปรียบเทียบใน `WHERE`
- **Subquery with `IN` / `EXISTS`:**
  - `IN`: ตรวจสอบว่าค่าอยู่ในผลลัพธ์ของ Subquery หรือไม่
  - `EXISTS`: ตรวจสอบว่ามีแถวผลลัพธ์เกิดขึ้นหรือไม่ (มีประสิทธิภาพสูงเมื่อตรวจสอบความสัมพันธ์แบบมีอยู่จริง)

---

### 3. Common Table Expressions (CTEs & `WITH` Clause)

`WITH` clause ใช้สำหรับสร้างตารางเสมือนชั่วคราว (Temporary Named Result Set) ภายในขอบเขตการรัน Query นั้น ๆ:

- **ข้อดีของ CTE เมื่อเทียบกับ Subquery ซ้อนกัน:**
  - อ่านและทำความเข้าใจโครงสร้าง SQL ได้ง่ายขึ้นมาก (Modular Approach)
  - สามารถอ้างอิง CTE เดียวกันซ้ำได้หลายจุดใน Query หลัก
  - รองรับการสร้าง Multiple CTEs ต่อเนื่องกันเพื่อทำความสะอาดข้อมูลหลายขั้นตอน

---

### 4. การจัดการเซตข้อมูล (Set Operations)

- **`UNION` vs `UNION ALL`:**
  - `UNION`: รวมข้อมูลและ **ตัดแถวที่ซ้ำกันออก** (มีค่าใช้จ่ายในการทำ Deduplication)
  - `UNION ALL`: รวมทุกแถวจากทั้งสองคิวรี **โดยไม่ตัดแถวซ้ำ** (ทำงานเร็วกว่า `UNION`)
- **`INTERSECT`:** คืนค่าเฉพาะแถวที่มีอยู่ในผลลัพธ์ทั้งสองฝั่งเท่านั้น
- **`EXCEPT` (หรือ `MINUS`):** คืนค่าแถวที่มีในคิวรีแรก แต่ **ไม่มี** ในคิวรีที่สอง

---

## 📋 รายการสคริปต์ปฏิบัติการ (Practice Scripts)

1. **[`01_dql_inner_join_transactions_customers.sql`](scripts/01_dql_inner_join_transactions_customers.sql)** — การเชื่อมตารางธุรกรรมการขายเข้ากับโปรไฟล์ลูกค้าด้วย `INNER JOIN`
2. **[`02_dql_left_join_franchises_suppliers.sql`](scripts/02_dql_left_join_franchises_suppliers.sql)** — การเชื่อมสาขาแฟรนไชส์เข้ากับซัพพลายเออร์ด้วย `LEFT JOIN`
3. **[`03_dql_subqueries_scalar_and_where.sql`](scripts/03_dql_subqueries_scalar_and_where.sql)** — การใช้ Scalar Subquery และ Subquery กับเงื่อนไข `IN`
4. **[`04_dql_cte_customer_sales_summary.sql`](scripts/04_dql_cte_customer_sales_summary.sql)** — การจัดโครงสร้างคิวรีด้วย Common Table Expression (`WITH` clause) แบบหลายขั้นตอน
5. **[`05_dql_set_operations.sql`](scripts/05_dql_set_operations.sql)** — การเปรียบเทียบเซตข้อมูลด้วย `UNION`, `INTERSECT`, `EXCEPT`
