use retail;

select * from customer;

update customer
set city = 'London'
where cnum=2001;

--trim
select * from customer where trim(city)= 'London';

--substring
select substring(city,5,2) from customer;

--mr john smith
select concat(upper(substring('mr',1,1)),substring('mr',2,1) , ' ' , 
upper(substring('john',1,1)),substring('john',2,3),
' ' ,upper(substring('smith',1,1)),substring('smith',2,4));

--mrs anna mathews
select concat(upper(substring('mrs',1,1)), (substring('mrs',2,2)), ' ', 
upper(substring('anna',1,1)), (substring('anna',2,3)), ' ', 
upper(substring('mathews',1,1)), (substring('mathews',2,6)));

--Mathematical functions
--abs()
select abs(-500);

--floor and ceiling
select floor(25.45) as 'floor price';
select ceiling(25.45) as 'celing price';

--Square and Sqrt
select square(9);
select sqrt(81);

--pi function
--calc area of the circle with radius 7
select round(square(pi()*7),2);

--power
select power(8,5);

--calculate compund interest
select (10000* (power(1+(0.07/4),8)))-10000;

---add new orders in the orders table
insert into orders values(3050, 2000, '2025-09-20', 2001);
insert into orders values(3051, 3000, '2025-09-22', 2001);
insert into orders values(3052, 4000, '2025-03-22', 2001);

select * from orders
--Date function
select  year(odate) as 'year', month(odate) as 'month', sum(amt) as 'total sales'  
from orders
group by year(odate), month(odate)
order by year(odate);

--find month name analysis
select  year(odate) as 'year', datename(mm,odate) as 'month', sum(amt) as 'total sales'  
from orders
group by year(odate), datename(mm,odate), month(odate)
order by year(odate),month(odate);

-- day  of the week analysis
select  datename(dw,odate) as 'day', sum(amt) as 'total sales'  
from orders
group by datename(dw,odate),datepart(dw,odate)
order by datepart(dw,odate);


--https://learn.microsoft.com/en-us/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver17