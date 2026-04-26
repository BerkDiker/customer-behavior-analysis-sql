-- Top 10 most purchased products
SELECT 
    p.product_name,
    COUNT(*) AS purchase_count
FROM order_products op
JOIN products p 
    ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY purchase_count DESC
LIMIT 10; 

-- Repeat behavior
SELECT 
    reordered,
    COUNT(*) AS total_orders
FROM order_products
GROUP BY reordered;

-- Orders per customer
SELECT 
    user_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 10;

-- Customer segmentation
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

-- Customer segment distribution based on total order count
SELECT 
    customer_segment,
    COUNT(*) AS total_customers
FROM (
    SELECT 
        user_id,
        CASE 
            WHEN COUNT(order_id) >= 50 THEN 'High Value'
            WHEN COUNT(order_id) >= 10 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM orders
    GROUP BY user_id
) t
GROUP BY customer_segment;