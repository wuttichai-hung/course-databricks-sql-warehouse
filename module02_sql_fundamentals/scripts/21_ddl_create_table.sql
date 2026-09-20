-- Module 02: DDL (Data Definition Language)
-- Creating Managed and CTAS Delta Tables in Databricks SQL
CREATE SCHEMA IF NOT EXISTS demo.bakehouse;
-- 1. Create a table using CTAS (Create Table As Select)
CREATE OR REPLACE TABLE demo.bakehouse.customer_summary AS
SELECT country,
    gender,
    COUNT(customerID) AS total_customers
FROM samples.bakehouse.sales_customers
GROUP BY country,
    gender;
-- 2. Inspect the created table
SELECT *
FROM demo.bakehouse.customer_summary
ORDER BY country,
    gender;
-- 3. Drop temporary table clean up
DROP TABLE IF EXISTS demo.bakehouse.customer_summary;