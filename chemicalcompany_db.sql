-- Create Database
Use chemical_company;

CREATE TABLE employeeinfo(
EmpID INT PRIMARY KEY,
Name VARCHAR(50),
Age INT,
EmailId VARCHAR(100) UNIQUE,
PhoneNo VARCHAR(15) UNIQUE,
Salary DECIMAL(10,2)); 

DROP TABLE employeeinfo;

INSERT INTO employeeinfo( EmpID, Name, Age, EmailId, PhoneNo, Salary)
VALUES
(1, 'Amit Sharma', 28, 'amit.sharma@example.com', '+91-9876543210', 55000.00),
(2, 'Priya Singh', 32, 'priya.singh@example.com', '+91-9123456780', 62000.50),
(3, 'Rahul Mehta', 26, 'rahul.mehta@example.com', '+91-9988776655', 48000.00),
(4, 'Sneha Kapoor', 30, 'sneha.kapoor@example.com', '+91-9765432109', 70000.75),
(5, 'Vikram Joshi', 35, 'vikram.joshi@example.com', '+91-9345678901', 80000.00);
INSERT INTO employeeinfo( EmpID, Name, Age, EmailId, PhoneNo, Salary)
VALUES
(1, 'Amit Sharma', 28, 'amit.sharma@example.com', '+91-9876543210', 55000.00);

SET @EmpID = 6;
SET @Name = 'Rohit Kumar';
SET @Age = 29;
SET @EmailId = 'rohit@gmail.com';
SET @PhoneNo = '9876543210';
SET @Salary = 55000;

INSERT INTO employeeinfo (EmpID, Name, Age, EmailId, PhoneNo, Salary)
VALUES (@EmpID, @Name, @Age, @EmailId, @PhoneNo, @Salary);

INSERT INTO employeeinfo (EmpID, Name, Age, EmailId, PhoneNo, Salary)
SELECT 7, 'Aman Singh', 27, 'aman@gmail.com', '9999999999', 60000;

CREATE TABLE employee_backup AS
SELECT * FROM employeeinfo;
SELECT * FROM employee_backup;

-- add column
ALTER TABLE employeeinfo
ADD Department VARCHAR(50);
desc employeeinfo;
-- modify column
ALTER TABLE employeeinfo
MODIFY Salary DECIMAL(12,2);
-- drop column
ALTER TABLE employeeinfo
DROP COLUMN Department;

-- update column
update employeeinfo
set Salary = 60000
where EmpID = 1;

-- delete row
delete from employeeinfo
where EmpID = 1;

-- commit
start transaction;
update employeeinfo
set salary = 70000
where EmpID = 1;
commit;

-- rollback
start transaction;
update employeeinfo
set Salary = 80000
where EmpID = 1;
rollback;

-- where clause
SELECT * FROM employeeinfo
where age = 50;

-- comparison operator
SELECT * FROM employeeinfo WHERE Age = 25;
SELECT * FROM employeeinfo WHERE Salary > 50000;
SELECT * FROM employeeinfo WHERE Age < 30;
SELECT * FROM employeeinfo WHERE Salary >= 60000;
SELECT * FROM employeeinfo WHERE Age <= 28;
SELECT * FROM employeeinfo WHERE Age != 25;

-- logical 
SELECT * FROM employeeinfo WHERE Age > 20 OR Salary > 30000;
SELECT * FROM employeeinfo WHERE Age > 20 AND Salary > 30000;
SELECT * FROM employeeinfo WHERE NOT Age = 25;

-- like
SELECT * FROM employeeinfo WHERE Name like 'R%';
SELECT * FROM employeeinfo WHERE Age in (25, 30);
SELECT * FROM employeeinfo WHERE Salary between 50000 and 70000;

-- case manipulation
select lower (name) from employeeinfo;
select upper (name) from employeeinfo;
select concat (ucase(left(name,1)),
lcase(substring(name,2)))
 from employeeinfo;
 
 -- char mani.
 select concat (name, '-', emailid) from employeeinfo;
 select length (name) from employeeinfo;
 select lpad (name, 10, '*') from employeeinfo;
 select rpad (name, 10, '*') from employeeinfo;
 select char(65);
 select ascii (name) from employeeinfo;
select ltrim ('     Hello');
select rtrim('Hello     ');

-- group function
select count(*) from employeeinfo;
select sum(salary) from employeeinfo;
select max(salary) from employeeinfo;
select min(salary) from employeeinfo;
select avg(salary) from employeeinfo;

-- date functions
select sysdate();
select date_add(sysdate(), interval 2 month);
select timestampdiff(month, '2024-01-01', sysdate());
select date_add(sysdate(), interval 1 day);
select last_day(sysdate());

-- ordering
select * from employeeinfo
order by salary desc;

create view emp_view as
select empid, name, salary
from employeeinfo;
select * from emp_view;
drop view emp_view;

-- set operators
select name from employeeinfo union select name from employee_backup;

select name from employeeinfo where  name in ( select name from employee_backup);

select name from employeeinfo where name not in ( select name from employee_backup);

ALTER TABLE employeeinfo ADD DeptID INT;
UPDATE employeeinfo SET DeptID = 1 WHERE EmpID = 1;


-- joins 
SELECT e.EmpID, e.Name, b.Name
FROM employeeinfo e
JOIN employee_backup b
ON e.EmpID = b.EmpID;

-- equi
SELECT e.EmpID, e.Name
FROM employeeinfo e, employee_backup b
WHERE e.EmpID = b.EmpID;

-- cartesian
SELECT *  FROM employeeinfo, employee_backup;

-- outer
SELECT e.EmpID, e.Name, b.Name
FROM employeeinfo e
LEFT JOIN employee_backup b
ON e.EmpID = b.EmpID;

-- self
SELECT a.EmpID, a.Name, b.Name
FROM employeeinfo a, employeeinfo b
WHERE a.EmpID = b.EmpID;


SELECT * FROM employeeinfo;


TRUNCATE TABLE employeeinfo;