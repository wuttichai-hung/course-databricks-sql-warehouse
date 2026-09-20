-- Module 02: MERGE INTO (Upsert Logic on Delta Lake)
-- Atomically UPDATE existing matching records and INSERT new records

-- 1. Create target table
CREATE OR REPLACE TABLE default.target_suppliers AS
SELECT
    supplierID,
    name,
    ingredient,
    city,
    approved
FROM
    samples.bakehouse.sales_suppliers;

-- 2. Execute MERGE INTO to update status or insert new supplier
MERGE INTO default.target_suppliers AS target
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

-- Cleanup
DROP TABLE IF EXISTS default.target_suppliers;
