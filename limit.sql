USE emp
--  Create the Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

-- Insert values into the Products table
INSERT INTO Products (ProductName, Price) VALUES
('Laptop', 1000),
('Smartphone', 800),
('Tablet', 600),
('Monitor', 300),
('Keyboard', 50),
('Mouse', 30),
('Headphones', 100);

--  Fetch the first 5 rows
SELECT * FROM Products
LIMIT 5;

--  Skip the first 10 rows and fetch the next 5 rows
SELECT * FROM Products
LIMIT 5 OFFSET 2;

-- Alternative syntax for offset and limit
SELECT * FROM Products
LIMIT 4, 2;

--  Fetch rows for pagination (Page 1: Rows 1–3)
SELECT * FROM Products
ORDER BY Price DESC
LIMIT 3 OFFSET 0;


SELECT * FROM Products
ORDER BY Price DESC
LIMIT 3 OFFSET 3;


SELECT * FROM Products
ORDER BY Price DESC
LIMIT 3 OFFSET 6;

--  Fetch the top 3 highest-priced products
SELECT * FROM Products
ORDER BY Price DESC
LIMIT 3;


SELECT * FROM Products
ORDER BY RAND()
LIMIT 5;

--  Efficient pagination for large datasets (example with ProductID)
-- Assuming the last seen ProductID is 3
SELECT * FROM Products
WHERE ProductID > 3
ORDER BY ProductID
LIMIT 3;
