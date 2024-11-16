use userss
show tables
select * from employees
select host,user from mysql.user

create user 'joe'@'localhost' identified by '1234'
show grants 
show grants for 'joe'@'localhost'

GRANT SELECT, INSERT ON employees TO joe;

show grants for 'joe'@'localhost'

GRANT SELECT ON userss.students to 'joe'@'localhost';

GRANT UPDATE (Name, age) ON userss.employees TO 'joe'@'localhost';

select*from employees
GRANT UPDATE ON userss.employees TO 'joe'@'localhost';

GRANT ALL PRIVILEGES ON *.* TO 'joe'@'localhost' ;
GRANT ALL PRIVILEGES ON *.* TO 'joe'@'localhost' with grant option ;
show grants for 'joe'@'localhost';

use example;
select * from employees

REVOKE SELECT ON  FROM ''@'hostname';

REVOKE UPDATE  FROM ''@'hostname';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user_name'@'hostname';
