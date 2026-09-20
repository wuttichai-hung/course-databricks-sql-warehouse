-- Module 02: DML - UPDATE (Modifying Existing Rows)
CREATE SCHEMA IF NOT EXISTS demo.bakehouse;

-- 1. Create target demo table from existing franchises
CREATE OR REPLACE TABLE demo.bakehouse.franchise_updates AS
SELECT
    franchiseID,
    name,
    city,
    country,
    size
FROM
    samples.bakehouse.sales_franchises
LIMIT
    5;

-- 2. Update size for a specific franchise
UPDATE demo.bakehouse.franchise_updates
SET
    size = 'Flagship Store'
WHERE
    franchiseID = 1;

-- 3. Verify updated row
SELECT
    *
FROM
    demo.bakehouse.franchise_updates
WHERE
    franchiseID = 1;

-- 4. Drop temporary table cleanup
DROP TABLE IF EXISTS demo.bakehouse.franchise_updates;