--Q1.Find customers whose highest single transaction amount is greater than the average transaction amount of all customers.
with average_Transaction_amount as(
Select
	customerId, 
	max(amount) as total from Transactions group by CustomerID)
select * from average_Transaction_amount where total > (select avg(amount) from Transactions) ;
--2nd approach
select * from (select CustomerId, max(amount) as total from Transactions group by CustomerID) As t where
t. total > (select avg(amount) from Transactions);

--Q2.Return customers who made more than 3 transactions in a single month.
 Select CustomerId,count(SaleId) as number, month(SaleDate) as month from Sales group by CustomerID, month(saledate) having count(saleId) > 3

 --Q3.For each customer, show their total spending, and also show the average spending of all customers (use a window function).
 with totalspent as(
 Select customerId, sum(Amount) as total from Transactions group by CustomerID) select CustomerId, total, Avg(total) over () as average
 from totalspent ;

--Q4.Identify customers who never made a transaction in the last 3 months of the dataset.
with date as (Select max(saleDate) as lastdate from Sales) 
Select 
	customerID 
from 
	sales 
where	
	customerID not in (Select customerId
from sales, date where saledate > dateadd(month,-3,lastdate));

--Q5.Find the top 2 transactions per customer based on Amount.
with Cte as (select customerID, row_number() over(partition by customerId order by amount DESC) as rnk from transactions) 
select * from Cte where rnk <= 2;

--Q6.List customers whose total spending is in the top 20% of all customers (use NTILE).
with Totalspent as (Select CustomerId, sum(Amount) as total from Transactions group by CustomerID) 
select * from (select Customerid, total, ntile(5) over (order by total DESC) as percentile from Totalspent)as x where percentile = 1


--Q7.Find customers who made consecutive transactions (two transactions on back‑to‑back days).
WITH cte AS (
    SELECT
        CustomerID,
        SaleDate,
        LAG(SaleDate) OVER (PARTITION BY CustomerID ORDER BY SaleDate) AS PrevDate
    FROM Sales
)
SELECT DISTINCT CustomerID
FROM cte
WHERE DATEDIFF(day, PrevDate, SaleDate) = 1;


--Q8.For each customer, calculate the difference between their highest and lowest transaction amounts.
with cte1 as (
select customerID,Max(amount) as highest,Min(amount) as Lowest from Transactions group by CustomerID)
Select customerID, (highest- lowest) as diff from cte1  

--Q9.Return customers whose average transaction amount is higher than the overall median transaction amount.


Select customerID, Avg(amount) as average from Transactions group by CustomerID having avg(amount) >
(select Distinct PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Amount) OVER () AS Median from Transactions)

--Q10.Find customers who made their first transaction in the same month as at least one other customer.
 
 WITH first_tx AS (
    SELECT
        CustomerID,
        MIN(SaleDate) AS FirstDate
    FROM Sales
    GROUP BY CustomerID
),
month_groups AS (
    SELECT
        CustomerID,
        YEAR(FirstDate) AS Yr,
        MONTH(FirstDate) AS Mn
    FROM first_tx
)
SELECT CustomerID
FROM month_groups
WHERE (Yr, Mn) IN (
    SELECT Yr, Mn
    FROM month_groups
    GROUP BY Yr, Mn
    HAVING COUNT(*) > 1
);
