-- DQL: String & Date/Time Manipulation Functions

SELECT
    transactionID,
    customerID,
    dateTime,
    -- Date & Time extraction
    YEAR(dateTime) AS tx_year,
    MONTH(dateTime) AS tx_month,
    DAYOFWEEK(dateTime) AS tx_day_of_week,
    DATE_TRUNC('month', dateTime) AS tx_month_start,
    -- String manipulations
    UPPER(product) AS product_uppercase,
    LOWER(paymentMethod) AS payment_lowercase,
    SUBSTRING(product, 1, 5) AS product_short_code,
    LENGTH(product) AS product_name_length
FROM
    samples.bakehouse.sales_transactions
ORDER BY
    dateTime DESC
LIMIT 20;
