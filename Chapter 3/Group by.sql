-- Group by & Having --
-- select column1 , function(column2) from table_name group by column1 --

select * from classes;

select Day , Count(Start_Time) as Classes from classes
GROUP BY Day HAVING Classes < 10;

select * from students;

select Nationality , Count(Student_Name) as Students from Students
GROUP BY Nationality HAVING Nationality IS NOT NULL order by Students desc limit 5;

select * from teachers;

select Degree , Count(Teacher_Name) as Teachers, Sum(Salary) as 'Total Salaries',
Avg(salary) as Average from teachers GROUP BY Degree;



