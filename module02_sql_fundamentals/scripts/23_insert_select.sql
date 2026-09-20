-- Module 02: DML - INSERT INTO SELECT (Batch Insertion from Query)

CREATE SCHEMA IF NOT EXISTS demo.bakehouse;

-- 1. Prepare target table
CREATE OR REPLACE TABLE demo.bakehouse.japan_customers (
    customerID BIGINT,
    first_name STRING,
    last_name STRING,
    email_address STRING,
    city STRING
);

-- 2. Insert rows selected from samples.bakehouse.sales_customers
INSERT INTO demo.bakehouse.japan_customers
SELECT
    customerID,
    first_name,
    last_name,
    email_address,
    city
FROM
    samples.bakehouse.sales_customers
WHERE
    country = 'Japan';

-- 3. Verify batch inserted rows
SELECT * FROM demo.bakehouse.japan_customers LIMIT 10;

-- 4. Drop temporary table cleanup
DROP TABLE IF EXISTS demo.bakehouse.japan_customers;
