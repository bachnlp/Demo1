CREATE DATABASE team_final;
GO
USE [team_final];
GO
-- Format-- format
CREATE TABLE dim_supplier
(
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    contact_person VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50),
    address VARCHAR(100)
);
GO
CREATE TABLE dim_employees
(
    employees_id INT PRIMARY KEY,
    employees_name VARCHAR(50),
    job_title VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(15,2)
);
GO
CREATE TABLE dim_payment_channel
(
    payment_channel_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(15,2)
);
GO
CREATE TABLE dim_product
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    description TEXT,
    price DECIMAL(15,2),
    category_id INT,
    supplier_id INT,
    quantity_in_stock INT,
    FOREIGN KEY (supplier_id) REFERENCES dim_supplier(supplier_id)
);
GO
CREATE TABLE dim_promotion
(
    promotion_id INT PRIMARY KEY,
    product_id INT,
    discount_type VARCHAR(20),
    discount_value DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
GO
CREATE TABLE dim_customer
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_sex CHAR(1),
    customer_phone VARCHAR(20),
    customer_address VARCHAR(100)
);
GO
CREATE TABLE fact_order_2023
(
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(15,2),
    total_price DECIMAL(15,2),
    supplier_id INT,
    promotion_id INT,
    employees_id INT,
    payment_channel_id INT,
    customer_id INT,
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (supplier_id) REFERENCES dim_supplier(supplier_id),
    FOREIGN KEY (promotion_id) REFERENCES dim_promotion(promotion_id),
    FOREIGN KEY (employees_id) REFERENCES dim_employees(employees_id),
    FOREIGN KEY (payment_channel_id) REFERENCES dim_payment_channel(payment_channel_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id)
);
GO
-- data
INSERT INTO dim_supplier
    (supplier_id, supplier_name, contact_person, phone, email, address)
VALUES
    (1, 'Supplier1', 'Contact1', '123-456-7890', 'contact1@example.com', 'Address1'),
    (2, 'Supplier2', 'Contact2', '987-654-3210', 'contact2@example.com', 'Address2'),
    (3, 'Supplier3', 'Contact3', '456-123-7890', 'contact3@example.com', 'Address3'),
    (4, 'Supplier4', 'Contact4', '789-321-6540', 'contact4@example.com', 'Address4'),
    (5, 'Supplier5', 'Contact5', '321-789-6540', 'contact5@example.com', 'Address5');
GO
-- Inserting data into dim_employees
INSERT INTO dim_employees
    (employees_id, employees_name, job_title, hire_date, salary)
VALUES
    (1, 'Employee1', 'Manager', '2022-01-01', 50000.00),
    (2, 'Employee2', 'Sales Associate', '2022-02-15', 35000.00),
    (3, 'Employee3', 'Accountant', '2022-03-20', 45000.00),
    (4, 'Employee4', 'IT Specialist', '2022-04-10', 40000.00),
    (5, 'Employee5', 'Customer Service', '2022-05-25', 38000.00);
GO
-- Inserting data into dim_payment_channel
INSERT INTO dim_payment_channel
    (payment_channel_id, order_id, payment_date, amount)
VALUES
    (1, 101, '2023-01-05', 1500.00),
    (2, 102, '2023-02-10', 2000.00),
    (3, 103, '2023-03-15', 1800.00),
    (4, 104, '2023-04-20', 2200.00),
    (5, 105, '2023-05-25', 2500.00);
GO
-- Insert data
INSERT INTO dim_product
    (product_id, product_name, description, price, category_id, supplier_id, quantity_in_stock)
VALUES
    (1, 'Product1', 'Description1', 50.00, 1, 1, 100),
    (2, 'Product2', 'Description2', 30.00, 2, 2, 150),
    (3, 'Product3', 'Description3', 25.00, 1, 3, 120),
    (4, 'Product4', 'Description4', 40.00, 3, 4, 200),
    (5, 'Product5', 'Description5', 60.00, 2, 5, 80);
GO
-- Inserting data into dim_promotion
INSERT INTO dim_promotion
    (promotion_id, product_id, discount_type, discount_value, start_date, end_date)
VALUES
    (1, 1, 'Percentage', 10.00, '2023-01-01', '2023-02-01'),
    (2, 2, 'Fixed Amount', 5.00, '2023-02-15', '2023-03-15'),
    (3, 3, 'Percentage', 15.00, '2023-03-20', '2023-04-20'),
    (4, 4, 'Fixed Amount', 8.00, '2023-04-25', '2023-05-25'),
    (5, 5, 'Percentage', 12.00, '2023-05-30', '2023-06-30');
GO
-- Inserting data into dim_customer
INSERT INTO dim_customer
    (customer_id, customer_name, customer_sex, customer_phone, customer_address)
VALUES
    (1, 'Customer1', 'M', '111-222-3333', 'Address1'),
    (2, 'Customer2', 'F', '444-555-6666', 'Address2'),
    (3, 'Customer3', 'M', '777-888-9999', 'Address3'),
    (4, 'Customer4', 'F', '123-456-7890', 'Address4'),
    (5, 'Customer5', 'M', '987-654-3210', 'Address5');
GO
-- Inserting data into fact_order_2023
INSERT INTO fact_order_2023
    (order_id, product_id, quantity, unit_price, total_price, supplier_id, promotion_id, employees_id, payment_channel_id, customer_id)
VALUES
    (1, 1, 10, 200000, 2000000, 1, 1, 1, 1, 1),
    (2, 2, 15, 150000, 2250000, 2, 2, 2, 2, 2),
    (3, 3, 13, 460000, 5980000, 3, 3, 3, 3, 3),
    (4, 4, 18, 760000, 13680000, 4, 4, 4, 4, 4),
    (5, 5, 32, 1150000, 20700000, 5, 5, 5, 5, 5);
GO
-- Queries
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