-- DQL: Filtering rows using WHERE clause
SELECT
    customerID,
    first_name,
    last_name,
    country,
    city
FROM
    samples.bakehouse.sales_customers
WHERE
    country IN ('Japan', 'USA')
    AND gender = 'female';
