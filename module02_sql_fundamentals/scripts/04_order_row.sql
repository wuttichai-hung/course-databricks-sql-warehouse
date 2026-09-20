-- DQL: Sorting rows with ORDER BY and limiting results
SELECT
    transactionID,
    customerID,
    dateTime,
    product,
    totalPrice
FROM
    samples.bakehouse.sales_transactions
ORDER BY
    totalPrice DESC
LIMIT 20;
