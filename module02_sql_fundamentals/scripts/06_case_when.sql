-- DQL: Conditional Logic with CASE WHEN (Searched CASE & Simple CASE)

-- 1. Categorize transaction size based on totalPrice
SELECT
    transactionID,
    customerID,
    product,
    quantity,
    unitPrice,
    totalPrice,
    CASE
        WHEN totalPrice >= 100 THEN 'High Value'
        WHEN totalPrice >= 30 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_tier,
    CASE paymentMethod
        WHEN 'Credit Card' THEN 'Card Payment'
        WHEN 'Cash' THEN 'Cash Payment'
        ELSE 'Digital / Other'
    END AS payment_category
FROM
    samples.bakehouse.sales_transactions
ORDER BY
    totalPrice DESC
LIMIT 25;
