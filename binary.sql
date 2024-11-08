-- Create a table named "users"
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    access_level INT
);

-- Insert sample data into the "users" table
INSERT INTO users (username, access_level) VALUES
('Alice', 7),        -- Binary: 111 (Read, Write, Execute)
('Bob', 5),          -- Binary: 101 (Read, Write)
('Charlie', 3),      -- Binary: 011 (Read, Execute)
('David', 2),        -- Binary: 010 (Write)
('Eve', 1);          -- Binary: 001 (Read)

-- 1. Bitwise AND (&) - Find users who have both read and write access (binary 111 & 101)
SELECT * FROM users WHERE access_level & 5 = 5;

-- 2. Bitwise OR (|) - Find users who have either write or execute access (binary 101 | 011)
SELECT * FROM users WHERE access_level | 3 = access_level;

-- 3. Bitwise XOR (^) - Find users who have access levels that are different between 7 and 5 (binary 111 ^ 101)
SELECT * FROM users WHERE access_level ^ 5 = 2;

-- 4. Bitwise NOT (~) - Find users whose access level is the inverse of 7 (binary NOT 111)
SELECT * FROM users WHERE access_level = ~7;

-- 5. Left shift (<<) - Find users whose access level is shifted left by 1 bit (binary 111 << 1)
SELECT * FROM users WHERE access_level << 1 = 14;

-- 6. Right shift (>>) - Find users whose access level is shifted right by 1 bit (binary 111 >> 1)
SELECT * FROM users WHERE access_level >> 1 = 3;
