create database USERSS
use USERSS
-- Create a table named "users"
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Insert sample data into the "users" table
INSERT INTO users (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.com'),
('Charlie', 'Davis', 'charlie.davis@example.com');

-- 1. CONCAT operator - Concatenate first name and last name
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users;

-- 2. CONCAT_WS operator - Concatenate first name and last name with a separator (comma)
SELECT CONCAT_WS(', ', first_name, last_name) AS full_name FROM users;

-- 3. LIKE operator - Find users whose first name starts with 'J'
SELECT * FROM users WHERE first_name LIKE 'J%';

-- 4. REGEXP operator - Find users whose email contains 'example'
SELECT * FROM users WHERE email REGEXP 'Example';


