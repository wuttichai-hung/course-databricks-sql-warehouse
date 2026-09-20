-- Module 03: Set Operations (UNION, INTERSECT, EXCEPT)

-- 1. UNION: Unique cities present in either customers or franchises tables
SELECT city, country FROM samples.bakehouse.sales_customers
UNION
SELECT city, country FROM samples.bakehouse.sales_franchises;

-- 2. INTERSECT: Cities that have BOTH customers AND franchises
SELECT city, country FROM samples.bakehouse.sales_customers
INTERSECT
SELECT city, country FROM samples.bakehouse.sales_franchises;

-- 3. EXCEPT: Franchise cities that have NO registered customers
SELECT city, country FROM samples.bakehouse.sales_franchises
EXCEPT
SELECT city, country FROM samples.bakehouse.sales_customers;
