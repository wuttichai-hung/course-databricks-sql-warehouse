-- Module 01: Test Query using 3-Level Namespace
-- Table: samples.bakehouse.sales_customers

SELECT
    customerID,
    first_name,
    last_name,
    city,
    country
FROM
    samples.bakehouse.sales_customers
LIMIT 10;
