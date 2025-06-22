USE ASSIGNMENT

SELECT*FROM PROGRAM
SELECT*from SCHOLARSHIP
SELECT*from STUDENT

DELETE from scholarship 
WHERE student_ref_id IS null 
and scholarship_amount IS NULL
and scholarship_date IS NULL

--Qs 1. Write a SQL query to fetch "FIRST_NAME" from the Student table in upper case and use ALIAS name as STUDENT_NAME.
--solution
SELECT UPPER(First_Name) as STUDENT_NAME from student

--Qs 2. Write a SQL query to fetch unique values of MAJOR Subjects from Student table.
--solution
SELECT distinct MAJOR from student

--Qs 3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.

SELECT LEFT(FIRST_NAME,3) AS FIRST_3_CHARS FROM STUDENT

--Qs 4. Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length.

SELECT DISTINCT MAJOR,
LEN(MAJOR) AS SubjectLength 
from student 

--Qs 5. Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME.
SELECT First_Name + ' ' + Last_Name as COMPLETE_NAME from student

--Qs 6. Write a SQL query to print details of the Students with the FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
SELECT*FROM STUDENT 
WHERE First_Name IN ('Prem','Shivansh')

--Qs7. Write a SQL query to print details of the Students excluding FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
SELECT*FROM STUDENT
WHERE First_Name not in ('Prem','Shivansh')

--Qs 8. Write a SQL query to print details of the Students whose FIRST_NAME ends with 'a'.
SELECT*FROM STUDENT
WHERE First_Name LIKE '%a'

--Qs 9. Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.
SELECT FIRST_NAME + ' ' + LAST_NAME AS FullName 
FROM STUDENT
WHERE GPA >= 8.5 AND GPA <= 9.5 

--Qs. 10. Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.
SELECT MAJOR,
COUNT(*) AS STUDENT_COUNT
FROM STUDENT
GROUP BY MAJOR 
ORDER BY STUDENT_COUNT DESC

--Qs 11. Display the details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
SELECT S.FIRST_NAME + ' ' + S.LAST_NAME AS FULL_NAME,
SC.scholarship_amount,SC.scholarship_date
FROM STUDENT S
INNER JOIN SCHOLARSHIP SC 
ON S.STUDENT_ID = SC.student_ref_id

--Qs 12. List all students and their scholarship amounts if they have received any. If a student has not received a scholarship, display NULL for the scholarship details.
SELECT S.FIRST_NAME + ' ' + S.LAST_NAME,
SC.scholarship_amount,
SC.scholarship_date
FROM STUDENT S
LEFT JOIN SCHOLARSHIP SC
ON S.STUDENT_ID = SC.STUDENT_REF_ID

--Qs 13. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
SELECT TOP 5 * FROM STUDENT 
ORDER BY GPA DESC

--Qs 14. Write an SQL query to fetch the list of Students with the same GPA.
SELECT * FROM STUDENT 
WHERE GPA IN (
    SELECT GPA FROM STUDENT 
    GROUP BY GPA 
    HAVING COUNT(*) > 1
)

--Qs 15. Write an SQL query to show the second highest GPA from a Student table using sub-query.
SELECT MAX(GPA) AS SECOND_HIGHEST_GPA
FROM STUDENT
WHERE GPA < (

)

--Qs 16. Write an SQL query to show one row twice in results from a table.

SELECT*FROM STUDENT WHERE STUDENT_ID = 201
UNION ALL
SELECT*FROM STUDENT WHERE STUDENT_ID = 201

--Qs 17. Write an SQL query to list STUDENT_ID who does not get Scholarship.

SELECT S.STUDENT_ID FROM STUDENT S
LEFT JOIN SCHOLARSHIP SC
ON S.STUDENT_ID = SC.STUDENT_REF_ID
WHERE SC.scholarship_amount IS NULL

--Qs 18. Write an SQL query to fetch the MAJOR subject that have less than 4 people in it.

SELECT MAJOR, COUNT(*) AS STUDENT_COUNT 
FROM STUDENT
GROUP BY MAJOR
HAVING COUNT(*) < 4

--Qs 19. Write an SQL query to show all MAJOR subject along with the number of people in there.

SELECT MAJOR, COUNT(*) AS STUDENT_COUNT
FROM STUDENT 
GROUP BY MAJOR
--Qs 20. Write an SQL query to show the last record from a table.

SELECT*FROM STUDENT WHERE STUDENT_ID = (
    SELECT MAX(STUDENT_ID) FROM STUDENT
)

--Qs 21. Write an SQL query to fetch three max GPA from a table using co-related subquery.

SELECT DISTINCT S1.GPA 
FROM STUDENT S1
WHERE 3 >(
    SELECT COUNT (DISTINCT S2.GPA)
    FROM STUDENT S2
    WHERE S2.GPA > S1.GPA 
)
ORDER BY S1.GPA DESC

--Qs 22. Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.

SELECT MAJOR, MAX(GPA) AS MAX_GPA
FROM STUDENT
GROUP BY MAJOR

--Qs 23. Write an SQL query to fetch the names of Students who has highest GPA.

SELECT FIRST_NAME,LAST_NAME,GPA
FROM STUDENT
WHERE GPA = (
    SELECT MAX(GPA)
    FROM STUDENT
)
