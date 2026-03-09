create database customer
use master;
drop database customer

create database PRT
Use PRT

select Last_name, salary from employee e1 where salary > (select Avg(salary) from employee e2 where e1.department_id = e2.department_id)

select e.department_id, e.Last_name, e.salary from employee e  join 
(select department_id,avg(salary) as average_salary from employee group by department_id) d on e.department_id = d.department_id
where e.salary > d.average_salary