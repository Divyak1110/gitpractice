--Step 2 — Intermediate Questions (JOIN?free but powerful)
select * from loan_prediction;
--Q11. Compute total income and categorize applicants into income bands (Low/Medium/High).
with total_income_Applicant as
(select
	(ApplicantIncome + CoApplicantIncome) as total_income
from
	loan_prediction)
Select
	total_income,
	Case when total_income < 10000 Then 'Low_income'
	when total_income between 10000 and 40000 then 'Medium_income'
	Else 'High Income' End as income_bands
from
	total_income_Applicant
order by
	total_income;

--Q12. Find average loan amount for each income band.
with total_income_Applicant as
(select
	(ApplicantIncome + CoApplicantIncome) as total_income,
	loanAmount
from
	loan_prediction),
income_group as (Select
	total_income,
	Case when total_income < 10000 Then 'Low_income'
	when total_income between 10000 and 40000 then 'Medium_income'
	Else 'High Income' End as income_bands,
	loanAmount
from
	total_income_Applicant)
Select
	income_bands,
	Avg(loanAmount) as average
from 
	income_group
Group by
	income_bands;

--Q13. Find the percentage of applicants with Credit_History = 1.
SELECT 
    Cast (COUNT(*) * 100 / (SELECT COUNT(*) FROM loan_prediction) as decimal(10,2)) as C_percentage
FROM loan_prediction
WHERE Credit_History = 1;


--Q14. Find the most common loan term.
Select Top 1 
	count(*) as number_of_applications,
	Loan_Amount_term
from
	loan_prediction
Group by
	Loan_Amount_Term
Order by
	number_of_applications DESC;

--Q15. Find the top 5 highest loan amounts in Rural areas.
Select Top 5
	Loan_ID
	LoanAmount
from
	loan_prediction
where
	Property_Area = 'Rural'
Order by
	LoanAmount DESC;


