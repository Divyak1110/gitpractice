create database loan_prediction;
select * from loan_prediction;
--Q1. Count total number of loan applications
select 
	count(*) as no_of_applications 
from 
	loan_prediction;

--Q2. Count male vs female applicants.
select
	gender,
	count(*) as no_of_applicants
from
	loan_prediction
group by 
	Gender
Having
	Gender in ('Male', 'female');


--Q3. Find average loan amount by education level.
Select
	Education,
	avg(LoanAmount) as average
from
	loan_prediction
Group by 
	Education;

--Q4. Find the top 10 applicants by total income (Applicant + Coapplicant).
Select
	Top 10
	loan_id,
	(ApplicantIncome + CoApplicantIncome) as total_income
from
	loan_prediction
order by
	total_income

--Q5. Find applicants with missing Credit_History.
Select 
	Loan_id
from
	loan_prediction
where
	Credit_History is null;

--Q6. Count applicants by Property_Area.
Select
	property_Area,
	count(*) as no_of_Applicants
from
	loan_prediction
Group by
	Property_Area;

--Q7. Find average ApplicantIncome for married vs unmarried.
Select
	case when married = 0 then 'unmarried'
	Else'married' End as Maritial_status,	
	avg(ApplicantIncome) as average_income
from
	loan_prediction
Group by
	Married;

--Q8. Find the minimum and maximum LoanAmount.
select
	min(LoanAmount) as minimum,
	max(LoanAmount) as maximum
from
	loan_prediction

--Q9. List all applicants whose LoanAmount > 200.
Select
	loan_Id,
	LoanAmount
from
	loan_prediction
where
	LoanAmount > 200;

--Q10. Find the number of applicants with Dependents = '3+'.
Select
	count(*) as number_of_Applicants
from
	loan_prediction
where
	Dependents > 3;

