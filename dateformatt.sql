select * from student
insert into student(name,age,dob,admission) values('Ram',23,'2000-11-12','2024-12-21 23:43:23')
INSERT INTO student (name, age, dob, admission) VALUES 
('Alice', 20, '2004-05-15', '2023-09-01 10:30:00'),
('Bob', 22, '2002-12-01', '2023-09-02 09:15:00'),
('Charlie', 19, '2005-03-25', '2023-09-03 14:45:00'),
('David', 21, '2003-07-10', '2023-09-04 08:00:00'),
('Eva', 23, '2001-08-20', '2023-09-05 12:30:00');
use student
select name, age ,admission ,date_format(dob, "%d/%m/%Y") as dob from student
select date
SELECT 
    name,
    DATE_FORMAT(dob, '%Y') AS year_4_digits,                 -- 2024
    DATE_FORMAT(dob, '%y') AS year_2_digits,                 -- 24
    DATE_FORMAT(dob, '%M') AS full_month_name,               -- August
    DATE_FORMAT(dob, '%m') AS month_2_digits,                -- 08
    DATE_FORMAT(dob, '%D') AS day_with_suffix,               -- 5th
    DATE_FORMAT(dob, '%d') AS day_2_digits,                  -- 05
    DATE_FORMAT(dob, '%e') AS day_no_leading_zero,           -- 5
    DATE_FORMAT(dob, '%W') AS full_weekday_name,             -- Monday
    DATE_FORMAT(admission, '%H') AS hour_24_hour_format,     -- 14
    DATE_FORMAT(admission, '%h') AS hour_12_hour_format,     -- 02
    DATE_FORMAT(admission, '%i') AS minutes_2_digits,        -- 30
    DATE_FORMAT(admission, '%s') AS seconds_2_digits,        -- 45
    DATE_FORMAT(admission, '%p') AS am_pm                    -- PM
FROM 
    student;
