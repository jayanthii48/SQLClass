SELECT column_names
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
CREATE DATABASE GP
USE GP
drop database gp
-- 1. Create Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100)
);

-- 2. Insert data into Customers Table
INSERT INTO Customers (CustomerName, Email)
VALUES 
    ('Alice', 'alice@example.com'),
    ('Bob', 'bob@example.com'),
    ('Carol', 'carol@example.com'),
    ('David', 'david@example.com'),
    ('Eve', 'eve@example.com'),
    ('Frank', 'frank@example.com'),
    ('Grace', 'grace@example.com'),
    ('Hannah', 'hannah@example.com'),
    ('Ivy', 'ivy@example.com'),
    ('Jack', 'jack@example.com');


select c.CustomerName ,
     o.TotalAmount 
from Customers c 
inner join Orders o
on c.CustomerID=o.CustomerID;




-- 3. Create Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. Insert data into Orders Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
    (1, '2024-11-01', 200.00),
    (2, '2024-11-02', 150.00),
    (1, '2024-11-03', 120.00),
    (5, '2024-11-05', 250.00),
    (6, '2024-11-06', 80.00),
    (7, '2024-11-07', 140.00),
    (8, '2024-11-08', 300.00),
    (9, '2024-11-09', 110.00),
    (10, '2024-11-10', 170.00);

-- 5. Create Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- 6. Insert data into Products Table
INSERT INTO Products (ProductName, Price)
VALUES 
    ('Pen', 1.50),
    ('Notebook', 2.00),
    ('Pencil', 0.50),
    ('Eraser', 0.30),
    ('Marker', 1.80),
    ('Highlighter', 2.50),
    ('Ruler', 0.80),
    ('Scissors', 1.20),
    ('Glue', 1.00),
    ('Tape', 0.90);

-- 7. Create OrderDetails Table (many-to-many relationship between Orders and Products)
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 8. Insert data into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID)
VALUES 
    (1,1),
    (2,2),
    (3,3);
    
SELECT * FROM OrderDetails
-- 9. Perform INNER JOIN using simple aliases (c for Customers, o for Orders)
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    o.OrderID, 
    o.OrderDate, 
    o.TotalAmount
FROM 
    Customers c
INNER JOIN 
    Orders o ON c.CustomerID = o.CustomerID;

-- 10. Perform INNER JOIN using more descriptive aliases (customer for Customers, order for Orders)
SELECT 
    customer.CustomerID, 
    customer.CustomerName, 
    order.OrderID, 
    order.OrderDate, 
    order.TotalAmount
FROM 
    Customers AS customer
INNER JOIN 
    Orders AS order ON customer.CustomerID = order.CustomerID;

-- 11. Perform INNER JOIN using longer, more explicit aliases (customerTable for Customers, orderTable for Orders)
SELECT 
    customerTable.CustomerID, 
    customerTable.CustomerName, 
    orderTable.OrderID, 
    orderTable.OrderDate, 
    orderTable.TotalAmount
FROM 
    Customers AS customerTable
INNER JOIN 
    Orders AS orderTable ON customerTable.CustomerID = orderTable.CustomerID;

-- 12. Perform INNER JOIN with three tables (Customers, Orders, OrderDetails, Products)
SELECT 
    c.CustomerName, 
    o.OrderID, 
    o.OrderDate, 
    p.ProductName, 
    p.Price
FROM 
    Customers c
INNER JOIN 
    Orders o ON c.CustomerID = o.CustomerID
INNER JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN 
    Products p ON od.ProductID = p.ProductID;

-- 13. Perform INNER JOIN with WHERE Clause (filtering by product price greater than 1.00)
SELECT 
    c.CustomerName, 
    o.OrderID, 
    o.OrderDate, 
    p.ProductName, 
    p.Price
FROM 
    Customers c
INNER JOIN 
    Orders o ON c.CustomerID = o.CustomerID
INNER JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 
    p.Price > 1.00;
