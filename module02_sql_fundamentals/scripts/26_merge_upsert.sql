-- Module 02: DML - MERGE INTO (Atomic Upsert on Delta Lake)

CREATE SCHEMA IF NOT EXISTS demo.bakehouse;

-- 1. Create target table
CREATE OR REPLACE TABLE demo.bakehouse.target_suppliers AS
SELECT
    supplierID,
    name,
    ingredient,
    city,
    approved
FROM
    samples.bakehouse.sales_suppliers;

-- 2. Execute MERGE INTO to update existing supplier or insert new supplier
MERGE INTO demo.bakehouse.target_suppliers AS target
USING (
    SELECT 
        1 AS supplierID, 
        'Global Flour Co.' AS name, 
        'Wheat Flour' AS ingredient, 
        'Bangkok' AS city, 
        'YES' AS approved
) AS source
ON target.supplierID = source.supplierID
WHEN MATCHED THEN
    UPDATE SET 
        target.approved = source.approved,
        target.city = source.city
WHEN NOT MATCHED THEN
    INSERT (supplierID, name, ingredient, city, approved)
    VALUES (source.supplierID, source.name, source.ingredient, source.city, source.approved);

-- 3. Drop temporary table cleanup
DROP TABLE IF EXISTS demo.bakehouse.target_suppliers;
