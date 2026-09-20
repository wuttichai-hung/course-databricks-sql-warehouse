-- DQL: Selecting specific columns
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
    samples.bakehouse.sales_customers;
