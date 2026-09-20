# Bakehouse

The Bakehouse Dataset simulates a bakery franchise business and contains several key datasets for various analytical and AI-driven use cases. Please note that this sample dataset has been synthetically curated and is suitable for any Databricks workload.

Sample use cases for this dataset include:

Building Data Pipelines with Delta Live Tables: Create automated, real-time data pipelines for efficient data ingestion, transformation, and management.
Performing Analytics with Databricks SQL: Conduct powerful SQL-based analytics to uncover actionable insights from structured data, including sales trends and customer behavior.
Exploring AI and Machine Learning Capabilities: Use the dataset to develop and train machine learning models, applying AI to forecast trends, optimize operations, and predict customer preferences.

## samples.bakehouse.media_customer_reviews

|Column|Type|
|--|--|
|review|string|
|franchiseID|bigint|
|review_date|timestamp|
|new_id|int|

## samples.bakehouse.media_gold_reviews_chunked

|Column|Type|
|--|--|
|franchiseID|int|
|review_date|timestamp|
|chunked_text|string|
|chunk_id|string|
|review_uri|string|

## samples.bakehouse.sales_customers

|Column|Type|
|--|--|
|customerID|bigint|
|first_name|string|
|last_name|string|
|email_address|string|
|phone_number|string|
|address|string|
|city|string|
|state|string|
|country|string|
|continent|string|
|postal_zip_code|bigint|
|gender|string|

## samples.bakehouse.sales_franchises

|Column|Type|
|--|--|
|franchiseID|bigint|
|name|string|
|city|string|
|district|string|
|zipcode|string|
|country|string|
|size|string|
|longitude|double|
|latitude|double|
|supplierID|bigint|

## samples.bakehouse.sales_suppliers

|Column|Type|
|--|--|
|supplierID|bigint|
|name|string|
|ingredient|string|
|continent|string|
|city|string|
|district|string|
|size|string|
|longitude|double|
|latitude|double|
|approved|string|

## samples.bakehouse.sales_transactions

|Column|Type|
|--|--|
|transactionID|bigint|
|customerID|bigint|
|franchiseID|bigint|
|dateTime|timestamp|
|product|string|
|quantity|bigint|
|unitPrice|bigint|
|totalPrice|bigint|
|paymentMethod|string|
|cardNumber|bigint|
