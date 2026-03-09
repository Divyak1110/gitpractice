create database assignments;
use assignments2;

create table customer_table(
customer_id int primary key,
first_name varchar(25),
last_name varchar(25),
email varchar(30),
address varchar(100),
city varchar(20),
state varchar(20),
zip int);

insert into customer_table values
(1, 'rajesh','Mehta','rajesh@gmail.com','35 east lane','Pune','MH', 600080),
(2, 'Latha','Marium','latha@gmail.com',' D.No 31 vivek nagar','kochi','KL', 512080),
(3, 'John','Luther','Luther@gmail.com','TSK Nagar','Chennai','TN', 400090),
(4, 'Smith','Mehta','smith@gmail.com','415 east Gandhi Road','Mumbai','MH', 600080),
(5, 'rakesh','sobi','rakesh@gmail.com','ramanthapur','Hyderabad','TS', 700896);

select first_name, last_name from customer_table;

select * from customer_table where first_name like 'G%' and city = 'SanJose'

select * from customer_table where email like '%gmail%';

select * from customer_table where last_name not like '%a'; 