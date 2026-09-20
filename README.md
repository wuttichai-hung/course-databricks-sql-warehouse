# Databricks SQL Warehouse Course (Bakehouse Dataset)

ยินดีต้อนรับสู่คลังบทเรียนและแบบฝึกหัดคอร์สเรียน **Databricks SQL Warehouse** สำหรับการวิเคราะห์ข้อมูลทางธุรกิจด้วย SQL บน Databricks Lakehouse Platform โดยใช้ชุดข้อมูลจำลองร้านเบเกอรี่ **Bakehouse Dataset** (`samples.bakehouse.*`)

---

## 📌 แผนการเรียนและหลักสูตร (Course Plan)

ดูแผนการสอนและเนื้อหาฉบับเต็มของแต่ละโมดูลได้ที่ 👉 **[PLAN.md](PLAN.md)**

---

## 🗺️ โครงสร้างโมดูลบทเรียน

คอร์สเรียนนี้แบ่งออกเป็น 6 โมดูลหลัก ตามลำดับความยากง่าย:

| โมดูล | โฟลเดอร์ | เนื้อหาหลัก |
| --- | --- | --- |
| **Module 01** | [`module01_databricks_sql_warehouse`](module01_databricks_sql_warehouse) | แนะนำ Databricks Lakehouse, Unity Catalog 3-Level Namespace, SQL Warehouse Types, UI Walkthrough |
| **Module 02** | [`module02_sql_fundamentals`](module02_sql_fundamentals) | ปูพื้นฐาน SQL: DQL (`SELECT`, `WHERE`, `ORDER BY`), Aggregation (`GROUP BY`, `HAVING`), DDL & DML (`CREATE`, `INSERT`, `UPDATE`, `DELETE`, `MERGE`) |
| **Module 03** | [`module03_complex_query`](module03_complex_query) | การเชื่อมโยงตาราง (Joins), Subqueries, CTEs (`WITH` clause), Set Operations (`UNION`, `INTERSECT`, `EXCEPT`) |
| **Module 04** | `module04_window_analytics` | Window Functions (`OVER`), Ranking (`ROW_NUMBER`, `RANK`, `DENSE_RANK`), Lead/Lag, Running Total, Moving Average |
| **Module 05** | `module05_text_and_semi_structured` | การวิเคราะห์ข้อมูลข้อความและรีวิวลูกค้า (`media_customer_reviews`), String Manipulation, JSON Parsing |
| **Module 06** | `module06_views_governance_optimization` | การใช้งาน Views & Materialized Views, Delta Time Travel (`VERSION AS OF`), Optimization (`OPTIMIZE`, `ZORDER`) |

---

## 💾 ชุดข้อมูลอ้างอิง (Dataset)

คอร์สนี้ใช้ข้อมูล **Bakehouse Dataset** ซึ่งให้บริการฟรีในระบบ Unity Catalog ของ Databricks ภายใต้:

```sql
samples.bakehouse.<table_name>
```

อ่านรายละเอียดโครงสร้างและ Schema ทั้งหมดของตารางในชุดข้อมูลได้ที่ 👉 **[DATASET.md](DATASET.md)**

### ตารางหลักที่ใช้งาน:
- `sales_customers`: ข้อมูลโปรไฟล์ลูกค้า
- `sales_franchises`: ข้อมูลสาขาเบเกอรี่
- `sales_suppliers`: ข้อมูลซัพพลายเออร์และวัตถุดิบ
- `sales_transactions`: รายการธุรกรรมการขาย
- `media_customer_reviews`: ความคิดเห็นและรีวิวจากลูกค้า
- `media_gold_reviews_chunked`: ข้อมูลรีวิวฉบับ Chunked สำหรับงาน AI / Text Search

---

## 🚀 วิธีการเริ่มต้นใช้งาน

1. ล็อกอินเข้าสู่ **Databricks Workspace** ของคุณ
2. เปิดตัวประมวลผล **SQL Warehouse** (แนะนำประเภท Serverless เพื่อความรวดเร็ว)
3. ไปที่เมนู **SQL Editor**
4. เปิดไฟล์สคริปต์ SQL จากแต่ละโมดูลในคลังนี้ คัดลอกไปวางและทดลองรันคิวรีด้วย `Cmd/Ctrl + Enter`
