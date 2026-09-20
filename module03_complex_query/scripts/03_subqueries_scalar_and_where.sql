-- Module 03: Subqueries
-- 1. Scalar Subquery: Find transactions with totalPrice greater than the average transaction amount
SELECT
    transactionID,
    customerID,
    product,
    totalPrice
FROM
    samples.bakehouse.sales_transactions
WHERE
    totalPrice > (
        SELECT AVG(totalPrice) 
        FROM samples.bakehouse.sales_transactions
    )
ORDER BY
    totalPrice DESC
LIMIT 15;

-- 2. Subquery in WHERE clause with IN: Find customers who made transactions paying with Credit Card
SELECT
    customerID,
    first_name,
    last_name,
    city,
    country
FROM
    samples.bakehouse.sales_customers
WHERE
    customerID IN (
        SELECT DISTINCT customerID
        FROM samples.bakehouse.sales_transactions
        WHERE paymentMethod = 'Credit Card'
    )
LIMIT 15;
