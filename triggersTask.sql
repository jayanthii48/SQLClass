--  'products' table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    stock INT,
    price DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--  'sales' table
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    quantity INT,
    total DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- customers' table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    total_spent DECIMAL(10, 2) DEFAULT 0
);


INSERT INTO products (name, stock, price) VALUES
('Laptop', 10, 50000),
('Phone', 20, 30000),
('Tablet', 15, 20000);

-- 5. Insert initial values into 'customers'
INSERT INTO customers (name, total_spent) VALUES
('Alice', 0),
('Bob', 0),
('Charlie', 0);

-- 1) Update product stock after a sale

-- 2) Update customer's total spent after a sale

-- 3 )in product table prices is changed insert Log product price changes
CREATE TABLE product_price_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    old_price DECIMAL(10, 2),
    new_price DECIMAL(10, 2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

