create database ABCFASHION;

use ABCFASHION;

--create table salesman, customer, orders
create table salesman
(salesmanId int ,
SalesmanName varchar(30),
commission decimal,
city varchar(25) ,
age smallint );

create table customer
(salesmanid int ,
CustomerId BIGINT ,
customername varchar(25),
purchaseamount decimal );

create table orders
(orderid BIGINT,
CustomerId BIGINT,
salesmanId int,
orderdate date ,
amount decimal);

-- Insert data into salesman
insert into salesman values
(101, 'joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

Insert into salesman (salesmanId) values (107),(110);

--Enter Data into customer Table
Insert into customer values
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew',4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);

-- Enter values to orders








