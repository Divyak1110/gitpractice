create database temp;
use temp;

create table employee (
   employee_id int not null primary key,
   emp_aadhar char(12),
   emp_pan char(10),
   firstname varchar(50) not null,
   lastname varchar(50) not null,
   gender char(1),
   constraint employees_ck1 unique (emp_aadhar),
   constraint employees_ck2 unique (emp_pan)
);

exec sp_help employee;

insert into employee values(101, '123456789012', 'ABCDE1234Z', 'Arun', 'Sharma', 'M');

select * from employee;

insert into employee values(102, '123456789013', null, 'John', 'Smith', 'M');

insert into employee values(104, null, 'ABCDH1234L', 'Mary', 'Jones', 'F');

update employee
set emp_pan = 'LKJHG1234P'
where employee_id = 102;

drop database retail;

use master