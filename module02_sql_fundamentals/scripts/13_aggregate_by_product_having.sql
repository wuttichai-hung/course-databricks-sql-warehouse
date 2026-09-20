-- DQL: Filtering aggregated results using HAVING clause
SELECT
    product,
    COUNT(transactionID) AS total_orders,
    SUM(quantity) AS total_quantity_sold,
    SUM(totalPrice) AS total_revenue
FROM
    samples.bakehouse.sales_transactions
GROUP BY
    product
HAVING
    SUM(totalPrice) > 5000
ORDER BY
    total_revenue DESC;
