create database retail;
use retail;

create table salespeople(
snum int primary key not null,
sname varchar(25) not null,
city varchar(25) not null,
comm decimal(4,2) not null);

insert into salespeople values
(1002, 'Serres','San Jose', 0.13),
(1003, 'AxelRod','New York', 0.10),
(1004, 'Motika',  'London', 0.11),
(1005, 'Fran', 'London', 0.26),
(1007, 'Rifkin', 'Barcelona', 0.15)

select * from salespeople

 --update peel's data
 update salespeople
 set snum= 1010 where snum =1001

 --delete operation
insert into salespeople values (1050, 'John', 'London', 0.15);
select * from salespeople;

delete from salespeople
where snum = 1050;
--*****************************************--

create table customer(
cnum int primary key not null,
cname varchar(25) not null,
city VARCHAR(30) NOT NULL,
rating int not null,
snum int NOT NULL FOREIGN KEY REFERENCES salespeople(snum));

--command to know full info about the table
exec sp_help customer;

INSERT INTO customer VALUES 
(2001, 'Hoffman', 'London',100, 1001),
(2002, 'Giovanni','Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin' ,300 ,1002),
(2006, 'Clemens', 'London', 100, 1001),
(2007, 'Pereira', 'Rome', 100, 1004),
(2008, 'Cisneros', 'San Jose',300 ,1007)

select * from customer
select * from customer where like 

--find total customer count
select  count(cnum) as c_count from customer where city ='london';

--find the count as city wise
select city, rating, count(cnum) as TotalCountOfCity from customer
group by city, rating;

-- having clause
select city, count(snum) from salespeople where comm <= 0.20 group by city;

select city, count(snum) from salespeople where comm <= 0.20 group by city 
having count(snum) = 1;

--order by
select * from customer order by cname asc;

select city, count(snum) from salespeople where comm <= 0.20 group by city 
having count(snum) = 1 order by city desc;


CREATE TABLE orders (
onum INT primary key NOT NULL,
amt DECIMAL(7,2) NOT NULL,
odate Date NOT NULL,
cnum int NOT NULL FOREIGN KEY REFERENCES customer(cnum)
);

INSERT INTO orders VALUES 
(3001, 18.69, '1996-03-10', 2008),
(3002, 1900.10,'1996-03-10', 2007),
(3003, 767.19,'1996-03-10', 2001),
(3005, 5160.45, '1996-03-10', 2003),
(3006, 1098.16, '1996-03-10', 2008),
(3009, 1713.23, '1996-04-10', 2002),
(3007, 75.75, '1996-04-10', 2002),
(3008, 4723.00 ,'1996-05-10', 2006),
(3010, 1309.95, '1996-06-10', 2004),
(3011, 9891.88, '1996-06-10', 2006)

select * from orders

																				

