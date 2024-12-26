USE GP
--  Create the Black Day Sales table
CREATE TABLE black_day_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    sale_date DATE NOT NULL
);

--  Insert 10 rows of sample data
INSERT INTO black_day_sales (product_name, category, sale_price, discount_percentage, sale_date)
VALUES
('Smartphone X', 'Electronics', 599.99, 20.00, '2024-11-23'),
('Laptop Pro', 'Electronics', 999.99, 15.00, '2024-11-23'),
('Wireless Earbuds', 'Accessories', 49.99, 25.00, '2024-11-23'),
('4K TV', 'Electronics', 1299.99, 30.00, '2024-11-23'),
('Gaming Console', 'Gaming', 399.99, 10.00, '2024-11-23'),
('Sports Shoes', 'Footwear', 79.99, 50.00, '2024-11-23'),
('Leather Jacket', 'Apparel', 199.99, 35.00, '2024-11-23'),
('Smartwatch Z', 'Accessories', 199.99, 40.00, '2024-11-23'),
('Office Chair', 'Furniture', 149.99, 20.00, '2024-11-23'),
('Cookware Set', 'Home & Kitchen', 99.99, 15.00, '2024-11-23');

--  Create a view for sales with high discounts
CREATE VIEW high_discount_sales AS
SELECT sale_id, product_name, category, sale_price, discount_percentage
FROM black_day_sales
WHERE discount_percentage >= 20.00;


--  Query the view for high discounts
SELECT * FROM high_discount_sales;
--  Create a view with the WITH CHECK OPTION to ensure only discounted items are inserted/updated
CREATE VIEW discounted_sales AS
SELECT sale_id, product_name, category, sale_price, discount_percentage, sale_date
FROM black_day_sales
WHERE discount_percentage > 0.00
WITH CHECK OPTION;

SELECT * FROM discounted_sales

--  Attempt to insert a record through the view with a discount of 0% (will fail)
INSERT INTO discounted_sales (product_name, category, sale_price, discount_percentage, sale_date)
VALUES ('No Discount Item', 'Miscellaneous', 20.00, 0.00, '2024-11-23');

--  Attempt to insert a valid record through the view
INSERT INTO discounted_sales (product_name, category, sale_price, discount_percentage, sale_date)
VALUES ('Discounted Product', 'Miscellaneous', 20.00, 5.00, '2024-11-23');


--  Demonstrate modifying a view
CREATE OR REPLACE VIEW high_discount_sales AS
SELECT sale_id, product_name, category, sale_price, discount_percentage
FROM black_day_sales
WHERE discount_percentage >= 25.00;

--  Query the modified view
SELECT * FROM high_discount_sales;

--  Drop the views and the table
DROP VIEW IF EXISTS high_discount_sales;
DROP VIEW IF EXISTS discounted_sales;
DROP TABLE IF EXISTS black_day_sales;


--  Create the Users Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    status ENUM('active', 'inactive', 'pending') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Sample Data into the Users Table
INSERT INTO users (user_name, email, status)
VALUES
('Alice', 'alice@example.com', 'active'),
('Bob', 'bob@example.com', 'inactive'),
('Charlie', 'charlie@example.com', 'active'),
('Diana', 'diana@example.com', 'pending'),
('Eve', 'eve@example.com', 'active'),
('Frank', 'frank@example.com', 'inactive'),
('Grace', 'grace@example.com', 'pending'),
('Hank', 'hank@example.com', 'active'),
('Ivy', 'ivy@example.com', 'active'),
('Jack', 'jack@example.com', 'inactive');

-- Create a View
CREATE VIEW active_users AS
SELECT user_id, user_name, email
FROM users
WHERE status = 'active';

-- Querying the View
SELECT * FROM active_users;

--  Demonstrate Updating the View (if applicable)
-- Attempt to update a row in the base table via the view.
-- This will work only if the view is updatable and doesn't have complex clauses.
UPDATE active_users
SET status = 'inactive'
WHERE user_id = 3;

UPDATE users
SET status = 'inactive'
WHERE user_id = 3;


--  Modifying the View
CREATE OR REPLACE VIEW active_users AS
SELECT user_id, user_name, email
FROM users
WHERE status = 'active' OR status = 'pending';

-- Query the Modified View
SELECT * FROM active_users;

--  Create a View with `WITH CHECK OPTION`
CREATE VIEW strictly_active_users AS
SELECT user_id, user_name, email
FROM users
WHERE status = 'active'
WITH CHECK OPTION;

--  Attempt to Insert Invalid Data Through the View
-- This will fail because the status is not 'active'
INSERT INTO strictly_active_users (user_name, email, status)
VALUES ('Zara', 'zara@example.com', 'inactive');

CREATE OR REPLACE VIEW strictly_active_users AS
SELECT user_id, user_name, email, status
FROM users
WHERE status = 'active'
WITH CHECK OPTION;

--  Insert Valid Data Through the View
INSERT INTO strictly_active_users (user_name, email, status)
VALUES ('Zara', 'zara@example.com', 'active');


--  List All Views in the Database
SHOW FULL TABLES
SHOW FULL TABLES WHERE Table_type = 'VIEW';

--  Delete the View
DROP VIEW IF EXISTS active_users;
DROP VIEW IF EXISTS strictly_active_users;

-- Step 13: Cleanup - Drop the Users Table
DROP TABLE IF EXISTS users;

