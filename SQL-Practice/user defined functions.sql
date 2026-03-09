create database retail;

use retail;

--scalar functions
create table order_items(
order_id int not null primary key,
prod_id varchar(10),
quantity int,
list_price decimal(10,2),
discount decimal(4,2)
);

insert into order_items values(1, 'P001', 100, 50, 2.5);
insert into order_items values(2, 'P002', 50, 40, 4.0);
insert into order_items values(3, 'P004', 1000, 25, 0);
insert into order_items values(4, 'P001', 200, 50, 2.5);

select * from order_items;

CREATE FUNCTION udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * ((100 - @discount)/100);
END;

After creating the scalar function, you can find it under 
Programmability > Functions > Scalar-valued Functions

use retail;

create table order_items(
order_id int not null primary key,
prod_id varchar(10),
quantity int,
list_price decimal(10,2),
discount decimal(4,2)
);

insert into order_items values(1, 'P001', 100, 50, 2.5);
insert into order_items values(2, 'P002', 50, 40, 4.0);
insert into order_items values(3, 'P004', 1000, 25, 0);
insert into order_items values(4, 'P001', 200, 50, 2.5);

select * from order_items;

CREATE FUNCTION udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * ((100 - @discount)/100);
END;

After creating the scalar function, you can find it under 
Programmability > Functions > Scalar-valued Functions

SELECT *, dbo.udfNetSale(quantity,list_price,discount) as net_sale from order_items;

SELECT dbo.udfNetSale(10,100,5) net_sale;

SELECT 
    order_id, prod_id, quantity, list_price, discount,
    dbo.udfNetSale(quantity, list_price, discount) net_amount
FROM 
    order_items;

    --inland Table value function(ITVF)

CREATE TABLE Student
 (
   Id INT PRIMARY KEY,
   Name VARCHAR(50) NOT NULL,
   Marks INT NOT NULL
);

-- insert  records

INSERT INTO Student 
VALUES (1, 'Tushar', 60), (2, 'Kunal', 80), (3, 'Shivam', 30), 
(4, 'Rushi', 45),(5, 'Mahesh',60),(6, 'Shubham',39),(7, 'Rahul',97);

select * from Student;

create function dbo.GetNameByMarks(@mark int)
Returns Table
as
Return
(
select id, name, marks from student
where marks >= @mark
);

select * from dbo.GetNameByMarks(50);


--create function without parameter

create function dbo.DisplayStudentDetails()
Returns Table
as
Return
(
select id, name, marks from student
);

select * from dbo.DisplayStudentDetails();