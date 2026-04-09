select * from loan_prediction;
--16. Rank applicants by ApplicantIncome (highest first).
Select
	Loan_Id,
	ApplicantIncome,
	row_number() over(order by ApplicantIncome DESC) as Applicants_rank
from
	loan_prediction;

--Q17. Rank applicants within each Property_Area by LoanAmount.
Select
	Loan_ID,
	LoanAmount,
	row_number() over (partition by Property_area order by LoanAmount DESC) as Applicant_rank
from
	loan_prediction;

--Q18. Compute running total of LoanAmount ordered by ApplicantIncome.
Select
	Loan_ID,
	ApplicantIncome,
	LoanAmount,
	Sum(LoanAmount) over (order by ApplicantIncome DESC rows between unbounded preceding and current row) as running_total
from
	loan_prediction;
--Q19. Find the difference between ApplicantIncome and the previous applicant’s income.
Select
	Loan_ID,
	ApplicantIncome-
	LAG(ApplicantIncome) over(order by ApplicantIncome DESC) as difference_in_income
from
	loan_prediction;
--Q20. Find the top 3 loan amounts per education level.
Select 
	Loan_ID,
	LoanAmount,
	education,
	Row_number() over (PARTITION BY Education ORDER BY LoanAmount DESC ) as Applicant_rank
from
	loan_prediction;

