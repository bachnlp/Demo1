USE record_company;
GO
-- FORM
CREATE TABLE manufacturers (
	code int NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);
GO
CREATE TABLE products (
	code int NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	price real,
	manufacturer int NOT NULL,
	FOREIGN KEY (manufacturer) REFERENCES manufacturers(code)
);
GO
-- DATASET
INSERT INTO Manufacturers(Code, Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code, Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code, Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code, Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code, Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code, Name) VALUES(6,'Winchester');
GO
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(1, 'Hard drive', 240, 5);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(2, 'Memory', 120, 6);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(3, 'ZIP drive', 150, 4);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(4, 'Floppy disk', 5, 6);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(5, 'Monitor', 240, 1);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(6, 'DVD drive', 180, 2);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(7, 'CD drive', 90, 2);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(8, 'Printer', 270, 3);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(9, 'Toner cartridge', 66, 3);
INSERT INTO Products(Code, Name, Price, Manufacturer) VALUES(10, 'DVD burner', 180, 2);
GO
-- List of names of all products
SELECT name FROM products;
GO
-- List of names and prices of all products
SELECT name, price FROM products;
GO
--  list of products whose price is less than 200
SELECT * FROM products WHERE price > 200;
GO
-- list  of products whose prices are between 60 and 200 
SELECT * FROM products WHERE CASE WHEN price > 60 AND price < 200 THEN 1 ELSE 0 END = 1;
GO
-- Calculate the average price for all products 
SELECT AVG(price) AS 'Average Price' FROM products;
GO
-- Calculates the average price for all products that have manufacturers = 2 
SELECT AVG(price) AS 'Average Price(2)' FROM products AS p INNER JOIN manufacturers AS m ON p.manufacturer = m.code WHERE m.code = 2;
GO
-- Calculate how many products there are with prices >= 180, sort by descending price, then name ascending
SELECT * FROM products WHERE CASE WHEN price >= 180 THEN 1 ELSE 0 END = 1 ORDER BY price DESC, name ASC;
GO
-- Write a query to get the cheapest product. 
SELECT TOP 1 * FROM products ORDER BY price ASC;
GO
-- Write a query to add a new product with information like this: | T�n: Loudspeaker | Price: 70 | Manufacturer: 2 |
INSERT INTO products(code, name, price, manufacturer) VALUES(11, 'Loudspeaker', 70, 2);
GO
-- Update the product's information with product_id=8 as "Laser Printer" 
UPDATE products SET name = 'Laser Printer' WHERE code = 8;
GO
-- Update information for ALL products, set a new price equal to 90% of the old price 
UPDATE products SET price = (90*price)/100;
GO
