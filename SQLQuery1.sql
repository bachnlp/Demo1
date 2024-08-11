CREATE DATABASE bach1234;
GO

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

CREATE TABLE fact_order_2024
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

—---------------------------------- INSERT DATA  —--------------------------------------
—- insert 20 records -> dim_supplier table
INSERT INTO dim_supplier 
(supplier_id, supplier_name, contact_person, phone, email, address)
VALUES
  (1, 'Trung Thành Foods', 'Ms. Nguyễn Thị Hồng', '+84 28 3875 2222', 'sales@techtronics.com', 'Ho Chi Minh City, Vietnam'),
  (2, 'Minh Thư Company', 'Mr. Lê Văn Nam', '+84 90 6789 1234', 'info@beyondfashion.vn', 'Hanoi, Hanoi, Vietnam'),
  (3, 'An Bình Market', 'Ms. Trần Thị Lan', '+84 912 345 6789', 'david.chen@fitnessgear.com', 'Da Nang, Vietnam'),
  (4, 'Phát Đạt Grocery', 'Mr. Đinh Văn Long', '+84 321 789 0543', 'sales@greenliving.asia', 'Hai Phong, Vietnam'),
  (5, 'Việt Thành Ltd.', 'Ms. Phạm Thị Mai', '+84 861 234 5678', 'namtran@waterbottlesupply.com', 'Can Tho, Vietnam'),
  (6, 'Hà Nội Fruits and Vegetables', 'Mr. Nguyễn Ngọc Minh', '+84987654321', 'michael.wang@globalelectronics.com', 'Singapore'),
  (7, 'Lan Anh Grocery', 'Ms. Đào Thị Hương', '+84321789054', 'isabella.lee@activewear.com', 'Malaysia'),
  (8, 'Đặc Sản Hưng Yên', 'Mr. Lê Anh Tuấn', '+84912304567', 'david.nguyen@healthyhabits.com.sg', 'Singapore'),
  (9, 'Phiên Chợ Online', 'Ms. Nguyễn Thu Hà', '+84389012345', 'olivia.kim@ecolife.com.my', 'Malaysia'),
  (10, 'Thực Phẩm Xanh', 'Mr. Trần Minh Đức', '+84906789123', 'alex.park@techinnovation.com', 'Thailand'),
  (11, 'Hải Au Food', 'Ms. Phạm Thu Trang', '+84 981234567', 'lan.nguyen@officesupplies.vn', 'Hanoi, Hanoi, Vietnam'),
  (12, 'Ocean Mart', 'Mr. Nguyễn Văn Bình', '+84 0123456789', 'artdesignstudio@gmail.com', 'Ho Chi Minh City, Vietnam'),
  (13, 'Văn Minh Grocery', 'Ms. Lê Thị Ngọc', '+84 0357912345', 'books@bookworms.com', 'Da Nang, Vietnam'),
  (14, 'Thành Công Company', 'Mr. Nguyễn Anh Tuấn', '+84 0908765432', 'craftcorner@shop.vn', 'Hai Phong, Vietnam'),
  (15, '进出口 (Jìn chūkǒu) Import Export', 'Ms. Lý Phương Anh', '+84 0861234567', 'musicinstruments@vn.com', 'Can Tho, Vietnam'),
  (16, 'Quang Minh Mart', 'Mr. Trần Đăng Khoa', '+84 28 3789 4567', 'globalstationery@inc.com', 'Hong Kong'),
  (17, 'Good Life Food', 'Ms. Nguyễn Thị Hằng', '+84 9345678910', 'cozyhome@essentials.com', 'Indonesia'),
  (18, 'Lan Nhi Grocery', 'Ms. Phạm Khánh Ly', '+84 9876543291', 'babycare@products.com.sg', 'Singapore'),
  (19, 'Vũ Gia Foods', 'Mr. Đinh Văn Lợi', '+84 3278901234', 'momshop@maternity.com', 'Japan'), 
  (20, 'Thực Phẩm Mẹ Ken', 'Ms. Nguyễn Thị Linh', '+84 9654321087', 'toys@time.com', 'South Korea');
 GO


—-- insert 20 record -> dim_employees table
INSERT INTO dim_employees 
(employees_id, employees_name, job_title, hire_date, salary)
VALUES
  (1, 'Nguyen Van Long', 'Sales Manager', '2023-01-15', 55000.00),
  (2, 'Tran Thi Mai', 'Customer Service Representative', '2023-04-02', 38000.00),
  (3, 'Le Minh Vu', 'Marketing Specialist', '2022-08-21', 42000.00),
  (4, 'Cao Thi My', 'Web Developer', '2024-02-19', 50000.00),
  (5, 'Pham Minh Duc', 'Accountant', '2023-09-10', 45000.00),
  (6, 'David Williams', 'Warehouse Manager', '2022-06-05', 40000.00),
  (7, 'Isabella Garcia', 'Human Resources Specialist', '2023-11-23', 48000.00),
  (8, 'Michael Chen', 'Software Engineer', '2024-05-12', 52000.00),
  (9, 'Olivia Brown', 'Graphic Designer', '2022-12-28', 43000.00),
  (10, 'Alexander Park', 'Inventory Control Specialist', '2024-03-08', 39000.00),
  (11, 'Nguyen Thi Lan', 'IT Support Specialist', '2023-02-07', 41000.00),
  (12, 'Tran Van Nam', 'Shipping and Receiving Clerk', '2022-05-18', 35000.00),
  (13, 'Le Thi Mai', 'Content Writer', '2023-10-19', 44000.00),
  (14, 'Cao Xuan Hung', 'Data Analyst', '2024-01-26', 47000.00),
  (15, 'Pham Thu Ha', 'Quality Control Inspector', '2022-09-21', 37000.00),
  (16, 'Sarah Jones', 'Office Manager', '2023-03-14', 46000.00),
  (17, 'Chen Lin', 'Product Manager', '2024-06-11', 53000.00),
  (18, 'Kimiko Tanaka', 'Buyer', '2022-07-12', 49000.00),
  (19, 'Park Min Soo', 'Customer Service Representative', '2023-12-06', 38000.00),
  (20, 'Lee Soo Jung', 'Marketing Assistant', '2024-04-20', 36000.00);
GO

—-- insert 20 record -> dim_peyment_channel table
INSERT INTO dim_payment_channel 
(payment_channel_id, order_id, payment_date, amount)
VALUES
  (1, 1, '2024-06-01', 79.98), 
  (2, 2, '2024-06-12', 59.99), 
  (3, 3, '2024-06-15', 19.99), 
  (4, 4, '2024-06-18', 49.98), 
  (5, 5, '2024-06-20', 79.99),  
  (6, 6, '2024-06-22', 49.99), 
  (7, 7, '2024-06-25', 49.99), 
  (8, 8, '2024-06-27', 59.98),
  (9, 9, '2024-06-29', 33.98),
  (10, 10, '2024-07-01', 69.99),
  (11, 11, '2024-07-05', 12.99),
  (12, 12, '2024-07-07', 14.99),
  (13, 13, '2024-07-09', 19.99),
  (14, 14, '2024-07-11', 59.98),
  (15, 15, '2024-07-13', 99.99),
  (16, 16, '2024-07-15', 19.99),
  (17, 17, '2024-07-17', 599.97),
  (18, 18, '2024-07-19', 44.99),
  (19, 19, '2024-07-21', 69.98),
  (20, 20, '2024-07-23', 99.98);
—-- insert 20 record -> dim_product table
INSERT INTO dim_product 
(product_id, product_name, description, price, category_id, supplier_id,      quantity_in_stock)
VALUES
  (1, 'Gala Apples', 'Crisp, sweet, and vibrantly red, these organic Gala apples are perfect for snacking, baking, or salads.', 39.99, 7, 1, 50),
  (2, 'Red Seedless Grapes', 'A convenient and healthy snack, red seedless grapes offer a juicy sweetness in every bite.', 59.99, 7, 6, 30),
  (3, 'Long Grain White Rice', 'This versatile long-grain white rice cooks up fluffy and separate, perfect for pairing with any protein or vegetable dish.', 19.99, 8, 5, 75),
  (4, 'Whole Wheat Bread', 'A hearty and nutritious option, whole wheat bread is packed with fiber and keeps you feeling fuller for longer.', 24.99, 8, 4, 100),
  (5, 'Unsalted Butter', 'Unsalted butter is a kitchen essential, ideal for baking, spreading on toast, or adding richness to savory dishes.', 79.99, 3, 1, 40),
  (6, 'Sharp Cheddar Cheese', 'A tangy and flavorful cheese, sharp cheddar adds a delicious bite to sandwiches, salads, or crackers.', 49.99, 9, 3, 60),
  (7, 'Ground Beef', 'Lean ground beef is a versatile protein option, perfect for making burgers, tacos, or chili.', 44.99, 9, 9, 25),
  (8, 'Skinless, Boneless Chicken Breasts', 'A healthy and convenient protein source, boneless, skinless chicken breasts are perfect for grilling, baking, or pan-frying.', 29.99, 9, 8, 80),
  (9, 'Salmon Fillets', 'Rich in Omega-3 fatty acids, salmon fillets are a delicious and nutritious main course option.', 16.99, 10, 2, 120),
  (10, 'Egg', 'A breakfast staple, eggs are a versatile ingredient used in countless dishes, from omelets to baked goods.', 69.99, 10, 10, 15),
  (11, 'Milk', 'Milk is a great source of calcium and vitamin D, available in whole, reduced-fat, or skim varieties.', 12.99, 7, 2, 90),
  (12, 'Orange Juice', 'A refreshing and healthy drink, orange juice is a good source of Vitamin C.', 14.99, 8, 4, 50),
  (13, 'Cereal', 'Cereal is a quick and easy breakfast option, available in a variety of flavors and textures.', 19.99, 8, 5, 45),
  (14, 'Peanut Butter', 'A creamy and delicious spread, peanut butter is a perfect addition to sandwiches, snacks, or fruit.', 29.99, 6, 5, 65),
  (15, 'Yogurt', 'A healthy and probiotic-rich snack, yogurt comes in various flavors and can be topped with fruit or granola.', 99.99, 8, 7, 20),
  (16, 'Salad Mix', 'Pre-washed and chopped salad mixes save time and offer a convenient way to enjoy a salad.', 19.99, 7, 6, 85),
  (17, 'Bell Peppers', 'Bell peppers add vibrant color, sweetness, and a slight crunch to salads, stir-fries, or fajitas.', 199.99, 4, 3, 25),
  (18, 'Onions', 'A versatile cooking ingredient, onions add depth of flavor to a variety of dishes.', 44.99, 3, 1, 40),
  (19, 'Potatoes', 'A starchy and filling vegetable, potatoes can be mashed, roasted, fried, or baked.', 34.99, 3, 6, 50),
  (20, 'Pasta', 'Pasta is a pantry staple that can be combined with various sauces and ingredients for a quick and satisfying meal', 49.99, 8, 5, 70);
GO
—-- insert 20 record -> dim_promotion table
INSERT INTO dim_promotion
 (promotion_id, product_id, discount_type, discount_value, start_date, end_date)
VALUES
  (1, 1, 'percentage', 12, '2024-10-26', '2024-11-09'),  
  (2, 2, 'fixed_amount', 4, '2024-10-28', '2024-11-11'),  
  (3, 3, 'percentage', 18, '2024-10-30', '2024-11-13'), 
  (4, 4, 'fixed_amount', 7, '2024-11-01', '2024-11-15'),  
  (5, 5, 'percentage', 10, '2024-11-03', '2024-11-17'), 
  (6, 6, 'fixed_amount', 5, '2024-11-05', '2024-11-19'),  
  (7, 7, 'percentage', 8, '2024-11-07', '2024-11-21'), 
  (8, 8, 'percentage', 15, '2024-11-11', '2024-11-25'),  
  (9, 9, 'fixed_amount', 8, '2024-11-13', '2024-11-27'),  
  (10, 10, 'percentage', 20, '2024-11-15', '2024-11-29'), 
  (11, 11, 'fixed_amount', 6, '2024-11-17', '2024-12-01'),  
  (12, 12, 'percentage', 8, '2024-11-19', '2024-12-03'), 
  (13, 13, 'fixed_amount', 3, '2024-11-21', '2024-12-05'), 
  (14, 14, 'percentage', 11, '2024-11-23', '2024-12-07'),  
  (15, 15, 'fixed_amount', 10, '2024-11-25', '2024-12-09'), 
  (16, 16, 'percentage', 14, '2024-11-27', '2024-12-11'), 
  (17, 17, 'percentage', 14, '2024-11-29', '2024-12-13'),  
  (18, 18, 'fixed_amount', 3, '2024-12-01', '2024-12-15'),  
  (19, 19, 'percentage', 16, '2024-12-03', '2024-12-17'),
  (20, 20, 'fixed_amount', 5, '2024-12-05', '2024-12-19');
GO


—-- insert 20 record -> dim_customer table
INSERT INTO dim_customer 
(customer_id, customer_name, customer_sex, customer_phone, customer_address)
VALUES
  (1, 'Le Minh Hung', 'M', '+84 225 333 1122', 'Ho Chi Minh City, Vietnam'),
  (2, 'Tran Thi Mai', 'F', '+84 987 654 3210', 'Hanoi, Hanoi, Vietnam'),
  (3, 'Nguyen Van Long', 'M', '+84 351 222 4455', 'Da Nang, Vietnam'),
  (4, 'Cao Thi My', 'F', '+84 436 789 0098', 'Hai Phong, Vietnam'),
  (5, 'Pham Minh Duc', 'M', '+84 567 888 1133', 'Can Tho, Vietnam'),
  (6, 'David Williams', 'M', '+84 901 234 5678', 'Ho Chi Minh City, Vietnam'),
  (7, 'Isabella Garcia', 'F', '+84 890 678 9012', 'Da Nang, Vietnam'),
  (8, 'Michael Chen', 'M', '+84 389 123 4567', 'Hanoi, Hanoi, Vietnam'),
  (9, 'Olivia Brown', 'F', '+84 278 567 8901', 'Hai Phong, Vietnam'),
  (10, 'Alexander Park', 'M', '+84 467 901 2345', 'Can Tho, Vietnam'),
  (11, 'Nguyen Thi Lan', 'F', '+84 987 333 6677', 'Ho Chi Minh City, Vietnam'),
  (12, 'Tran Van Nam', 'M', '+84 876 543 0981', 'Da Nang, Vietnam'),
  (13, 'Le Thi Mai', 'F', '+84 265 123 7890', 'Hanoi, Hanoi, Vietnam'),
  (14, 'Cao Xuan Hung', 'M', '+84 456 012 3456', 'Hai Phong, Vietnam'),
  (15, 'Pham Thu Ha', 'F', '+84 965 432 8765', 'Can Tho, Vietnam'),
  (16, 'Sarah Jones', 'F', '+84 354 789 1230', 'Ho Chi Minh City, Vietnam'),
  (17, 'Chen Lin', 'M', '+84 843 210 5678', 'Da Nang, Vietnam'),
  (18, 'Kimiko Tanaka', 'F', '+84 234 567 8901', 'Hanoi, Hanoi, Vietnam'),
  (19, 'Park Min Soo', 'M', '+84 423 109 7856', 'Hai Phong, Vietnam'),
  (20, 'Lee Soo Jung', 'F', '+84 912 345 6789', 'Can Tho, Vietnam');
GO


—-- insert 20 record -> fact_order_2024 table
INSERT INTO fact_order_2024
(order_id, product_id, quantity, unit_price, total_price, supplier_id, promotion_id, employees_id, payment_channel_id, customer_id)
VALUES
  (1, 1, 2, 39.99, 79.98, 1, NULL, 3, 2, 1),  
  (2, 2, 1, 59.99, 59.99, 5, NULL, 5, 1, 2), 
  (3, 3, 1, 19.99, 19.99, 1, NULL, 1, 3, 3), 
  (4, 4, 2, 24.99, 49.98, 3, NULL, 7, 4, 4), 
  (5, 5, 1, 79.99, 79.99, 9, NULL, 2, 2, 5),  
  (6, 6, 1, 49.99, 49.99, 8, NULL, 4, 1, 6), 
  (7, 7, 1, 44.99, 49.99, 1, 8, 3, 2, 7),  
  (8, 8, 2, 29.99, 59.98, 4, NULL, 1, 4, 8),  
  (9, 9, 2, 16.99, 33.98, 5, NULL, 5, 3, 9),  
  (10, 10, 1, 69.99, 69.99, 10, NULL, 7, 1, 10), 
  (11, 11, 1, 12.99, 12.99, 4, NULL, 2, 2, 11), 
  (12, 12, 1, 14.99, 14.99, 6, NULL, 4, 4, 12),
  (13, 13, 1, 19.99, 19.99, 3, NULL, 1, 3, 13), 
  (14, 14, 2, 29.99, 59.98, 6, NULL, 5, 1, 14), 
  (15, 15, 1, 99.99, 99.99, 5, NULL, 3, 2, 15), 
  (16, 16, 1, 19.99, 19.99, 6, 6, 7, 4, 16), 
  (17, 17, 3, 199.99, 599.97, 2, 9, 3, 2, 17),  
  (18, 18, 1, 44.99, 44.99, 5, 2, 1, 3, 18),
  (19, 19, 2, 34.99, 69.98, 9, 6, 2, 4, 19), 
  (20, 20, 2, 49.99, 99.98, 5, 7, 5, 1, 20);
VII. EXAMPLE QUESTION
-- Function to delete a customer
DELIMITER 
CREATE PROCEDURE DeleteCustomer(
    IN p_CustomerID INT
)
BEGIN
    DELETE FROM Customers
    WHERE CustomerID = p_CustomerID;
END 
-- use
CALL DeleteCustomer(1);

-- Retrieve All Orders and Their Total Prices:
SELECT order_id, total_price
FROM fact_order_2024;
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

– Find all products with a specific category
SELECT product_name, price, category_id
FROM dim_product;
GO

– Find average price of products with a specific supplier
SELECT AVG(price) AS average_price
FROM dim_product
WHERE category_id = 7;
– Get a list of all products with low stock
SELECT product_name, quantity_in_stock
FROM dim_product
WHERE CASE WHEN quantity_in_stock < 60 
AND quantity_in_stock > 0
THEN 1 ELSE 0 END = 1
ORDER BY quantity_in_stock DESC;
GO

– Find all discounted products and their details
SELECT p.product_id, p.product_name, p.price, d.discount_type, d.discount_value
FROM dim_product AS p
INNER JOIN dim_promotion AS d ON p.product_id = d.product_id;
GO

– Find products with a specific discount type “percentage” and their suppliers
SELECT p.product_id, d.discount_type, p.product_name, s.supplier_name
FROM dim_product AS p
INNER JOIN dim_promotion AS d ON p.product_id = d.product_id
INNER JOIN dim_supplier AS s ON p.supplier_id = s.supplier_id
WHERE d.discount_type = 'percentage';
GO

– List all products with a price above a certain value and thor suppliers information
SELECT p.product_name, p.price, s.contact_person, s.phone, s.email
FROM dim_product AS p
	INNER JOIN dim_supplier AS s ON p.supplier_id = s.supplier_id
	WHERE p.price > 40.00;
GO

– Find all suppliers located in a specific city 
SELECT s.supplier_id, s.supplier_name, s.contact_person, s.phone, s.email, s.address
FROM dim_supplier AS s
	WHERE s.address LIKE '%Hai Phong%';
GO
	
-- Retrieve Product Information for a Specific Order:
SELECT f.order_id, f.product_id, p.product_name, p.description,  f.quantity, f.unit_price,                 f.total_price
FROM fact_order_2024 AS f
JOIN dim_product AS p ON f.product_id = p.product_id
WHERE f.order_id = 5;
GO

-- List Employees and Their Total Sales:
SELECT e.employees_id, e.employees_name,
SUM(f.total_price) AS total_sales
FROM dim_employees AS e
JOIN fact_order_2024 AS f ON e.employees_id = f.employees_id
GROUP BY e.employees_id, e.employees_name
ORDER BY total_sales DESC;
GO

-- Find the Total Sales for Each Product Category:
SELECT p.category_id,
COUNT(f.product_id) AS num_products, 
SUM(f.total_price) AS total_sales
FROM dim_product AS p
JOIN fact_order_2024 AS f ON p.product_id = f.product_id
GROUP BY p.category_id;
GO

-- Retrieve Customer Information and Their Purchase History:
SELECT c.customer_id, c.customer_name, c.customer_phone, f.order_id, f.total_price
FROM dim_customer AS c
JOIN fact_order_2024 AS f ON c.customer_id = f.customer_id
ORDER BY c.customer_id, f.order_id;
GO

– Find all products with their corresponding promotions
SELECT p.product_name, d.discount_type, d.discount_value
FROM dim_product AS p
LEFT JOIN dim_promotion AS d ON p.product_id = d.product_id
WHERE CASE WHEN d.discount_value > 0.00 AND d.discount_value < 10.00 
THEN 1 ELSE 0 END = 1
ORDER BY d.discount_value ASC;
GO

– Find all customer orders with their corresponding employee information
SELECT c.customer_name, f.order_id, e.employees_name
FROM fact_order_2024 AS f
	LEFT JOIN dim_customer AS c ON f.customer_id = c.customer_id
	LEFT JOIN dim_employees AS e ON f.employees_id = e.employees_id;
GO

– Analyze which payment channels ware used for orders
SELECT d.payment_channel_id, COUNT(*) AS order_count
FROM fact_order_2024 AS f
	LEFT JOIN dim_payment_channel AS d ON f.payment_channel_id =     d.payment_channel_id
	GROUP BY d.payment_channel_id;
GO

