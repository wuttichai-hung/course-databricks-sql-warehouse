# แผนการพัฒนาคอร์สเรียน: Databricks SQL Warehouse Masterclass

คอร์สเรียนนี้ออกแบบมาสำหรับผู้ที่ต้องการเรียนรู้และฝึกฝนการใช้งาน **Databricks SQL Warehouse** ตั้งแต่ระดับพื้นฐานไปจนถึงระดับสูง โดยใช้ชุดข้อมูลตัวอย่าง **Bakehouse Dataset** (`samples.bakehouse.*`) ในการทำเวิร์กช็อปและแบบฝึกหัดจริง

---

## 🎯 วัตถุประสงค์ของคอร์สเรียน

1. **เข้าใจสถาปัตยกรรม Databricks Lakehouse:** เข้าใจความแตกต่างระหว่าง Data Lakehouse กับ RDBMS ดั้งเดิม การแยก Compute และ Storage และการบริหารจัดการข้อมูลผ่าน Unity Catalog
2. **เขียน SQL Query ได้อย่างชำนาญ (DQL, DDL, DML):** สามารถคิวรี กรองข้อมูล สรุปผล จัดกลุ่ม จัดการตารางข้อมูลบน Delta Lake
3. **จัดการคำสั่งซับซ้อน (Joins, Subqueries, CTEs):** สามารถรวมข้อมูลจากหลายตาราง จัดโครงสร้าง Query ที่ซับซ้อนให้อ่านง่ายและทำงานได้มีประสิทธิภาพ
4. **ทำ Advanced Analytics ด้วย Window Functions:** คำนวณ Ranking, Moving Average, Year-over-Year (YoY) Growth และจัดกลุ่มข้อมูลแบบเลื่อนตำแหน่ง
5. **เข้าใจการเพิ่มประสิทธิภาพและการกำกับดูแลข้อมูล:** รู้จักการสร้าง Views, Materialized Views, การใช้ Time Travel บน Delta Lake และคำสั่ง `OPTIMIZE` / `ZORDER`

---

## 📂 โครงสร้างโมดูลและโฟลเดอร์ในคลังข้อมูล (Folder Hierarchy)

```text
course-databricks-sql-warehouse/
├── DATASET.md                                     # รายละเอียดและ Schema ของ Bakehouse Dataset
├── PLAN.md                                        # แผนการเรียนและโครงสร้างคอร์ส (ไฟล์นี้)
├── README.md                                      # ภาพรวมคอร์สและคู่มือเริ่มต้นใช้งาน
├── module01_databricks_sql_warehouse/             # Module 1: พื้นฐาน Databricks & SQL Warehouse
│   ├── README.md
│   └── scripts/
│       └── 01_explore_sample_data.sql
├── module02_sql_fundamentals/                     # Module 2: พื้นฐาน SQL & Data Operations (DQL, DDL, DML)
│   ├── README.md
│   └── scripts/
│       ├── 01_explore_customer_data.sql
│       ├── 02_select_column.sql
│       ├── 03_filter_row.sql
│       ├── 04_order_row.sql
│       ├── 05_compute_column.sql
│       ├── 06_case_when.sql
│       ├── 07_coalesce_null_handling.sql
│       ├── 08_string_and_date_functions.sql
│       ├── 11_explore_transaction_data.sql
│       ├── 12_aggregate_by_product.sql
│       ├── 13_aggregate_by_product_having.sql
│       ├── 21_create_table.sql
│       ├── 22_insert.sql
│       ├── 23_insert_select.sql
│       ├── 24_update.sql
│       ├── 25_delete.sql
│       ├── 26_merge_upsert.sql
│       ├── 30_create_table_as_select_ctas.sql
│       └── 31_create_table_or_replace_cras.sql
├── module03_complex_query/                        # Module 3: Joins, Subqueries & CTEs
│   ├── README.md
│   └── scripts/
│       ├── 01_inner_join_transactions_customers.sql
│       ├── 02_left_join_franchises_suppliers.sql
│       ├── 03_subqueries_scalar_and_where.sql
│       ├── 04_cte_customer_sales_summary.sql
│       └── 05_set_operations.sql
├── module04_window_analytics/                     # Module 4: Window Functions & Advanced Analytics
│   ├── README.md
│   └── scripts/
│       ├── 01_window_ranking_functions.sql
│       ├── 02_lead_lag_daily_sales.sql
│       ├── 03_running_total_moving_avg.sql
│       └── 04_ntile_customer_segmentation.sql
├── module05_text_and_semi_structured/             # Module 5: Text Analytics & Semi-Structured Data
│   ├── README.md
│   └── scripts/
│       ├── 01_customer_reviews_sentiment_keywords.sql
│       ├── 02_gold_reviews_chunk_exploration.sql
│       └── 03_string_json_manipulation.sql
└── module06_views_governance_optimization/       # Module 6: Views, Delta Time Travel & Optimization
    ├── README.md
    └── scripts/
        ├── 01_create_views_and_materialized_views.sql
        ├── 02_delta_time_travel_and_history.sql
        └── 03_optimize_and_zorder.sql
```

---

## 📚 รายละเอียดเนื้อหาแต่ละโมดูล (Module Breakdown)

---

### 🔹 Module 01: พื้นฐาน Databricks สำหรับ SQL Warehouse

**โฟลเดอร์:** [`module01_databricks_sql_warehouse`](module01_databricks_sql_warehouse)

#### รายการ Script

- [`01_explore_sample_data.sql`](module01_databricks_sql_warehouse/scripts/01_explore_sample_data.sql): การคิวรีทดสอบการเชื่อมต่อตารางผ่าน 3-Level Namespace

---

### 🔹 Module 02: พื้นฐาน SQL & Data Operations (DQL, DDL, DML)

**โฟลเดอร์:** [`module02_sql_fundamentals`](module02_sql_fundamentals)

#### รายการ Script

- [`01_explore_customer_data.sql`](module02_sql_fundamentals/scripts/01_explore_customer_data.sql): คิวรีสำรวจข้อมูลลูกค้าทั้งหมด (`SELECT *`)
- [`02_select_column.sql`](module02_sql_fundamentals/scripts/02_select_column.sql): การเลือกเฉพาะคอลัมน์ที่สนใจ
- [`03_filter_row.sql`](module02_sql_fundamentals/scripts/03_filter_row.sql): กรองแถวตามประเทศและเมือง
- [`04_order_row.sql`](module02_sql_fundamentals/scripts/04_order_row.sql): เรียงลำดับรายการขายตามราคา
- [`05_compute_column.sql`](module02_sql_fundamentals/scripts/05_compute_column.sql): การคำนวณและสร้างคอลัมน์ใหม่ (`CONCAT`)
- [`06_case_when.sql`](module02_sql_fundamentals/scripts/06_case_when.sql): การสร้างเงื่อนไขจัดกลุ่มด้วย `CASE WHEN`
- [`07_coalesce_null_handling.sql`](module02_sql_fundamentals/scripts/07_coalesce_null_handling.sql): การจัดการค่า NULL ด้วย `COALESCE`, `IFNULL`, `NVL`, `NULLIF`
- [`08_string_and_date_functions.sql`](module02_sql_fundamentals/scripts/08_string_and_date_functions.sql): การประมวลผลข้อความและวันที่
- [`11_explore_transaction_data.sql`](module02_sql_fundamentals/scripts/11_explore_transaction_data.sql): คิวรีสำรวจข้อมูลรายการขาย
- [`12_aggregate_by_product.sql`](module02_sql_fundamentals/scripts/12_aggregate_by_product.sql): สรุปยอดขายรวมและจำนวนออเดอร์ตามสินค้า
- [`13_aggregate_by_product_having.sql`](module02_sql_fundamentals/scripts/13_aggregate_by_product_having.sql): การใช้ `HAVING` กรองผลสรุป
- [`21_create_table.sql`](module02_sql_fundamentals/scripts/21_create_table.sql): การสร้างตารางแบบระบุ Schema (`CREATE TABLE`)
- [`22_insert.sql`](module02_sql_fundamentals/scripts/22_insert.sql): การเพิ่มข้อมูลแบบระบุค่า (`INSERT INTO ... VALUES`)
- [`23_insert_select.sql`](module02_sql_fundamentals/scripts/23_insert_select.sql): การคัดลอกข้อมูลจากตารางอื่น (`INSERT INTO ... SELECT`)
- [`24_update.sql`](module02_sql_fundamentals/scripts/24_update.sql): การแก้ไขข้อมูล (`UPDATE ... SET ... WHERE`)
- [`25_delete.sql`](module02_sql_fundamentals/scripts/25_delete.sql): การลบข้อมูลตามเงื่อนไข (`DELETE FROM ... WHERE`)
- [`26_merge_upsert.sql`](module02_sql_fundamentals/scripts/26_merge_upsert.sql): การทำ Upsert ด้วยคำสั่ง `MERGE INTO`
- [`30_create_table_as_select_ctas.sql`](module02_sql_fundamentals/scripts/30_create_table_as_select_ctas.sql): การสร้างตารางจากคิวรี (`CREATE TABLE AS SELECT`)
- [`31_create_table_or_replace_cras.sql`](module02_sql_fundamentals/scripts/31_create_table_or_replace_cras.sql): การสร้างหรือเขียนทับตารางเดิม (`CREATE OR REPLACE TABLE AS SELECT`)

---

### 🔹 Module 03: การเชื่อมโยงข้อมูลและการทำ Query ซับซ้อน (Joins, Subqueries & CTEs)

**โฟลเดอร์:** [`module03_complex_query`](module03_complex_query)

---

### 🔹 Module 04: Window Functions & Advanced Analytics

**โฟลเดอร์:** [`module04_window_analytics`](module04_window_analytics)

---

### 🔹 Module 05: การจัดการข้อมูลข้อความและ semi-structured (Text Analytics)

**โฟลเดอร์:** [`module05_text_and_semi_structured`](module05_text_and_semi_structured)

---

### 🔹 Module 06: Views, Delta Lake Features & Performance Optimization

**โฟลเดอร์:** [`module06_views_governance_optimization`](module06_views_governance_optimization)
