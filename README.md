# Customer Behavior Analysis (SQL)

## Overview

Analyzed customer purchasing behavior using SQL on a large-scale e-commerce dataset.

## Key Insights

* Customer retention is strong, with repeat purchases exceeding first-time purchases
* Fresh and organic products are among the most frequently purchased items
* Majority of customers fall into Medium and Low value segments
* A smaller group of high-value customers shows significantly higher engagement and purchasing frequency

## Techniques Used

* JOIN operations
* Aggregations (COUNT, GROUP BY)
* CASE WHEN for segmentation
* Subqueries for distribution analysis

## Tools

* PostgreSQL

## Sample Query (Customer Segmentation)

```sql
SELECT 
    user_id,
    COUNT(order_id) AS total_orders,
    CASE 
        WHEN COUNT(order_id) >= 50 THEN 'High Value'
        WHEN COUNT(order_id) >= 10 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM orders
GROUP BY user_id;
