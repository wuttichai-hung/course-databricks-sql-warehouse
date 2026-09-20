-- Module 03: Common Table Expressions (CTE) using WITH clause
-- Multi-stage transformation for customer sales metrics

WITH customer_totals AS (
    -- Stage 1: Calculate total spending per customer
    SELECT
        customerID,
        COUNT(transactionID) AS total_orders,
        SUM(totalPrice) AS total_spending,
        AVG(totalPrice) AS avg_order_value
    FROM
        samples.bakehouse.sales_transactions
    GROUP BY
        customerID
),
customer_details AS (
    -- Stage 2: Join customer totals with customer master table
    SELECT
        c.customerID,
        c.first_name,
        c.last_name,
        c.country,
        ct.total_orders,
        ct.total_spending,
        ct.avg_order_value
    FROM
        samples.bakehouse.sales_customers c
    JOIN
        customer_totals ct ON c.customerID = ct.customerID
)
-- Final Output: Filter high value customers
SELECT
    customerID,
    CONCAT(first_name, ' ', last_name) AS full_name,
    country,
    total_orders,
    total_spending,
    ROUND(avg_order_value, 2) AS avg_order_value
FROM
    customer_details
WHERE
    total_spending > 500
ORDER BY
    total_spending DESC;
