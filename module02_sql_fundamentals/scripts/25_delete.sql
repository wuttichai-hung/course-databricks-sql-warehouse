-- Module 02: DML - DELETE (Removing Matching Rows)

CREATE SCHEMA IF NOT EXISTS demo.bakehouse;

-- 1. Create target demo table
CREATE OR REPLACE TABLE demo.bakehouse.supplier_demo AS
SELECT
    supplierID,
    name,
    ingredient,
    city,
    approved
FROM
    samples.bakehouse.sales_suppliers;

-- 2. Delete unapproved suppliers
DELETE FROM demo.bakehouse.supplier_demo
WHERE approved = 'NO';

-- 3. Verify remaining rows
SELECT COUNT(*) AS remaining_suppliers FROM demo.bakehouse.supplier_demo;

-- 4. Drop temporary table cleanup
DROP TABLE IF EXISTS demo.bakehouse.supplier_demo;
