-- DQL: Aggregate functions & GROUP BY
SELECT
    product,
    COUNT(transactionID) AS total_orders,
    SUM(quantity) AS total_quantity_sold,
    SUM(totalPrice) AS total_revenue,
    AVG(totalPrice) AS avg_revenue_per_order
FROM
    samples.bakehouse.sales_transactions
GROUP BY
    product
ORDER BY
    total_revenue DESC;
