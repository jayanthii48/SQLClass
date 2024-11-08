-- Create a table named "employees"
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Insert some sample data into the "employees" table
INSERT INTO employees (name, salary) VALUES
('John', 50000.00),
('Jane', 55000.00),
('Doe', 60000.00);

-- Declare and assign values to variables using := operator
SET @total_salary := 0;  -- Initialize total_salary variable

-- Calculate the total salary of all employees and assign it to @total_salary
SELECT SUM(salary) INTO @total_salary FROM employees;

-- Display the total salary of all employees
SELECT @total_salary AS total_salary;

-- Assign a new value to @total_salary using the := operator
SET @total_salary := @total_salary * 1.05;  -- Adding 5% increase to the total salary

-- Display the updated total salary after the 5% increase
SELECT @total_salary AS updated_total_salary;

-- Assign a value to a new variable based on a condition
SET @bonus := CASE
                 WHEN @total_salary > 200000 THEN 10000
                 ELSE 5000
              END;

-- Display the assigned bonus
SELECT @bonus AS bonus;


-- Retrieve the updated employee salaries
SELECT name, salary FROM employees;
