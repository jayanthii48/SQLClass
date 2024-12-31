CREATE TABLE Groceries (
    GroceryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

-- Order List Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

-- Customer List Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Order Details Table (for mapping groceries to orders)
CREATE TABLE OrderDetails (
    DetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    GroceryID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (GroceryID) REFERENCES Groceries(GroceryID)
);

-- Insert Groceries
INSERT INTO Groceries (Name, Category, Price, Stock) VALUES
('Apple', 'Fruit', 3.50, 100),
('Banana', 'Fruit', 1.00, 150),
('Carrot', 'Vegetable', 2.00, 200),
('Broccoli', 'Vegetable', 2.50, 50),
('Chicken Breast', 'Meat', 5.00, 80),
('Salmon', 'Fish', 10.00, 30),
('Milk', 'Dairy', 3.00, 70),
('Bread', 'Bakery', 2.00, 100),
('Eggs', 'Dairy', 4.00, 200),
('Rice', 'Grain', 2.50, 150);

-- Insert Customers
INSERT INTO Customers (Name, Email, Phone) VALUES
('Alice Johnson', 'alice@example.com', '1234567890'),
('Bob Smith', 'bob@example.com', '1234567891'),
('Cathy Brown', 'cathy@example.com', '1234567892'),
('David Lee', 'david@example.com', '1234567893'),
('Ella Davis', 'ella@example.com', '1234567894'),
('Frank Wright', 'frank@example.com', '1234567895'),
('Grace Hall', 'grace@example.com', '1234567896'),
('Henry Clark', 'henry@example.com', '1234567897'),
('Ivy Adams', 'ivy@example.com', '1234567898'),
('Jack King', 'jack@example.com', '1234567899');

-- Insert Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-12-01', 20.50),
(2, '2024-12-02', 15.00),
(3, '2024-12-03', 30.00),
(4, '2024-12-04', 50.00),
(5, '2024-12-05', 25.00),
(6, '2024-12-06', 10.00),
(7, '2024-12-07', 35.00),
(8, '2024-12-08', 40.00),
(9, '2024-12-09', 60.00),
(10, '2024-12-10', 45.00);

-- Insert Order Details
INSERT INTO OrderDetails (OrderID, GroceryID, Quantity) VALUES
(1, 1, 3),
(1, 7, 2),
(2, 2, 10),
(2, 8, 1),
(3, 4, 5),
(4, 5, 4),
(5, 6, 2),
(6, 3, 8),
(7, 9, 12),
(8, 10, 7);


-- 1: List all orders with customer names and total amounts.

-- 2: Show the details of each order, including grocery names and quantities.

-- 3: Find the total quantity of each grocery sold.

-- 4: List groceries that have not been sold

-- 5: Retrieve orders that include 'Milk'.

-- 6: Identify customers who placed their last order within the past week.