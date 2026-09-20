# Module 02: พื้นฐาน SQL & Data Operations (DQL, DDL, DML)

โมดูลนี้ปูพื้นฐานการเขียน SQL Query สำหรับคิวรี สรุปผล จัดกลุ่ม และจัดการข้อมูลตาราง Delta Lake บน Databricks SQL Warehouse

## 📋 สคริปต์ในโมดูลนี้:

1. **[`01_explore_customer_data.sql`](scripts/01_explore_customer_data.sql)** - การคิวรีดูข้อมูลลูกค้าทั้งหมด (`SELECT *`)
2. **[`02_select_column.sql`](scripts/02_select_column.sql)** - การเลือกเฉพาะคอลัมน์ที่ต้องการ
3. **[`03_filter_row.sql`](scripts/03_filter_row.sql)** - การกรองแถวด้วยเงื่อนไข `WHERE`
4. **[`04_order_row.sql`](scripts/04_order_row.sql)** - การเรียงลำดับข้อมูลด้วย `ORDER BY` และ `LIMIT`
5. **[`05_compute_column.sql`](scripts/05_compute_column.sql)** - การคำนวณและสร้างคอลัมน์ใหม่ (Column Expression)
6. **[`11_explore_transaction_data.sql`](scripts/11_explore_transaction_data.sql)** - คิวรีสำรวจข้อมูลรายการขาย
7. **[`12_aggregate_by_product.sql`](scripts/12_aggregate_by_product.sql)** - การสรุปผลและจัดกลุ่มด้วย `GROUP BY` (`COUNT`, `SUM`, `AVG`)
8. **[`13_aggregate_by_product_filter_after_agg.sql`](scripts/13_aggregate_by_product_filter_after_agg.sql)** - การกรองผลลัพธ์หลังสรุปผลด้วย `HAVING`
9. **[`21_ddl_create_table.sql`](scripts/21_ddl_create_table.sql)** - การสร้างตารางแบบ CTAS (Create Table As Select)
10. **[`22_dml_insert_update_delete.sql`](scripts/22_dml_insert_update_delete.sql)** - คำสั่งจัดการข้อมูล `INSERT`, `UPDATE`, `DELETE`
11. **[`23_dml_merge_upsert.sql`](scripts/23_dml_merge_upsert.sql)** - การทำ Upsert ด้วยคำสั่ง `MERGE INTO` บน Delta Lake
