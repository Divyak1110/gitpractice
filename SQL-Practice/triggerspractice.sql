create database sales;
use sales;

--create the tables required
create table customer
(cust_id int not null primary key,
cust_name varchar(25) not null,
cust_addr varchar(100) not null,
cust_pincode int not null,
cust_contact varchar(20) not null);

create table product_master
(prod_id varchar(25)  primary key,
prod_name varchar(15) not null,
qty_in_stock int not null ,
re_order_level int not null );

create table purchases
(purchase_id int not null primary key,
purchase_date date not null,
Vendor_name varchar(25) not null,
product_id varchar(25) foreign key references product_master(prod_id),
qty_purchased int,
unit_price decimal(15,2));


create table orders
(order_num int identity primary key,
order_date date,
cust_id int  foreign key references customer(cust_id),
amount decimal(15,2));

create table orders_details
(order_details_id varchar(20) primary key,
order_num int foreign key references orders(order_num),
product_id varchar(25) foreign key references product_master(prod_id),
quantity_sold int ,
unit_price decimal(15,2) );

--Alter order_details
Alter table orders_details
alter column order_num int


Go;


--create insert trigger
CREATE TRIGGER change_quantity on orders_details
After insert
As 
Begin
	 set nocount on;
	 declare @Product_sold int;
	 declare @prod_id varchar(25);

	 select @Product_sold=quantity_sold,@prod_id=product_id from inserted;
	 
	 update product_master
	 set qty_in_stock = qty_in_stock - @Product_sold
	 where product_master.prod_id = @prod_id;
END;

--Create trigger update
CREATE TRIGGER change_quantity_2 on orders_details
After update
As 
Begin
	 set nocount on;
	 declare @Product_sold int;
	 declare @prod_id varchar(25);
	 declare @oldproduct_sold int;
	 declare @oldprod_id varchar(25);

	 select @oldProduct_sold=quantity_sold,@oldprod_id=product_id from deleted;
	 
	 update product_master
	 set qty_in_stock = qty_in_stock + @oldProduct_sold
	 where product_master.prod_id = @oldprod_id;

	 select @Product_sold=quantity_sold,@prod_id=product_id from inserted;

	 update product_master
	 set qty_in_stock= qty_in_stock - @Product_sold
	 where product_master.prod_id = @prod_id;
	 End;

--create trigger for deleted statement

CREATE TRIGGER change_quantity_3 on orders_details
After delete
As 
Begin
	 set nocount on;
	 declare @oldProduct_sold int;
	 declare @oldprod_id varchar(25);

	 select @oldProduct_sold=quantity_sold,@oldprod_id=product_id from deleted;
	 
	 update product_master
	 set qty_in_stock = qty_in_stock + @oldProduct_sold
	 where product_master.prod_id = @oldprod_id;
END;

--Trigger statement to updated product_master table for products purchased
CREATE TRIGGER change_quantity_4 on purchases
After insert
As 
Begin
	 set nocount on;
	 declare @quantity_purchased int;
	 declare @prod_id varchar(25);

	 select @quantity_purchased=qty_purchased,@prod_id=product_id from inserted;
	 
	 update product_master
	 set qty_in_stock = qty_in_stock + @quantity_purchased
	 where product_master.prod_id = @prod_id;
END;

--Create trigger update
CREATE TRIGGER change_quantity_5 on purchases
After update
As 
Begin
	 set nocount on;
	 declare @quantity_purchased int;
	 declare @prod_id varchar(25);
	 declare @oldquantity_purchased int;
	 declare @oldprod_id varchar(25);

	 select @oldquantity_purchased=qty_purchased,@oldprod_id=product_id from deleted;
	 
	 update product_master
	 set qty_in_stock = qty_in_stock - @oldquantity_purchased
	 where product_master.prod_id = @oldprod_id;

	 select @quantity_purchased=qty_purchased,@prod_id=product_id from inserted;

	 update product_master
	 set qty_in_stock= qty_in_stock + @quantity_purchased
	 where product_master.prod_id = @prod_id;
	 End;

--create trigger for deleted statement

CREATE TRIGGER change_quantity_6 on purchases
After delete
As 
Begin
	 set nocount on;
	 declare @oldquantity_purchased int;
	 declare @oldprod_id varchar(25);

	 select @oldquantity_purchased=qty_purchased,@oldprod_id=product_id from deleted;
	 
	 update product_master
	 set qty_in_stock = qty_in_stock - @oldquantity_purchased
	 where product_master.prod_id = @oldprod_id;
END;

--insert values in customer
insert into customer values
(1, 'John','Bangalore',628110,1234567890),
(2, 'Alan', 'Chennai',123456, 9879654902),
(3, 'John', 'Mumbai', 400001, 5347893460);

select * from customer

--insert values in orders table
insert into orders (order_date,cust_id,amount) 
values ('2025-10-15', 1, 5000);
insert into orders (order_date,cust_id,amount) 
values ('2025-10-15',2,4000), ('2025-10-15', 1,6000);

--update orders
update orders
set cust_id = 3
where order_num = 3;

--delete extra row in orders
delete from product_master
where prod_name = 'A';																			;


--read the tables
select * from orders;
Select * from product_master;
select * from customer;
select * from purchases;
select * from orders_details;

Alter table product_master
alter column prod_id int ;

insert into product_master
values ('P1','A',0,0), ('P2','B',0,0);

insert into orders_details  values
('1001',1,'P1', 100, 20.00);
insert into orders_details  values
('1002',2,'P2',30,100.00);

delete from purchases
where purchase_id = 2


insert into purchases values
(1,'2025-10-01', 'ABC& Co.', 'P1',200, 12.00);
insert into purchases values
(2, '2025-10-5', 'Patel brothers', 'P1',200,11.00);
insert into purchases values
(3, '2025-10-6', 'K&k', 'P2',500,11.00);


drop table product_master