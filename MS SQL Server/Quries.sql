-- Retrieve All Orders and Their Total Prices:
SELECT order_id, total_price
FROM fact_order_2023;
GO
-- List Employee Names and Salaries:
SELECT employees_name, salary
FROM dim_employees;
GO
-- Get Product Information and Quantities in Stock:
SELECT product_name, description, quantity_in_stock
FROM dim_product;
GO
-- Find Customers and Their Addresses:
SELECT customer_name, customer_address
FROM dim_customer;
GO
-- Show Promotions and Their Discount Types:
SELECT promotion_id, discount_type
FROM dim_promotion;
GO
-- Retrieve Product Information for a Specific Order:
SELECT
    f.order_id,
    f.product_id,
    p.product_name,
    p.description,
    f.quantity,
    f.unit_price,
    f.total_price
FROM fact_order_2023 AS f
    JOIN dim_product AS p ON f.product_id = p.product_id
WHERE f.order_id = 5;
GO
-- List Employees and Their Total Sales:
SELECT
    e.employees_id,
    e.employees_name,
    SUM(f.total_price) AS total_sales
FROM dim_employees AS e
    JOIN fact_order_2023 AS f ON e.employees_id = f.employees_id
GROUP BY e.employees_id, e.employees_name
ORDER BY total_sales DESC;
GO
-- Find the Total Sales for Each Product Category:
SELECT
    p.category_id,
    COUNT(f.product_id) AS num_products,
    SUM(f.total_price) AS total_sales
FROM dim_product AS p
    JOIN fact_order_2023 AS f ON p.product_id = f.product_id
GROUP BY p.category_id;
GO
-- Retrieve Customer Information and Their Purchase History:
SELECT
    c.customer_id,
    c.customer_name,
    c.customer_phone,
    f.order_id,
    f.total_price
FROM dim_customer AS c
    JOIN fact_order_2023 AS f ON c.customer_id = f.customer_id
ORDER BY c.customer_id, f.order_id;
GO