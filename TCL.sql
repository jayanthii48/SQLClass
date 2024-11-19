-- Drop tables if they already exist
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS transactions;

-- Create the `accounts` table
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(10, 2)
);

-- Insert sample data into `accounts`
INSERT INTO accounts (name, balance) VALUES
('Alice', 1000.00),
('Bob', 500.00),
('Charlie', 300.00);

-- Create the `transactions` table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Insert sample data into `transactions`
INSERT INTO transactions (account_id, amount) VALUES
(1, -200.00),
(2, 100.00);

-- Example 1: Using COMMIT and ROLLBACK
-- Start a new transaction
START TRANSACTION;

-- Deduct money from Alice's account
UPDATE accounts SET balance = balance - 200 WHERE account_id = 1;
SELECT *  FROM accounts 
-- Add money to Bob's account
UPDATE accounts SET balance = balance + 200 WHERE account_id = 2;

-- Commit the transaction
COMMIT;

-- Start another transaction
START TRANSACTION;

-- Deduct money from Alice's account
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
SELECT *  FROM accounts 
-- Simulate an error (insufficient funds)
-- Rollback this transaction
ROLLBACK;

-- Example 2: Using SAVEPOINT and ROLLBACK TO SAVEPOINT
-- Start a new transaction
START TRANSACTION;

-- Step 1: Deduct money from Alice's account
UPDATE accounts SET balance = balance - 150 WHERE account_id = 1;

-- Create a savepoint
SAVEPOINT after_deduction;
SELECT *  FROM accounts 
-- Step 2: Add money to Charlie's account
UPDATE accounts SET balance = balance + 150 WHERE account_id = 3;

-- Simulate an error in Step 2 and roll back to the savepoint
ROLLBACK TO SAVEPOINT after_deduction;
SELECT *  FROM accounts 
-- Commit the transaction
COMMIT;

-- Example 3: Using SET AUTOCOMMIT
-- Disable autocommit
SET AUTOCOMMIT = 0;

-- Start a new transaction (autocommit is off)
UPDATE accounts SET balance = balance - 100 WHERE account_id = 2;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 3;
rollback
SELECT *  FROM accounts 
-- Commit the transaction explicitly
COMMIT;

-- Re-enable autocommit
SET AUTOCOMMIT = 1;

