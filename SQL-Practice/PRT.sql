/*1) Cheating Analysis:
- Count how many students cheated and how many did not.*/

SELECT 
    cheated, 
    COUNT(student_name) student_count
FROM 
    student_cheating_dataset
GROUP BY 
    cheated;

/*2) Penalty Distribution:
- Retrieve the average, minimum, and maximum penalty points given to students.*/
Select 
    avg(Penalty_points) Average,
    min(Penalty_points) minimum,
    max(penalty_points) maximum
from 
    student_cheating_dataset;

/*3) Behavior and Cheating:
- Find the most common behavior among students who were caught cheating*/
SELECT TOP 1 
    student_behavior, 
    COUNT(*) AS frequency
FROM 
    student_cheating_dataset
WHERE 
    cheated = 1
GROUP BY 
    student_behavior
ORDER BY 
    frequency DESC;

/*4) Proctor Impact:
- Count how many students cheated in exams with a proctor present vs. without a proctor.*/
SELECT 
    COUNT(student_name) student_count, 'No_proctor_cheated' category
FROM 
    student_cheating_dataset
where
    proctor_present = 0 and cheated = 1
Union all
SELECT 
    COUNT(student_name) student_count, 'proctor_cheated' category
FROM 
    student_cheating_dataset
where
    proctor_present = 1 and cheated = 1;

/* 5) Subject-Wise Cheating Rates:
- Calculate the percentage of students who cheated in each subject. */

SELECT
    subject,
    cast(Round(COUNT(CASE WHEN cheated = 1 THEN 1 END) * 100.0 
        / COUNT(*) ,2)as  Decimal(5,2))cheating_percentage
FROM student_cheating_dataset
GROUP BY subject;
select * from student_cheating_dataset

