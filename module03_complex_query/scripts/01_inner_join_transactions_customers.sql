-- Module 03: INNER JOIN
-- Linking transactions with customer profile details

SELECT
    t.transactionID,
    t.dateTime,
    t.customerID,
    c.first_name,
    c.last_name,
    c.email_address,
    c.country AS customer_country,
    t.product,
    t.quantity,
    t.totalPrice
FROM
    samples.bakehouse.sales_transactions t
INNER JOIN
    samples.bakehouse.sales_customers c
    ON t.customerID = c.customerID
ORDER BY
    t.dateTime DESC
LIMIT 20;
