--Q1 Return all records from a table of employees where the employee has never completed any training sessions recorded in another table.
Select *
From
   Employees E
where not exists (
		select 1 from TrainingSessions T where t.Empid = E.EmpID);

--Q2 From a table of transactions, find all customers whose total spending is higher than the average spending of all customers.
WITH CustomerTotals AS (
    SELECT CustomerID, SUM(Amount) AS Total
    FROM Transactions
    GROUP BY CustomerID
)
SELECT * 
FROM CustomerTotals
WHERE Total > (SELECT AVG(Total) FROM CustomerTotals);
--sub query approach
 SELECT 
    x.CustomerID, 
    x.Total
FROM (
    -- Subquery 1: Creates the table of totals
    SELECT CustomerID, SUM(Amount) AS Total
    FROM Transactions
    GROUP BY CustomerID
) x
WHERE x.Total > (
    -- Subquery 2: Reruns the calculation to find the average of totals
    SELECT AVG(sub.Total)
    FROM (
        SELECT SUM(Amount) AS Total 
        FROM Transactions 
        GROUP BY CustomerID
    ) AS sub
);


--Q3 From a table of orders, list all products that appear more than once for the same customer.
Select 
	x.productID
From
	(Select productId,customerId,Count(productId)  no from Orders group by CustomerID,ProductID having count(productId) >1 ) x;


--Q4 For each employee in a table, assign a number that represents their position when ordered by their joining date within their department.
Select EmpName,Department,DENSE_RANK() over (partition by department order by JoinDate) as position from Employees

--Q5 For each sale made by a customer, display the previous sale amount made by the same customer.
Select *, LAG(SaleAmount) over(order by SaleId) as Previous_sale from Sales;
--Q6 From a table of monthly revenue, calculate the change in revenue compared to the previous month.
Select *,
LAG(Revenue) over(ORDER BY CHARINDEX(MonthName, 'JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC'))
 , Revenue- LAG(Revenue) over(ORDER BY CHARINDEX(MonthName, 'JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC') ) change_in_revenue 
 from MonthlyRevenue;

--Q7 Write two different SQL queries that return all users whose email exists in another table of verified emails.
Select * from users u where exists (select 1 from VerifiedEmails VE where VE.Email = u.Email);

Select * from users where Email in (select Email from VerifiedEmails);

--Q8 Identify all users who share the same phone number in a user table.
Select Username from users u1 where phone in (select phone from users u2 where u2.username != u1.UserName);

Select Username from users u1 where exists (select 1 from users u2 where u2.username != u1.UserName and u1.phone = u2.phone);