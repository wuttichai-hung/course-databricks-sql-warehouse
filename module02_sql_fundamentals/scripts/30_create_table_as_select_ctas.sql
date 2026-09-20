-- Module 02: DDL - CREATE TABLE AS SELECT (CTAS)

CREATE SCHEMA IF NOT EXISTS demo.bakehouse;

-- 1. Create table directly from query results
CREATE TABLE demo.bakehouse.customer_country_summary AS
SELECT
    country,
    COUNT(customerID) AS total_customers
FROM
    samples.bakehouse.sales_customers
GROUP BY
    country;

-- 2. Query CTAS table
SELECT * FROM demo.bakehouse.customer_country_summary ORDER BY total_customers DESC;

-- 3. Drop temporary table cleanup
DROP TABLE IF EXISTS demo.bakehouse.customer_country_summary;