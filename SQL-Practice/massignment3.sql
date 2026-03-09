create database assignment3;
Use assignments2;

insert into customer_table values
(6,'John','Lewis','John@hotmail.com','45 east lane', 'San Jose', 'CA',96514)

select * from orders
order by Amount DESC;

create table employee_details1(
Emp_id int, 
Emp_name varchar(50),
Emp_salary decimal(10,2));

create table employee_details2(
Emp_id int, 
Emp_name varchar(50),
Emp_salary decimal(10,2))

INSERT INTO Employee_details1 (Emp_id, Emp_name, Emp_salary)
VALUES
(1, 'John', 50000),
(2, 'Mary', 60000),
(3, 'Alex', 55000);
INSERT INTO Employee_details2 (Emp_id, Emp_name, Emp_salary)
VALUES
(2, 'Mary', 60000),
(3, 'Alex', 55000),
(4, 'David', 65000);

Select * from employee_details1
Union
select * from employee_details2

Select * from employee_details1
Intersect
select * from employee_details2

Select * from employee_details1
Except
select * from employee_details2

create view customer_san_jose 
As
select * 
from customer_table 
where city = 'San Jose';

select * from customer_san_jose
--2. Inside a transaction, update the first name of the customer to Francis where the last name is Jordan:

Begin Transaction;

update customer_table
set first_name = ' Francis', last_name = ' Jordon'
where customer_id = 6;
-- a.Rollback
Rollback;
--b. Set the first name of customer to Alex, where the last nameis Jordan
update customer_table
set first_name = ' Alex'
where last_name = ' Jordon';

BEGIN TRY
    SELECT 100 / 0; 
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;


select * from orders

Begin transaction;

insert into orders values (105, '2025-11-10', 250.00, 4)

commit