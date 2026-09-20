# Module 03: การเชื่อมโยงข้อมูลและการทำ Query ซับซ้อน (Joins, Subqueries & CTEs)

โมดูลนี้ครอบคลุมการเชื่อมโยงตารางข้อมูลหลายตาราง (Joins), การใช้งาน Subquery, คำสั่ง Common Table Expressions (`WITH` clause) และ Set Operations

## 📋 สคริปต์ในโมดูลนี้:

1. **[`01_inner_join_transactions_customers.sql`](scripts/01_inner_join_transactions_customers.sql)** - การเชื่อมตารางธุรกรรมการขายเข้ากับโปรไฟล์ลูกค้าด้วย `INNER JOIN`
2. **[`02_left_join_franchises_suppliers.sql`](scripts/02_left_join_franchises_suppliers.sql)** - การเชื่อมสาขาแฟรนไชส์เข้ากับซัพพลายเออร์ด้วย `LEFT JOIN`
3. **[`03_subqueries_scalar_and_where.sql`](scripts/03_subqueries_scalar_and_where.sql)** - การใช้ Scalar Subquery และ Subquery กับเงื่อนไข `IN`
4. **[`04_cte_customer_sales_summary.sql`](scripts/04_cte_customer_sales_summary.sql)** - การจัดโครงสร้างคิวรีด้วย Common Table Expression (`WITH` clause) แบบหลายขั้นตอน
5. **[`05_set_operations.sql`](scripts/05_set_operations.sql)** - การเปรียบเทียบเซตข้อมูลด้วย `UNION`, `INTERSECT`, `EXCEPT`
