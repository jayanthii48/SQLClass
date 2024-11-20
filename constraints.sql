use emp
drop table Products
CREATE TABLE Products (
    product_id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);
-- Valid Insert
INSERT INTO Products (product_id, product_name, price) VALUES (1, 'Laptop', 799.99);
SET sql_mode = 'STRICT_TRANS_TABLES';

-- Invalid Insert: Missing NOT NULL field 'price'
INSERT INTO Products (product_id, product_name) VALUES (2, 'Tablet'); -- Error!

SELECT * FROM Products
-- Valid Update
UPDATE Products SET price = 899.99 WHERE product_id = 1;


-- Invalid Update: Setting a NOT NULL column to NULL
UPDATE Products SET price = NULL WHERE product_id = 1; -- Error!

SELECT * FROM Products WHERE price IS NULL;


--  Drop the table if it already exists
DROP TABLE IF EXISTS Products;

--  Create the table with DEFAULT constraints
CREATE TABLE Products (
    product_id INT NOT NULL PRIMARY KEY,              -- Primary key column
    product_name VARCHAR(100) NOT NULL,              -- Product name, cannot be NULL
    price DECIMAL(10, 2) DEFAULT 100.00,             -- Default price is 100.00
    stock INT DEFAULT 10,                            -- Default stock quantity is 10
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP    -- Default current timestamp for record creation
);

--  Insert values into the table
-- Insert a row with explicit values for all columns
INSERT INTO Products (product_id, product_name, price, stock, created_at)
VALUES (1, 'Smartphone', 499.99, 50, '2024-11-20 10:00:00');

-- Insert a row without specifying price and stock; DEFAULT values will be used
INSERT INTO Products (product_id, product_name)
VALUES (2, 'Tablet');

-- Insert a row without specifying stock; DEFAULT value will be used
INSERT INTO Products (product_id, product_name, price)
VALUES (3, 'Laptop', 899.99);

-- Insert a row without specifying created_at; DEFAULT CURRENT_TIMESTAMP will be used
INSERT INTO Products (product_id, product_name, price, stock)
VALUES (4, 'Smartwatch', 199.99, 25);

--  Query the table to see the results
SELECT * FROM Products;


CREATE TABLE Products (
    product_id INT NOT NULL PRIMARY KEY,               -- Product ID must be provided
    product_name VARCHAR(100) NOT NULL,               -- Product Name cannot be NULL
    price DECIMAL(10, 2) NOT NULL DEFAULT 100.00,     -- Default price is 100.00, cannot be NULL
    stock INT NOT NULL DEFAULT 10,                    -- Default stock quantity is 10, cannot be NULL
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP -- Default current timestamp, cannot be NULL
);

--  Drop the table if it already exists
DROP TABLE IF EXISTS Users;

--  Create the table with UNIQUE constraints
CREATE TABLE Users (
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Primary Key for the table
    email VARCHAR(100) NOT NULL UNIQUE,              -- Each email must be unique
    username VARCHAR(50) UNIQUE,                     -- Each username must be unique
    phone_number VARCHAR(15),                        -- Phone numbers are optional
    UNIQUE (email, phone_number)                     -- Composite unique constraint
);

-- Insert valid data into the table
-- These rows will be inserted successfully
INSERT INTO Users (email, username, phone_number)
VALUES ('john.doe@example.com', 'johndoe', '1234567890');

INSERT INTO Users (email, username, phone_number)
VALUES ('jane.doe@example.com', 'janedoe', '9876543210');

-- Insert duplicate values to test the UNIQUE constraints

-- This will cause an error because the email 'john.doe@example.com' already exists
INSERT INTO Users (email, username, phone_number)
VALUES ('john.doe@example.com', 'johnny', '1112223333');

-- This will cause an error because the username 'johndoe' is already used
INSERT INTO Users (email, username, phone_number)
VALUES ('mark.smith@example.com', 'johndoe', '4445556666');

-- This will cause an error because the composite (email, phone_number) must be unique
INSERT INTO Users (email, username, phone_number)
VALUES ('jane.doe@example.com', 'janesmith', '9876543210');

-- Query the table to verify the results
-- Only the valid rows will be inserted
SELECT * FROM Users;


