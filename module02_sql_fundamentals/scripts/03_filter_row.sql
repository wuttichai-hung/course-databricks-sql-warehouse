SELECT
    customerID,
    first_name,
    last_name,
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