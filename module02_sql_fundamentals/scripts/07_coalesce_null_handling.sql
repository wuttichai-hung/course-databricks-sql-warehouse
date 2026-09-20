-- DQL: Handling NULL Values with COALESCE, IFNULL, NVL, and NULLIF

SELECT
    c.customerID,
    c.first_name,
    c.last_name,
    -- Fallback default values if address or phone is missing/null
    COALESCE(c.address, 'N/A') AS display_address,
    IFNULL(c.phone_number, 'No Phone') AS contact_phone,
    NVL(c.state, 'Unknown State') AS state_info,
    -- NULLIF returns NULL if total price equals zero
    NULLIF(t.totalPrice, 0) AS adjusted_price
FROM
    samples.bakehouse.sales_customers c
LEFT JOIN
    samples.bakehouse.sales_transactions t ON c.customerID = t.customerID
LIMIT 20;
