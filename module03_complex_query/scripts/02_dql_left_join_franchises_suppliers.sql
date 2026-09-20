-- Module 03: LEFT JOIN
-- Linking franchises with supplier details (preserving all franchises even if supplier is null)

SELECT
    f.franchiseID,
    f.name AS franchise_name,
    f.city AS franchise_city,
    f.country AS franchise_country,
    s.supplierID,
    s.name AS supplier_name,
    s.ingredient,
    s.approved AS supplier_approved
FROM
    samples.bakehouse.sales_franchises f
LEFT JOIN
    samples.bakehouse.sales_suppliers s
    ON f.supplierID = s.supplierID
ORDER BY
    f.franchiseID;
