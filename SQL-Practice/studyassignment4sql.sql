use assignments2;
select * from customer_table;

select e1.first_name, e1.last_name, count (*) from customer_table e1
where e1.first_name = (select e2.first_name from customer_table e2) 
and e1.last_name = (select e2.last_name from customer_table e2);


create table orders
(order_id int primary key,
order_date date,
Amount decimal(10,2),
customer_id int foreign key references customer_table(customer_id);

insert into orders values
(100, '2025-10-05', 500.00, 1),
(101, '2025-10-10', 1500.00, 3),
(102, '2025-10-12', 800.00,3),
(103, '2025-10-13', 400.00,4),
(104, '2025-10-15', 1200.00, 5);

Alter table orders
add constraint fk_orders_customer_id
foreign key (customer_id)
references customer_table(customer_id)

select * from customer_table C inner join orders o
on c.customer_id = o.customer_id;

select * from customer_table C left join orders o
on c.customer_id = o.customer_id;

select * from customer_table C right join orders o
on c.customer_id = o.customer_id;

select * from customer_table C full outer join orders o
on c.customer_id = o.customer_id;

update orders
set amount = 100
where customer_id = 3;

select * from orders;

select customer_id,min(amount) minimum, max(amount) maximum, Avg(amount) average from orders;

create function Fn_multiplication_10(@number int)
returns int
As
Begin
     return @number *10
End;

select dbo.fn_multiplication_10(50) answer;

/* 3. Use the case statement to check if 100 is less than 200, 
greater than200 ,or equal to 200 and print the corresponding value.*/

SELECT 
    CASE 
        WHEN 100 < 200 THEN '100 is less than 200'
        WHEN 100 > 200 THEN '100 is greater than 200'
        WHEN 100 = 200 THEN '100 is equal to 200'
        ELSE 'No match' 
    END AS Result;

/* 4. Using a case statement, find the status of the amount. Set the statusof the
amount as high amount, low amount or medium amount based uponthe condition. */

declare @num int = 200;
select amount,
    case 
       when amount > 1000 then 'high amount'
       when amount > 500 then 'medium amount'
       Else 'low amount'
    End as amount_status
from orders;

--5. Create a user-defined function, to fetch the amount greater thanthengiven input.
create function udf_high_amount(@order_value dec(10,2))
returns table
As
Return
(select Amount from orders where amount > @order_value);


select * from dbo.udf_high_amount(100.00);
