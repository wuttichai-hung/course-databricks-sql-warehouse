-- Module 02: DDL - CREATE TABLE (Explicit Schema Definition)
CREATE SCHEMA IF NOT EXISTS demo.bakehouse;

-- 1. Create a new Delta table with explicit column types
CREATE TABLE
    IF NOT EXISTS demo.bakehouse.vip_customers (
        customerID BIGINT,
        full_name STRING,
        email STRING,
        city STRING,
        country STRING,
        created_at TIMESTAMP
    );

-- 2. Describe table structure
DESCRIBE TABLE demo.bakehouse.vip_customers;

-- 3. Drop temporary table cleanup
DROP TABLE IF EXISTS demo.bakehouse.vip_customers;