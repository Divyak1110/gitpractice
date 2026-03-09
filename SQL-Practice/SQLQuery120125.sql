use retail;

select * from customer;
select * from salespeople;
select * from orders;

--Inner join- [Matching the same values in both the tables
select salespeople.snum,sname, count(cnum) as customercount
from customer join salespeople 
on customer.snum= salespeople.snum
group by salespeople.snum,sname;

--right outer join[ will get complete data from right hand table with or without matching]
select salespeople.snum,sname, count(cnum) as customercount
from customer right outer join salespeople 
on customer.snum= salespeople.snum
group by salespeople.snum,sname
order by customercount

--add city
select salespeople.snum,sname, salespeople.city , count(cnum) as customercount
from customer right outer join salespeople 
on customer.snum= salespeople.snum
group by salespeople.snum,sname,salespeople.city
order by customercount desc;

--left outer joint

select salespeople.snum,sname, count(cnum) as customercount
from customer left outer join salespeople 
on customer.snum= salespeople.snum
group by salespeople.snum,sname
order by customercount desc;

--full join
select * from customer full join salespeople 
on customer.snum= salespeople.snum

--view orders table

select * from orders;

-- Total Orders value
select sum(amt) as totalvalue from orders;

-- To find Max value
select max(amt) as totalvalue from orders;

--To find Min. value
select min(amt) as totalvalue from orders;

--find total orders amount for each cnum
select  cnum, sum(amt) from orders
group by cnum

-- get customer name as well
select customer.cnum,cname, sum(amt) as total
from orders join customer
on orders.cnum = customer.cnum
group by customer.cnum,cname

--Use aliases 
select * from orders o join customer c
on
o.cnum = c.cnum;

--print customer wise sales total and count of orders, print cname as well
select c.cnum,cname,sum(amt) as 'total sales', count(onum) as 'Total orders'
from orders o join customer c
on
o.cnum = c.cnum
group by c.cnum,cname;

--Join three tables
select * from orders o join customer c
on
o.cnum = c.cnum
join salespeople s
on
s.snum = c.snum;

--sum of commission
select s.snum,sname,round(sum(amt*comm),2) as 'Total comm'
from orders o join customer c
on
o.cnum = c.cnum
join salespeople s
on
s.snum = c.snum
group by s.snum,s.sname;

--change the data type using convert function
select s.snum,sname,convert(decimal(10,2), round(sum(amt*comm),2)) as 'Total comm'
from orders o join customer c
on
o.cnum = c.cnum
join salespeople s
on
s.snum = c.snum
group by s.snum,s.sname;

--include fran
select s.snum,sname,coalesce(convert(decimal(10,2), round(sum(amt*comm),2)),0) as 'Total comm'
from orders o join customer c
on
o.cnum = c.cnum
right join salespeople s
on
s.snum = c.snum
group by s.snum,s.sname;

--sort the comm colum in desc
select s.snum,sname,coalesce(convert(decimal(10,2), round(sum(amt*comm),2)),0) as 'Total comm'
from orders o join customer c
on
o.cnum = c.cnum
right join salespeople s
on
s.snum = c.snum
group by s.snum,s.sname
order by [Total comm] desc;

drop view orders_customers_sp

--virtual view creation
create view orders_customers_sp
as
select onum, amt, odate, o.cnum, cname, c.city as 'customer_city',
rating, s.snum, sname, s.city as 'salesperson_city', comm

from orders o join customer c
on
o.cnum = c.cnum

right join salespeople s
on
s.snum = c.snum;

select * from orders_customers_sp

-- calculate total commission
select snum,sname,
coalesce(convert(decimal(10,2),round(sum(amt*comm),2)),0) as 'total comm'
from orders_customers_sp
group by snum,sname
order by 'total comm' desc;
