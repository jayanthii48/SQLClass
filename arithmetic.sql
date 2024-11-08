
-- Table: sales (Total Sales)
CREATE TABLE sales (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT
);

INSERT INTO sales (product_id, product_name, price, quantity) VALUES
(1, 'Product A', 100, 5),
(2, 'Product B', 150, 3),
(3, 'Product C', 200, 2);

-- Table: employees (Average Salary)
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, name, salary) VALUES
(1, 'Alice', 5000),
(2, 'Bob', 6000),
(3, 'Charlie', 5500),
(4, 'David', 7000);

-- Table: orders (Calculate Tax)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_name, amount) VALUES
(1, 'John', 1000),
(2, 'Jane', 1500),
(3, 'Jim', 1200);

-- Table: products (Profit Margin Calculation)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    cost_price DECIMAL(10, 2),
    selling_price DECIMAL(10, 2)
);

INSERT INTO products (product_id, product_name, cost_price, selling_price) VALUES
(1, 'Product A', 50, 100),
(2, 'Product B', 80, 150),
(3, 'Product C', 120, 200);

SELECT 
    product_name,
    price * quantity AS total_sales
FROM sales;

SELECT 
    product_name,
    price,
    price - (price * 0.20) AS discounted_price
FROM products;


-- SELECT 
--     product_name,
--     cost_price,
--     selling_price,
--     ((selling_price - cost_price) / cost_price) * 100 AS profit_margin
-- FROM products;

SELECT 
    product_name,
    price,
    price + (price * 0.10) AS new_price
FROM products;