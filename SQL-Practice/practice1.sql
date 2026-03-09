use retail;

--create database
create database bank;

--create account table
create table account_table(
A_id varchar(25) primary key not null,
name varchar(30) not null,
address varchar(50) not null,
pincode int not null,
phone_number varchar(30) not null,
a_type varchar(15) not null,
balance int);

--insert values into account table
insert into account_table values
('100-201-356', 'Mark', 'Sanjose',123456,	9876543210,	'Savings',0);

--Delete the record
delete from account_table where A_id=-457

--update account id
update account_table
set A_id = '100-201-356'
where balance= 0

--create transaction table
create table txn_table(
txn_id bigint primary key not null,
txn_date date not null,
account_id varchar(25) not null foreign key references account_table(A_id),
channel varchar(20) not null,
Amount  bigint)

--insert values into transaction_table
insert into txn_table values
(1, '2025-01-01',	'100-201-356', 'cash deposit',5000),
(2,'2025-01-02',	'100-201-356', 'UPI payment',	-5000);

-- delete the rows
delete from txn_table where txn_id in (1,2);


-- view the table
select * from account_table
select * from txn_table;

--detailed view
exec sp_help account_table;