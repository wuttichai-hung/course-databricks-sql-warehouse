-- Module 02: DDL - CREATE OR REPLACE TABLE AS SELECT (CRAS)

CREATE SCHEMA IF NOT EXISTS demo.bakehouse;

-- 1. Create or replace table atomically (overwriting schema & data)
CREATE OR REPLACE TABLE demo.bakehouse.product_sales_summary AS
SELECT
    product,
    SUM(quantity) AS total_quantity_sold,
    SUM(totalPrice) AS total_revenue
FROM
    samples.bakehouse.sales_transactions
GROUP BY
    product;

-- 2. Verify replaced table
SELECT * FROM demo.bakehouse.product_sales_summary ORDER BY total_revenue DESC;

-- 3. Drop temporary table cleanup
DROP TABLE IF EXISTS demo.bakehouse.product_sales_summary;