SELECT column1, column2, ...
FROM table1
FULL OUTER JOIN table2
ON table1.common_column = table2.common_column;


SELECT column1, column2, ...
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column
UNION
SELECT column1, column2, ...
FROM table1
RIGHT JOIN table2
ON table1.common_column = table2.common_column;
use gp

CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(50),
    location_id INT
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(50)
);

INSERT INTO agents (agent_id, agent_name, location_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', NULL);

INSERT INTO locations (location_id, location_name) VALUES
(101, 'New York'),
(103, 'Los Angeles'),
(104, 'Chicago');

SELECT a.agent_id, a.agent_name, l.location_name
FROM agents a
LEFT JOIN locations l
ON a.location_id = l.location_id
UNION
SELECT a.agent_id, a.agent_name, l.location_name
FROM agents a
RIGHT JOIN locations l
ON a.location_id = l.location_id;
