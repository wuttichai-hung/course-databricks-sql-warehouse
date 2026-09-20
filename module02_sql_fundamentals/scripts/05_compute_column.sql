-- DQL: Column Expressions & Computed Fields
SELECT
    customerID,
    CONCAT(first_name, ' ', last_name) AS full_name,
    gender,
    email_address,
    city,
    country,
    continent
FROM
    samples.bakehouse.sales_customers
WHERE
    gender = 'female'
    AND country IN ('Japan', 'USA')
    AND email_address LIKE '%@example.com'
ORDER BY
    customerID ASC;
