create database newsalesDB;

use newsalesDB;

create table customer
(custno varchar(10) not null primary key,
firstname varchar(25) not null,
lastname varchar(25) not null,
age int,
profession varchar(50) not null);

select * from txn

Bulk insert customer
from "C:\Users\kotad\Downloads\custs.txt"
with
(
    FIELDTERMINATOR = ',',       
    ROWTERMINATOR = '\n' 
);

select customerno, count(customerno) from txn
group by customerno
having count(customerno) >1;