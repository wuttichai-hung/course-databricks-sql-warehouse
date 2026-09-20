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
│       ├── 11_explore_transaction_data.sql
│       ├── 12_aggregate_by_product.sql
│       ├── 13_aggregate_by_product_filter_after_agg.sql
│       ├── 21_ddl_create_table.sql
│       ├── 22_dml_insert_update_delete.sql
│       └── 23_dml_merge_upsert.sql
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

**โฟลเดอร์:** [`module01_databricks_sql_warehouse`](course-databricks-sql-warehouse/module01_databricks_sql_warehouse)

#### หัวข้อการเรียนรู้

1. **Lakehouse Architecture Concept**
   - เปรียบเทียบ RDBMS ดั้งเดิม vs Databricks Lakehouse
   - การแยก **Compute** และ **Storage** (ความสำคัญในการลดต้นทุนและการประมวลผลอิสระ)
   - รู้จักกับ Delta Lake format (Parquet + Transaction Log)
2. **Unity Catalog & 3-Level Namespace**
   - รูปแบบการอ้างอิงตาราง: `catalog.schema.table`
   - ตัวอย่าง: `samples.bakehouse.sales_customers`
   - การจัดการสิทธิ์และการจัดระเบียบข้อมูล
3. **Databricks SQL Warehouse**
   - ประเภทของ Warehouse: **Serverless**, **Pro**, **Classic**
   - การ Start / Stop Warehouse และการตั้งค่า **Auto-stop** เพื่อประหยัดค่าใช้จ่าย
4. **UI Walkthrough & Query Management**
   - ใช้งาน SQL Editor, การรัน Query (`Cmd/Ctrl + Enter`)
   - การดูผลลัพธ์ย้อนหลังใน History tab และการวิเคราะห์สถานะการรัน

#### รายการ Script

- [`01_explore_sample_data.sql`](course-databricks-sql-warehouse/module01_databricks_sql_warehouse/scripts/01_explore_sample_data.sql): การคิวรีทดสอบการเชื่อมต่อตารางผ่าน 3-Level Namespace

---

### 🔹 Module 02: พื้นฐาน SQL & Data Operations (DQL, DDL, DML)

**โฟลเดอร์:** [`module02_sql_fundamentals`](course-databricks-sql-warehouse/module02_sql_fundamentals)

#### หัวข้อการเรียนรู้

1. **Data Query Language (DQL) เบื้องต้น**
   - `SELECT` คอลัมน์ที่ต้องการ, การตั้งชื่อ Alias (`AS`)
   - กรองข้อมูลด้วย `WHERE`, เปรียบเทียบเงื่อนไข (`=`, `>`, `<`, `BETWEEN`, `IN`, `LIKE`)
   - เรียงลำดับข้อมูลด้วย `ORDER BY` (`ASC` / `DESC`) และการจำกัดจำนวนแถวด้วย `LIMIT`
   - การคำนวณในคอลัมน์ (Column Calculations) และฟังก์ชันจัดการข้อความ/วันที่เบื้องต้น
2. **Aggregation & Grouping**
   - การสรุปผลด้วย Aggregate Functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
   - การแบ่งกลุ่มข้อมูลด้วย `GROUP BY`
   - กรองผลลัพธ์หลังการรวมกลุ่มด้วย `HAVING`
3. **DDL & DML บน Delta Lake**
   - **DDL:** `CREATE TABLE`, `CREATE TABLE AS SELECT (CTAS)`, `ALTER TABLE`, `DROP TABLE`
   - **DML:** `INSERT INTO`, `UPDATE`, `DELETE`
   - **Upsert Logic:** คำสั่ง `MERGE INTO` บน Delta Lake (การอัปเดตและแทรกข้อมูลพร้อมกัน)

#### รายการ Script

- [`01_explore_customer_data.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/01_explore_customer_data.sql): คิวรีสำรวจข้อมูลลูกค้าทั้งหมด
- [`02_select_column.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/02_select_column.sql): การเลือกเฉพาะคอลัมน์ที่สนใจ
- [`03_filter_row.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/03_filter_row.sql): กรองแถวตามประเทศและเมือง
- [`04_order_row.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/04_order_row.sql): เรียงลำดับลูกค้า
- [`05_compute_column.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/05_compute_column.sql): การคำนวณและสร้างคอลัมน์ใหม่
- [`11_explore_transaction_data.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/11_explore_transaction_data.sql): คิวรีสำรวจข้อมูลรายการขาย
- [`12_aggregate_by_product.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/12_aggregate_by_product.sql): สรุปยอดขายรวมและจำนวนออเดอร์ตามสินค้า
- [`13_aggregate_by_product_filter_after_agg.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/13_aggregate_by_product_filter_after_agg.sql): การใช้ `HAVING` กรองผลสรุป
- [`21_ddl_create_table.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/21_ddl_create_table.sql): การสร้างตารางแบบ CTAS
- [`22_dml_insert_update_delete.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/22_dml_insert_update_delete.sql): คำสั่ง `INSERT`, `UPDATE`, `DELETE` บน Delta table
- [`23_dml_merge_upsert.sql`](course-databricks-sql-warehouse/module02_sql_fundamentals/scripts/23_dml_merge_upsert.sql): การทำ Upsert ด้วยคำสั่ง `MERGE INTO`

---

### 🔹 Module 03: การเชื่อมโยงข้อมูลและการทำ Query ซับซ้อน (Joins, Subqueries & CTEs)

**โฟลเดอร์:** [`module03_complex_query`](course-databricks-sql-warehouse/module03_complex_query)

#### หัวข้อการเรียนรู้

1. **Table Joins (การเชื่อมตาราง)**
   - ความเข้าใจและข้อแตกต่าง: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN`
   - การเชื่อมโยงตารางธุรกรรมการขายกับลูกค้า แฟรนไชส์ และซัพพลายเออร์
2. **Subqueries (คิวรีย่อย)**
   - **Scalar Subquery:** คิวรีย่อยที่คืนค่าเพียงค่าเดียว (เช่น หาคำสั่งซื้อที่มีมูลค่าสูงกว่าค่าเฉลี่ย)
   - **Subquery in `WHERE` Clause:** ใช้ร่วมกับ `IN`, `NOT IN`, `EXISTS`, `NOT EXISTS`
3. **Common Table Expressions (CTEs)**
   - โครงสร้างและไวยากรณ์คำสั่ง `WITH`
   - การสร้าง Multiple CTEs ใน Query เดียวเพื่อจัดเตรียมข้อมูลหลายขั้นตอน
4. **Set Operations**
   - การรวมและหาจุดร่วมของตารางด้วย `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT`

#### รายการ Script

- [`01_inner_join_transactions_customers.sql`](course-databricks-sql-warehouse/module03_complex_query/scripts/01_inner_join_transactions_customers.sql): เชื่อมตารางขายกับลูกค้าด้วย `INNER JOIN`
- [`02_left_join_franchises_suppliers.sql`](course-databricks-sql-warehouse/module03_complex_query/scripts/02_left_join_franchises_suppliers.sql): เชื่อมสาขาแฟรนไชส์กับซัพพลายเออร์ด้วย `LEFT JOIN`
- [`03_subqueries_scalar_and_where.sql`](course-databricks-sql-warehouse/module03_complex_query/scripts/03_subqueries_scalar_and_where.sql): ตัวอย่างการใช้ Scalar Subquery และ Subquery ในเงื่อนไข `IN`
- [`04_cte_customer_sales_summary.sql`](course-databricks-sql-warehouse/module03_complex_query/scripts/04_cte_customer_sales_summary.sql): การทำความสะอาดข้อมูลหลายขั้นด้วย `WITH` clause (CTE)
- [`05_set_operations.sql`](course-databricks-sql-warehouse/module03_complex_query/scripts/05_set_operations.sql): การเปรียบเทียบตารางด้วย `UNION`, `INTERSECT`, `EXCEPT`

---

### 🔹 Module 04: Window Functions & Advanced Analytics

**โฟลเดอร์:** [`module04_window_analytics`](course-databricks-sql-warehouse/module04_window_analytics)

#### หัวข้อการเรียนรู้

1. **แนวคิดของ Window Functions**
   - ความแตกต่างระหว่าง `GROUP BY` (ยุบแถว) และ `OVER()` (รักษาแถวเดิมพร้อมคำนวณบริบท)
   - โครงสร้างคำสั่ง: `FUNCTION() OVER (PARTITION BY ... ORDER BY ... ROWS/RANGE ...)`
2. **Ranking Window Functions**
   - `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `NTILE(n)`
3. **Value & Offset Functions**
   - `LAG()` และ `LEAD()`: ดึงค่าจากแถวก่อนหน้าหรือถัดไป (คำนวณ Month-over-Month หรือเปรียบเทียบยอดขายรายวัน)
4. **Aggregate Window Functions**
   - **Running Total** (ยอดสะสม) และ **Moving Average** (ค่าเฉลี่ยเคลื่อนที่)

#### รายการ Script

- [`01_window_ranking_functions.sql`](course-databricks-sql-warehouse/module04_window_analytics/scripts/01_window_ranking_functions.sql): การเปรียบเทียบ `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- [`02_lead_lag_daily_sales.sql`](course-databricks-sql-warehouse/module04_window_analytics/scripts/02_lead_lag_daily_sales.sql): คำนวณการเปลี่ยนแปลงยอดขายรายวันด้วย `LAG()` และ `LEAD()`
- [`03_running_total_moving_avg.sql`](course-databricks-sql-warehouse/module04_window_analytics/scripts/03_running_total_moving_avg.sql): ยอดสะสม (Running Total) และ Moving Average 3 ออเดอร์ล่าสุด
- [`04_ntile_customer_segmentation.sql`](course-databricks-sql-warehouse/module04_window_analytics/scripts/04_ntile_customer_segmentation.sql): การแบ่งกลุ่มลูกค้าด้วย `NTILE(4)` (Quartile Segmentation)

---

### 🔹 Module 05: การจัดการข้อมูลข้อความและ semi-structured (Text Analytics)

**โฟลเดอร์:** [`module05_text_and_semi_structured`](course-databricks-sql-warehouse/module05_text_and_semi_structured)

#### หัวข้อการเรียนรู้

1. **การวิเคราะห์ข้อมูลความคิดเห็นลูกค้า (Customer Reviews Analysis)**
   - ทำงานร่วมกับตาราง `samples.bakehouse.media_customer_reviews` และ `media_gold_reviews_chunked`
   - การใช้ String Functions: `LOWER()`, `UPPER()`, `SUBSTRING()`, `TRIM()`, `LENGTH()`, `REPLACE()`
   - ค้นหาแบบรูปแบบด้วย `LIKE` และการแยกประเภทความคิดเห็น
2. **การจัดการข้อความขนาดใหญ่และการทำ Chunking**
   - วิเคราะห์ตาราง `media_gold_reviews_chunked` (`chunked_text`, `chunk_id`, `review_uri`)
3. **การประมวลผลชนิดข้อมูลระดับสูง (JSON & Complex Types)**
   - ฟังก์ชันจัดการ JSON: `get_json_object()`, `SPLIT()`

#### รายการ Script

- [`01_customer_reviews_sentiment_keywords.sql`](course-databricks-sql-warehouse/module05_text_and_semi_structured/scripts/01_customer_reviews_sentiment_keywords.sql): ค้นหา Keyword และจำแนก sentiment ในรีวิวลูกค้า
- [`02_gold_reviews_chunk_exploration.sql`](course-databricks-sql-warehouse/module05_text_and_semi_structured/scripts/02_gold_reviews_chunk_exploration.sql): สำรวจข้อมูล chunked text สำหรับ AI
- [`03_string_json_manipulation.sql`](course-databricks-sql-warehouse/module05_text_and_semi_structured/scripts/03_string_json_manipulation.sql): ฟังก์ชันจัดการข้อความและ JSON String (`get_json_object`)

---

### 🔹 Module 06: Views, Delta Lake Features & Performance Optimization

**โฟลเดอร์:** [`module06_views_governance_optimization`](course-databricks-sql-warehouse/module06_views_governance_optimization)

#### หัวข้อการเรียนรู้

1. **การใช้งาน Views ใน Databricks SQL**
   - Standard View vs Temporary View vs Materialized View
2. **คุณสมบัติเฉพาะของ Delta Lake (Data Governance & History)**
   - **Time Travel:** ตรวจสอบข้อมูลย้อนหลังด้วย `VERSION AS OF`
   - **Table History:** ค้นหาประวัติการแก้ไขตารางด้วย `DESCRIBE HISTORY`
3. **การเพิ่มประสิทธิภาพ Query (Performance Optimization)**
   - การจัดระเบียบไฟล์ด้วยคำสั่ง `OPTIMIZE` และดรรชนี `ZORDER BY`

#### รายการ Script

- [`01_create_views_and_materialized_views.sql`](course-databricks-sql-warehouse/module06_views_governance_optimization/scripts/01_create_views_and_materialized_views.sql): การสร้าง Standard Views และ Temp Views
- [`02_delta_time_travel_and_history.sql`](course-databricks-sql-warehouse/module06_views_governance_optimization/scripts/02_delta_time_travel_and_history.sql): การใช้ `DESCRIBE HISTORY` และ Time Travel (`VERSION AS OF 0`)
- [`03_optimize_and_zorder.sql`](course-databricks-sql-warehouse/module06_views_governance_optimization/scripts/03_optimize_and_zorder.sql): คำสั่ง `OPTIMIZE` และ `ZORDER BY` บน Delta Table

---

## 📊 รายละเอียด Dataset อ้างอิง (`samples.bakehouse`)

| ชื่อตาราง | คำอธิบาย | คอลัมน์สำคัญ |
| ---------------------------- | --------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `sales_customers` | ข้อมูลลูกค้าเบเกอรี่ | `customerID`, `first_name`, `last_name`, `city`, `country`, `continent` |
| `sales_franchises` | ข้อมูลสาขาแฟรนไชส์ | `franchiseID`, `name`, `city`, `country`, `size`, `supplierID`, `latitude`, `longitude` |
| `sales_suppliers` | ข้อมูลซัพพลายเออร์ | `supplierID`, `name`, `ingredient`, `city`, `country`, `approved` |
| `sales_transactions` | ข้อมูลรายการขาย | `transactionID`, `customerID`, `franchiseID`, `dateTime`, `product`, `quantity`, `unitPrice`, `totalPrice`, `paymentMethod` |
| `media_customer_reviews` | รีวิวจากลูกค้า | `review`, `franchiseID`, `review_date`, `new_id` |
| `media_gold_reviews_chunked` | รีวิวฉบับ Chunked สำหรับ AI | `franchiseID`, `review_date`, `chunked_text`, `chunk_id`, `review_uri` |

---

## 🛠️ เครื่องมือและสิ่งที่ต้องเตรียมล่วงหน้า (Prerequisites)

1. **Databricks Workspace Access:** สิทธิ์การใช้งาน Databricks Workspace
2. **Databricks SQL Warehouse:** SQL Warehouse ที่สร้างไว้ล่วงหน้า
3. **Unity Catalog Sample Data Access:** สิทธิ์ในการอ่านข้อมูลใน Catalog `samples` และ Schema `bakehouse`
