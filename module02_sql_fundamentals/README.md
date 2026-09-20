# Module 02: พื้นฐาน SQL & Data Operations (DQL, DDL, DML)

โมดูลนี้ปูพื้นฐานทฤษฎีการประมวลผล SQL ภาษาคิวรีข้อมูล (DQL), ภาษาจัดการโครงสร้างข้อมูล (DDL), ภาษาจัดการแถวข้อมูล (DML) และแนวคิดสถาปัตยกรรมระบบฐานข้อมูล

---

## 📖 เนื้อหาทฤษฎี (Lecture Content)

---

### 1. ประเภทของภาษา SQL (SQL Sublanguages Breakdown)

ภาษา SQL ถูกแบ่งออกเป็นกลุ่มคำสั่งตามหน้าที่การทำงาน ดังนี้:

| ประเภท | ชื่อเต็ม | คำสั่งหลัก | หน้าที่และรายละเอียด |
| --- | --- | --- | --- |
| **DQL** | Data Query Language | `SELECT` | การอ่านและคิวรีดึงข้อมูลจากตาราง (Read-Only) ไม่มีผลกระทบต่อข้อมูลเดิม |
| **DML** | Data Manipulation Language | `INSERT`, `UPDATE`, `DELETE`, `MERGE` | การจัดการข้อมูลในตาราง เพิ่ม แก้ไข ลบ หรือ Upsert ข้อมูล |
| **DDL** | Data Definition Language | `CREATE`, `ALTER`, `DROP`, `TRUNCATE` | การสร้าง ปรับแต่ง หรือลบโครงสร้างของ Database, Schema และ Table |
| **DCL / TCL** | Data / Transaction Control Language | `GRANT`, `REVOKE`, `COMMIT`, `ROLLBACK` | การควบคุมสิทธิ์การเข้าถึงและการจัดการธุรกรรม (ใน Databricks จัดการสิทธิ์ผ่าน Unity Catalog) |

---

### 2. ลำดับการประมวลผลคำสั่ง SQL (SQL Execution Order)

ความเข้าใจเรื่อง **Logical Query Processing Order** มีความสำคัญอย่างยิ่งในการเขียน SQL Query เนื่องจากลำดับการประมวลผลของ SQL Engine **ไม่ได้ทำงานตามลำดับที่เราเขียน (Written Order)**

#### เปรียบเทียบ Written Order vs Execution Order:

```text
[Written Order]                   [Logical Execution Order]
1. SELECT                         1. FROM & JOIN     (ระบุตารางและเชื่อมข้อมูล)
2. FROM & JOIN                    2. WHERE           (กรองแถวข้อมูลระดับ Row)
3. WHERE                          3. GROUP BY        (จัดกลุ่มข้อมูล)
4. GROUP BY                       4. HAVING          (กรองผลลัพธ์หลัง Aggregation)
5. HAVING                         5. SELECT          (เลือกคอลัมน์ & คำนวณ Expression)
6. DISTINCT                       6. DISTINCT        (ตัดแถวข้อมูลที่ซ้ำกัน)
7. ORDER BY                       7. ORDER BY        (เรียงลำดับผลลัพธ์)
8. LIMIT                          8. LIMIT           (ตัดจำนวนแถวแสดงผล)
```

---

### 3. Transaction vs Analytics (OLTP vs OLAP & Lakehouse)

| คุณลักษณะ | OLTP (Transaction) | OLAP / Databricks Lakehouse (Analytics) |
| --- | --- | --- |
| **เป้าหมายหลัก** | รองรับการทำงานประจำวันของแอปพลิเคชัน (เช่น การซื้อสินค้า, ถอนเงิน) | รองรับการวิเคราะห์ข้อมูลเชิงลึก รายงานการขาย และการทำ AI/ML |
| **รูปแบบการจัดเก็บข้อมูล** | **Row-Oriented** (เก็บข้อมูลทีละแถวต่อเนื่องกัน) | **Columnar Format** (เช่น Delta Lake / Parquet เก็บทีละคอลัมน์) |
| **ลักษณะการ Query** | อ่าน/เขียนข้อมูลทีละแถว (Single Row CRUD) | อ่านข้อมูลปริมาณมหาศาล (Large Scan) คำนวณค่ารวม (`SUM`, `AVG`, `GROUP BY`) |
| **สถาปัตยกรรม** | Compute กับ Storage ผูกติดกันในตัวเครื่อง | **Compute และ Storage แยกออกจากกันอิสระ** (Scale-Out ได้ง่าย) |

---

## 📋 รายการสคริปต์ปฏิบัติการ (Practice Scripts)

### 🔹 DQL (Data Query Language) Scripts
1. **[`01_explore_customer_data.sql`](scripts/01_explore_customer_data.sql)** — การคิวรีดูข้อมูลลูกค้าทั้งหมด (`SELECT *`)
2. **[`02_select_column.sql`](scripts/02_select_column.sql)** — การเลือกเฉพาะคอลัมน์ที่ต้องการ
3. **[`03_filter_row.sql`](scripts/03_filter_row.sql)** — การกรองแถวด้วยเงื่อนไข `WHERE`
4. **[`04_order_row.sql`](scripts/04_order_row.sql)** — การเรียงลำดับข้อมูลด้วย `ORDER BY` และ `LIMIT`
5. **[`05_compute_column.sql`](scripts/05_compute_column.sql)** — การทำ Column Expression & `CONCAT`
6. **[`06_case_when.sql`](scripts/06_case_when.sql)** — การสร้างเงื่อนไขจัดกลุ่มด้วย `CASE WHEN` (Searched & Simple CASE)
7. **[`07_coalesce_null_handling.sql`](scripts/07_coalesce_null_handling.sql)** — การจัดการค่า NULL ด้วย `COALESCE`, `IFNULL`, `NVL`, `NULLIF`
8. **[`08_string_and_date_functions.sql`](scripts/08_string_and_date_functions.sql)** — การประมวลผลข้อความและวันที่ (`YEAR`, `MONTH`, `DATE_TRUNC`, `UPPER`, `LOWER`, `SUBSTRING`)
9. **[`11_explore_transaction_data.sql`](scripts/11_explore_transaction_data.sql)** — คิวรีสำรวจตารางรายการขาย
10. **[`12_aggregate_by_product.sql`](scripts/12_aggregate_by_product.sql)** — การจัดกลุ่มและสรุปผลด้วย `GROUP BY` (`COUNT`, `SUM`, `AVG`)
11. **[`13_aggregate_by_product_having.sql`](scripts/13_aggregate_by_product_having.sql)** — การกรองผลรวมหลังสรุปผลด้วย `HAVING`

### 🔹 DDL (Data Definition Language) Scripts
12. **[`21_create_table.sql`](scripts/21_create_table.sql)** — การสร้างตารางโดยกำหนด Schema และ Data Types ชัดเจน (`CREATE TABLE`)
13. **[`30_create_table_as_select_ctas.sql`](scripts/30_create_table_as_select_ctas.sql)** — การสร้างตารางจากผลลัพธ์การคิวรี (`CREATE TABLE AS SELECT`)
14. **[`31_create_table_or_replace_cras.sql`](scripts/31_create_table_or_replace_cras.sql)** — การสร้างหรือทดแทนตารางเดิมแบบ Atomic (`CREATE OR REPLACE TABLE AS SELECT`)

### 🔹 DML (Data Manipulation Language) Scripts
15. **[`22_insert.sql`](scripts/22_insert.sql)** — การเพิ่มข้อมูลแบบระบุค่า (`INSERT INTO ... VALUES`)
16. **[`23_insert_select.sql`](scripts/23_insert_select.sql)** — การคัดลอกและเพิ่มข้อมูลจากตารางอื่น (`INSERT INTO ... SELECT`)
17. **[`24_update.sql`](scripts/24_update.sql)** — การอัปเดตข้อมูลที่มีอยู่แล้ว (`UPDATE ... SET ... WHERE`)
18. **[`25_delete.sql`](scripts/25_delete.sql)** — การลบข้อมูลตามเงื่อนไข (`DELETE FROM ... WHERE`)
19. **[`26_merge_upsert.sql`](scripts/26_merge_upsert.sql)** — การทำ Atomic Upsert ด้วยคำสั่ง `MERGE INTO` บน Delta Lake
