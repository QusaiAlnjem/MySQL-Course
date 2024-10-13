			     -- Functions --

-- CONCAT() LENGTH() LOWER() UPPER() REVERSE() --
-- AVG() COUNT() MAX() MIN() SUM() --
-- CURRENT_TIMESTAMP() DATEDIFF() TIMEDIFF() DAY() MONTH() YEAR() --

-- CONCAT()
select concat('Qusai' , ' Alnjem') as FullName;
select concat(Student_Name ,'   ', Nationality) as FullName from students;

-- LENGTH()
select Student_Name , length(student_name) from students;

-- LOWER() , UPPER()
select teacher_name from teachers;
select lower(teacher_name) as teacher_name from teachers;
select upper(teacher_name) as teacher_name from teachers;

-- REVERSE()
select reverse('syug olleh');

-- AVG()
select avg(salary) from teachers;

-- COUNT()
select count(Student_Name) as Student_Count from students;

-- MAX() , MIN()
select max(Age) as maximum from teachers;
select min(Age) as minimum from teachers;

-- SUM()
select sum(salary) from teachers;

-- CURRENT_TIMESTAMP()
select current_timestamp();

-- DATEDIFF()
select datediff(current_date() , '2023-01-01')/30;

-- TIMEDIFF()
select timediff(end_time , start_time) from classes;
select * from classes;

-- DAY() MONTH() YEAR()
select day(current_date());
select month(current_date());
select year(current_date());

select hour('10:05:40');
select minute('10:30:40');
select second('10:30:50');
