-- Step 1: Create Tables
CREATE TABLE booking (
    booking_id INT PRIMARY KEY,
    passenger_name VARCHAR(100),
    bus_id INT,
    seats_booked INT
);

CREATE TABLE bus (
    bus_id INT PRIMARY KEY,
    bus_name VARCHAR(100),
    route VARCHAR(255),
    price_id INT
);

CREATE TABLE price (
    price_id INT PRIMARY KEY,
    fare DECIMAL(10, 2),
    discount DECIMAL(10, 2)
);

-- Step 2: Insert Data into Tables
-- Insert data into price table
INSERT INTO price (price_id, fare, discount) VALUES
(201, 500, 50),
(202, 300, 30),
(203, 400, 40),
(204, 600, 60),
(205, 350, 25);

-- Insert data into bus table
INSERT INTO bus (bus_id, bus_name, route, price_id) VALUES
(101, 'Express 1', 'City A to City B', 201),
(102, 'Express 2', 'City B to City C', 202),
(103, 'Express 3', 'City A to City D', NULL),
(104, 'Express 4', 'City D to City E', 203),
(105, 'Express 5', 'City A to City E', 204),
(106, 'Express 6', 'City B to City F', 205);

-- Insert data into booking table
INSERT INTO booking (booking_id, passenger_name, bus_id, seats_booked) VALUES
(1, 'Alice', 101, 2),
(2, 'Bob', 102, 1),
(3, 'Charlie', 103, 3),
(4, 'David', 104, 4),
(5, 'Eve', 105, 1),
(6, 'Frank', 106, 2),
(7, 'Grace', 101, 1),
(8, 'Hannah', 102, 2),
(9, 'Ivy', 104, 3),
(10, 'Jack', 105, 2);

-- Step 3: Queries

-- 1. List all bookings with bus details

-- 2. Find passengers who booked buses with pricing information

-- 3. Find buses without pricing information

-- 4. Calculate total fare for each booking

-- 5. List all buses, even if they have no bookings

-- 6. Find the total revenue generated by each bus

-- 7. Find passengers who booked more than 2 seats

-- 8. Find buses operating on specific routes

-- 9. List bookings with fare after applying discounts

-- 10. List buses that have never been booked
