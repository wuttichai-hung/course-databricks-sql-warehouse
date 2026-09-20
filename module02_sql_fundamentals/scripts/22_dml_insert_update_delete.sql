-- Module 02: DML (Data Manipulation Language)
-- Demonstrating INSERT, UPDATE, and DELETE on Delta Lake tables

-- 1. Create target table for testing DML
CREATE OR REPLACE TABLE default.target_franchise_demo AS
SELECT
    franchiseID,
    name,
    city,
    country,
    size
FROM
    samples.bakehouse.sales_franchises
LIMIT 5;

-- 2. INSERT new row
INSERT INTO default.target_franchise_demo
VALUES (9999, 'Bakehouse New Branch', 'Bangkok', 'Thailand', 'Large');

-- 3. UPDATE existing row
UPDATE default.target_franchise_demo
SET size = 'Extra Large'
WHERE franchiseID = 9999;

-- 4. DELETE row
DELETE FROM default.target_franchise_demo
WHERE franchiseID = 9999;

-- Cleanup
DROP TABLE IF EXISTS default.target_franchise_demo;
