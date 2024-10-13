                                  -- Course File Source --

CREATE DATABASE University;
use University;
CREATE TABLE Faculties(
ID INT PRIMARY KEY AUTO_INCREMENT,
Faculty_Name VARCHAR(50)
);

CREATE TABLE Specialties(
ID INT PRIMARY KEY AUTO_INCREMENT,
Speciality_Name VARCHAR(50),
TutionFee INT DEFAULT 5000,
FacultyID INT,
FOREIGN KEY(FacultyID) REFERENCES Faculties(ID)
);

CREATE TABLE Groups_ (
ID INT PRIMARY KEY AUTO_INCREMENT,
Group_Num VARCHAR(6) UNIQUE,
SpecialityID INT,
FOREIGN KEY (SpecialityID) REFERENCES Specialties(ID)
);

CREATE TABLE Students(
ID INT PRIMARY KEY AUTO_INCREMENT,
Student_Name VARCHAR(30),
Age INT CHECK(Age>=17),
Nationality VARCHAR(20),
Phone INT UNIQUE,
GroupID INT,
FOREIGN KEY (GroupID) REFERENCES Groups_(ID)
);

CREATE TABLE Teachers(
ID INT PRIMARY KEY AUTO_INCREMENT,
Teacher_Name VARCHAR(20),
Age INT,
phone INT UNIQUE,
Speciality VARCHAR(30),
Degree VARCHAR(10),
Experience_Over_10y BOOL,
Salary INT DEFAULT 7500
);

CREATE TABLE Classes(
ID INT PRIMARY KEY AUTO_INCREMENT,
Day ENUM('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'),
Start_Time TIME NOT NULL, 
End_Time TIME NOT NULL,
Room_Num INT,
TeacherID INT,
GroupsID INT,
FOREIGN KEY (TeacherID) REFERENCES Teachers(ID),
FOREIGN KEY (GroupsID) REFERENCES Groups_(ID)
);

create table BlackList(
ID int primary key auto_increment,
Yellow_Warning int,
Red_Warning int,
StudentID int,
foreign key (StudentID) references students(ID)
);

insert into Faculties(Faculty_Name)
values('Information Technology'),('Engineering'),('Medicine'),('Science');

insert into Specialties(Speciality_Name , FacultyID)
values('Computer Science' , 1),('Networks Systems' , 1),('Cyber Security' , 1),
('Civil Engineering' , 2),('Computer Engineering' , 2),('Architectural Engineering' , 2),('Electrical Engineering' , 2),
('Dentistry' , 3),('General Medicine' , 3),('Pharmacy' , 3),
('Mathematics And Physics Sciences' , 4),('Statistics And Researches' , 4);

insert into Groups_(Group_Num , SpecialityID)
values('200.10' , 1),('210.20' , 2),('220.30' , 3),('230.40' , 4),
('300.10' , 5),('310.20' , 6),('320.30' , 7),
('400.10' , 8),('410.20' , 9),('420.30' , 10),
('500.10' , 11),('510.20' , 12);

insert into Students(Student_Name , Age , Nationality , Phone , GroupID)
values('Marie Clarke', 20 , 'USA' , 0796951755 , 4),
('Stetson Roach', 18 , 'Finland' , 0284249398 , 2),
('Lyanna Horn', 21 , 'Jordan' , 0694694962 , 1),
('Wilson Valentine', 18 , 'Iran' , 0326167859 , 6),
('August Melendez', 19 , 'Syria' , 0695723295 , 2),
('Nikolas Drake', 18 , 'Russia' , 0981228414 , 4),
('Jayleen Hubbard', 20 , 'Syria' , 0828414568 , 10),
('Forrest Buck', 21 , 'Jordan' , 0171872585 , 4),
('Livia Barton', 19 , 'Russia' , 0233615993 , 6),
('Cassius Hamilton', 18 , 'Finland' , 0232552665 , 10),
('Mackenzie Gaines', 19 , 'Russia' , 0653688794 , 4),
('Talon Baldwin', 21 , 'Iraq' , 0659934965 , 6),
('Esmeralda Barker', 18 , 'Germany' , 0523724100 , 5),
('Kade Shah', 21 , 'Iran' , 0523724141 , 4),
('Angelica Walker', 19 , 'USA' , 0537683385 , 5),
('Luke Wall', 19 , 'Turkey' , 0248362622 , 8),
('Jayda Humphrey', 21 , 'Spain' , 0235718464 , 2),
('Krew Huynh', 20 , 'Syria' , 0446183425 , 9),
('Oaklee Barrera', 18 , 'USA' , 0878848598 , 3),
('Makai Barnes', 20 , 'Iran' , 0798689982 , 4),
('Liliana Williamson', 21 , 'Jordan' , 0986728354 , 2),
('Emerson Spencer', 20 , 'USA' , 0194223362 , 1),
('Alyssa Meadows', 18 , 'Syria' , 0192365391 , 4),
('Wayne Hurley', 19 , 'Turkey' , 0556738157 , 3),
('Rylan Blankenship', 18 , 'Azerbaijan' , 0728794732 , 10),
('Ernesto Holt', 19 , 'Jordan' , 0292683783 , 12),
('Adelynn Soto', 21 , 'Germany' , 0394626353 , 4),
('Barrett Everett', 18 , 'Syria' , 0875387981 , 9),
('Noah Andrade', 20 , 'Azerbaijan' , 0215991289 , 9),
('Abdiel Stout', 18 , 'Syria' , 0145673538 , 11),
('Chana Fowler', 22 , 'Azerbaijan' , 0954682912 , 4),
('Kameron Acevedo', 20 , 'Azerbaijan' , 0578771587 , 10),
('Ashlynn Hood', 19 , 'Iran' , 0915768961 , 6),
('Brixton Jaramillo', 18 , 'Azerbaijan' , 0721542274 , 4),
('Guadalupe Fleming', 20 , 'Russia' , 0984791297 , 8),
('Fernando Hanna', 18 , 'Azerbaijan' , 0732247317 , 6),
('Cynthia Walters', 20 , 'Spain' , 0583245592 , 5),
('Colson Cortez', 19 , 'Azerbaijan' , 0537486312 , 5),
('Haven Valenzuela', 21 , 'Germany' , 0383482422 , 9),
('Jamari Marshall', 19 , 'Germany' , 0355774568 , 2),
('Adalyn Andrade', 18 , 'Denmark' , 0534147657 , 10),
('Abdiel Vo', 22 , 'Germany' , 0252812668 , 2),
('Artemis Fox', 18 , 'Spain' , 0122138815 , 10),
('Antonio Patton', 21 , 'Germany' , 0929818173 , 3),
('Lorelei Barr', 22 , 'Germany' , 0656526764 , 12),
('Harley Donovan', 21 , 'France' , 0368178896 , 5),
('Azariah Manning', 20 , 'Iraq' , 0119468683 , 5);

insert into Teachers(Teacher_Name , Age , Phone , Speciality , Degree , Experience_Over_10y)
values('Jayceon Espinoza' , 51 , 0794331755 ,'Artificial Intelligence' , 'Doctorate' , True),
('Lucille Wade' , 49 , 0581115592 ,'Networks Systems' , 'Doctorate' , False),
('Jake Washington' , 56 , 0368766239 ,'Cyber Security' , 'Doctorate' , True),
('Valerie Donovan' , 48 , 0534122983 ,'Dentistry' , 'Doctorate' , False),
('Brayan Underwood' , 39 , 0534147657 ,'Databases Management' , 'Doctorate' , False),
('Ensley Patton' , 40 , 0529977231 ,'Eyes Surgery' , 'Doctorate' , False),
('Moises Schneider' , 47 , 0678233289 ,'Neurological Surgery' , 'Doctorate' , True),
('Delaney Burch' , 43 , 053400326 ,'Web Development' , 'Doctorate' , False),
('Gerald Gibson' , 59 , 0528722456 ,'Cardiology' , 'Doctorate' , True),
('Eden Kelly' , 40 , 0531149098 ,'Dentistry' , 'Doctorate' , False),
('Cooper Lyons' , 61 , 0953478123 ,'Mathematics Integrals' , 'Doctorate' , True),
('Kenzie Hill' , 44 , 0999937832 ,'Data Analysis' , 'Doctorate' , False),
('Isaac Stark' , 33 , 0209117864 ,'Statistics' , 'Master' , False),
('Kamilah Robbins' , 36 , 0875355387 ,'Electrical Circuits' , 'Master' , False),
('Finnegan Pena' , 34 , 0875190982 ,'Software Engineering' , 'Master' , False),
('Rachel Austin' , 32 , 0875837613 ,'Data Analysis' , 'Master' , False),
('Omar Padilla' , 31 , 0675312345 ,'Manufacturing Engineering' , 'Master' , False),
('Maggie Garner' , 32 , 0575528765 ,'Environmental Engineering' , 'Master' , False),
('Sage Dillon' , 35 , 0575398375 ,'Pediatrics' , 'Doctorate' , False),
('Laurel Henson' , 62 , 0519455467 ,'Scientific Researches' , 'Doctorate' , True),
('Bellamy Berg' , 43 , 0989420985 ,'Physics' , 'Doctorate' , False),
('Emmalyn Young' , 31 , 0229400213 ,'Pharmacy' , 'Master' , False),
('Asher Newton' , 28 , 0319478774 ,'Cyber Security' , 'Master' , False),
('Braelynn Barron' , 42 , 0199474556 ,'Orthopaedic surgery' , 'Doctorate' , False),
('Dustin French' , 41 , 0257483268 ,'Architectural Engineering' , 'Doctorate' , False),
('Lorelai Myers' , 40 , 0783022668 ,'Earthquake Engineering' , 'Master' , False),
('Adam Jacobson' , 29 , 0252882054 ,'Civil Engineering' , 'Master' , False);

insert into Classes(Day , Start_Time , End_Time , Room_Num , TeacherID , GroupsID)
values('Sunday','08:30','10:00',520,1,1),('Sunday','08:30','10:00',522,2,2),('Sunday','08:30','10:00',519,3,3),
('Sunday','08:30','10:00',310,4,8),('Sunday','08:30','10:00',420,5,5),('Sunday','10:30','12:00',321,6,9),
('Sunday','12:30','02:00',507,7,1),('Sunday','12:30','02:00',515,8,2),('Sunday','12:30','02:00',318,9,10),
('Monday','08:30','10:00',212,10,11),('Monday','08:30','10:00',513,11,1),('Monday','08:30','10:00',210,12,12),
('Monday','02:30','04:00',411,13,7),('Monday','12:30','02:00',512,14,3),('Monday','12:30','02:00',418,15,5),
('Tuesday','08:30','10:00',405,16,6),('Tuesday','10:30','12:00',401,17,6),('Tuesday','08:30','10:00',320,18,9),
('Tuesday','08:30','10:00',207,19,12),('Tuesday','10:30','12:00',415,20,4),('Tuesday','10:30','12:00',326,21,10),
('Tuesday','02:30','04:00',509,22,3),('Tuesday','10:30','12:00',302,23,9),('Tuesday','02:30','04:00',418,24,6),
('Tuesday','08:30','10:00',409,25,4),('Tuesday','12:30','02:00',422,26,4),
('Wednesday','08:30','10:00',220,11,12),('Wednesday','08:30','10:00',522,3,3),('Wednesday','08:30','10:00',410,20,5),
('Wednesday','10:30','12:00',410,20,7),('Wednesday','08:30','10:00',526,22,1),('Wednesday','10:30','12:00',526,22,3),
('Wednesday','12:30','02:00',307,9,8),('Wednesday','12:30','02:00',515,5,9),('Wednesday','02:30','04:00',318,20,9),
('Thursday','08:30','10:00',221,19,12),('Thursday','08:30','10:00',212,10,11),('Thursday','08:30','10:00',413,26,7),
('Thursday','10:30','12:00',510,20,2),('Thursday','08:30','10:00',526,10,2),('Thursday','10:30','12:00',226,20,11),
('Thursday','12:30','02:00',208,10,12),('Thursday','12:30','02:00',315,18,9),('Thursday','02:30','04:00',318,8,9),
('Thursday','08:30','10:00',426,26,4),('Thursday','10:30','12:00',409,25,4);

insert into BlackList(Yellow_Warning , Red_Warning , StudentID)
values(1 , 0 , 20) , (1 , 0 , 12) , (2 , 0 , 34)  ,(1 , 0 , 4) , (2 , 0 , 42);

-- Distinct, order by , desc limit --
select distinct Nationality from students;
select distinct Speciality from teachers;
select * from classes order by GroupsID;
select * from classes where Day = 'Thursday' order by GroupsID;
select * from classes where Day = 'Thursday' order by GroupsID desc;
select Student_Name , Age from students order by Student_Name desc limit 10;

-- Built-In Functions --
select concat(Student_Name , Nationality) from students; -- add ' ' and AS
select concat('Qusai' , ' Alnjem');
select length(student_name) from students; -- add student_name
select lower(teacher_name) as teacher_name from teachers;
select upper(teacher_name) as Teacher_Name from teachers;
select reverse('syug olleh');
select current_timestamp();
select datediff(current_date() , '2023-01-01');
select timediff(end_time , start_time) from classes;
select timestampdiff(current_timestamp() , '2004-05-05 10:15:00');
select day(current_date());
select month(current_date());
select year(current_date());
select hour(current_time());
select minute(current_time());
select second(current_time());
select avg(salary) from teachers;
select sum(salary) from teachers;
select max(Age) from teachers;
select min(Age) from teachers;
select count(Student_Name) from students;

-- Subqueries
select * from teachers where Salary > (select avg(salary) from teachers);
select Group_Num from groups_;
select Group_Num from groups_ where SpecialityID 
in (select ID from specialties where FacultyID = 2);
select * from teachers where Age = (select max(Age) from teachers);

-- Operators
select * from BlackList;
select * from Students where ID IN (select StudentID from BlackList);
select * from teachers where ID != 
ALL(select distinct TeacherID from Classes where Day IN ('Sunday' , 'Wednesday'));
select Student_Name , Nationality , GroupID from students 
where GroupID = 1 OR Nationality = 'Germany'; -- and 
select * from teachers where salary BETWEEN 3000 AND 6000;
select * from students where Student_Name LIKE "مح%";
select * from students where 
EXISTS(select StudentID from BlackList where StudentID = students.ID);

-- Group by 
select Day , Count(Start_Time) as Classes from classes 
GROUP BY Day HAVING Classes < 10;
select Nationality , Count(Student_Name) as Students from Students
GROUP BY Nationality HAVING Nationality IS NOT NULL order by Students desc;
select Degree , Count(Teacher_Name) as Teachers, Sum(Salary) as 'Total Salaries',
Avg(Salary) as Average from teachers GROUP BY Degree;

-- Alter Table
-- ADD
ALTER TABLE Students
ADD Average int;
select * from Students;
ALTER TABLE Teachers
ADD FacultyID int;
ALTER TABLE Teachers
ADD constraint foreign key (FacultyID) references faculties(ID);
select * from Teachers;
-- DROP
ALTER TABLE Students
DROP Average;
select * from Students;
DROP TABLE students;
DROP DATABASE School;
ALTER TABLE teachers
DROP foreign key teachers_ibfk_1;
SHOW create table teachers;
-- UPDATE
UPDATE Classes SET Start_Time = '14:30:00' where Start_Time = '02:30:00';
UPDATE Classes SET End_Time = '14:00:00' where End_Time = '02:00:00';
UPDATE Classes SET End_Time = '16:00:00' where End_Time = '04:00:00';
select * from teachers;
UPDATE Teachers SET FacultyID = 1 where ID IN (1,2,3);
UPDATE Students SET Average = 75 where Average IS NULL;
-- DELETE
UPDATE Students SET Average = NULL where ID = 50;
DELETE FROM Students where ID = 50;
DELETE FROM blacklist where ID = 2;
DELETE FROM Teachers where ID = 16;

select * from classes;
ALTER TABLE CLASSES
DROP FOREIGN KEY classes_ibfk_1;
ALTER TABLE CLASSES
ADD CONSTRAINT FOREIGN KEY (TeacherID) REFERENCES Teachers(ID) ON DELETE SET NULL;

DELETE FROM Students where ID = 4;
ALTER TABLE blacklist
DROP FOREIGN KEY blacklist_ibfk_1;
ALTER TABLE blacklist
ADD CONSTRAINT FOREIGN KEY (StudentID) REFERENCES Students(ID) ON DELETE CASCADE;

-- joins
select * from students join groups_ on students.groupID = groups_.id;
select Group_Num , Count(Student_Name) AS Students
from students join groups_ on students.groupID = groups_.id
GROUP BY Group_Num;
select Student_Name , Yellow_Warning , Red_Warning
from Students join BlackList on students.ID = studentID;
select Teacher_Name , Count(c.ID) as Classes
from teachers t join classes c on t.ID = TeacherID
Group by Teacher_Name order by classes desc;
select customerName , phone , Concat(firstName,' ',lastName) as employeeName
from customers c left join employees e on salesRepEmployeeNumber = e.employeeNumber;


-- Distinct, order by , desc limit --
select distinct Nationality from students;
select distinct Speciality from teachers;
select * from classes order by GroupsID;
select * from classes where Day = 'Thursday' order by GroupsID;
select * from classes where Day = 'Thursday' order by GroupsID desc;
select Student_Name , Age from students order by Student_Name desc limit 10;

-- Functions --
select concat(Student_Name , Nationality) from students; -- add ' ' and AS
select concat('Qusai' , ' Alnjem');
select length(student_name) from students; -- add student_name
select lower(teacher_name) as teacher_name from teachers;
select upper(teacher_name) as Teacher_Name from teachers;
select reverse('syug olleh');
select current_timestamp();
select datediff(current_date() , '2023-01-01');
select timediff(end_time , start_time) from classes;
select timestampdiff(current_timestamp() , '2004-05-05 10:15:00');
select day(current_date());
select month(current_date());
select year(current_date());
select hour(current_time());
select minute(current_time());
select second(current_time());
select avg(salary) from teachers;
select sum(salary) from teachers;
select max(Age) from teachers;
select min(Age) from teachers;
select count(Student_Name) from students;

-- Subqueries
select * from teachers where Salary > (select avg(salary) from teachers);
select Group_Num from groups_;
select Group_Num from groups_ where SpecialityID 
in (select ID from specialties where FacultyID = 2);
select * from teachers where Age = (select max(Age) from teachers);

-- Operators
create table BlackList(
ID int primary key auto_increment,
Yellow_Warning int,
Red_Warning int,
StudentID int,
foreign key (StudentID) references students(ID)
);
insert into BlackList(Yellow_Warning , Red_Warning , StudentID)
values(1 , 0 , 20) , (1 , 0 , 12) , (2 , 0 , 34)  ,(1 , 0 , 4) , (2 , 0 , 42);
select * from BlackList;
select * from Students where ID IN (select StudentID from BlackList);
select * from teachers where ID != 
ALL(select distinct TeacherID from Classes where Day IN ('Sunday' , 'Wednesday'));
select Student_Name , Nationality , GroupID from students 
where GroupID = 1 OR Nationality = 'Germany'; -- and 
select * from teachers where salary BETWEEN 3000 AND 6000;
select * from students where Student_Name LIKE "مح%";
select * from students where 
EXISTS(select StudentID from BlackList where StudentID = students.ID);

-- Group by 
select Day , Count(Start_Time) as Classes from classes 
GROUP BY Day HAVING Classes < 10;
select Nationality , Count(Student_Name) as Students from Students
GROUP BY Nationality HAVING Nationality IS NOT NULL order by Students desc;
select Degree , Count(Teacher_Name) as Teachers, Sum(Salary) as 'Total Salaries',
Avg(Salary) as Average from teachers GROUP BY Degree;

-- Alter Table
-- ADD
ALTER TABLE Students
ADD Average int;
select * from Students;
ALTER TABLE Teachers
ADD FacultyID int;
ALTER TABLE Teachers
ADD constraint foreign key (FacultyID) references faculties(ID);
select * from Teachers;
-- DROP
ALTER TABLE Students
DROP Average;
select * from Students;
DROP TABLE students;
DROP DATABASE School;
ALTER TABLE teachers
DROP foreign key teachers_ibfk_1;
SHOW create table teachers;
-- UPDATE
UPDATE Classes SET Start_Time = '14:30:00' where Start_Time = '02:30:00';
UPDATE Classes SET End_Time = '14:00:00' where End_Time = '02:00:00';
UPDATE Classes SET End_Time = '16:00:00' where End_Time = '04:00:00';
select * from Faculties;
select * from teachers;
select * from Students;
UPDATE Teachers SET FacultyID = 4 where ID IN (11,13,20,21);
UPDATE Students SET Average = 80 where Nationality = 'USA';
UPDATE Teachers SET Salary = 5000 where ID in (26 , 27);
-- DELETE
UPDATE Students SET Average = NULL where ID = 50;
DELETE FROM Students where ID = 50;
DELETE FROM blacklist where ID = 2;
DELETE FROM Teachers where ID = 16;

select * from classes;
ALTER TABLE CLASSES
DROP FOREIGN KEY classes_ibfk_1;
ALTER TABLE CLASSES
ADD CONSTRAINT FOREIGN KEY (TeacherID) REFERENCES Teachers(ID) ON DELETE SET NULL;

DELETE FROM Students where ID = 4;
ALTER TABLE blacklist
DROP FOREIGN KEY blacklist_ibfk_1;
ALTER TABLE blacklist
ADD CONSTRAINT FOREIGN KEY (StudentID) REFERENCES Students(ID) ON DELETE CASCADE;

-- joins
select * from students join groups_ on students.groupID = groups_.id;
select Group_Num , Count(Student_Name) AS Students
from students join groups_ on students.groupID = groups_.id
GROUP BY Group_Num;
select Student_Name , Yellow_Warning , Red_Warning
from Students join BlackList on students.ID = studentID;
select Teacher_Name , Count(c.ID) as Classes
from teachers t join classes c on t.ID = TeacherID
Group by Teacher_Name order by classes desc;
select customerName , phone , Concat(firstName,' ',lastName) as employeeName
from customers c left join employees e on salesRepEmployeeNumber = e.employeeNumber;
select b.JobTitle , concat(b.firstName , b.lastName) as "Reports From", 
concat(a.firstName , a.lastName) as "To" , a.JobTitle
from employees a right join employees b
on a.employeeNumber = b.reportsTo;
select * from employees;

-- Case
select Teacher_Name , Age , Speciality ,
CASE 
	WHEN Experience_Over_10y = 1 THEN "True"
    WHEN Experience_Over_10y = 0 THEN "False"
    END AS Expert,
CASE 
	WHEN Experience_Over_10y = 1 THEN Salary + 2500 
    WHEN Experience_Over_10y = 0 THEN Salary - 1000
    END AS Salary
from teachers;

select  Student_Name, Age, Nationality, Phone, 
group_num, faculty_name, speciality_name , Average,
CASE 
	WHEN Average > 90 THEN TutionFee*0.0
    WHEN Average BETWEEN 85 AND 89 THEN TutionFee*0.5
    WHEN Average BETWEEN 80 AND 84 THEN TutionFee*0.75
    ELSE TutionFee
END AS Tutionfee
from students join groups_ g on g.ID = GroupID
join specialties s on s.ID = SpecialityID
join faculties f on f.ID = FacultyID ORDER BY Average DESC;
set autocommit = on;
commit;
rollback;

-- UNION
create temporary table Best_Students(
select Student_Name , Average from students order by Average desc limit 5
);
create temporary table Worst_Students(
select Student_Name , Average from students order by Average limit 5
);

select * from Best_Students
UNION
select * from Worst_Students;

select ID , Teacher_Name from teachers where
ID = ANY(select TeacherID from classes where Day = 'Tuesday')
Union
select ID , Teacher_Name from teachers where
ID = ANY(select TeacherID from classes where Day = 'Thursday');

select Teacher_Name , Phone , Salary from teachers
Union
select 'Total Salaries' , Null , Sum(Salary) from teachers;

-- Indexes
show indexes from students;
show indexes from teachers;
create index idx_student_name on students(student_name);
create index idx_teacher_name on teachers(teacher_name);
drop index idx on teachers;
drop index idx_name on students;

-- Views
create VIEW Student_info AS
select Student_Name , Age , Nationality , Group_Num 
from students join groups_ g on g.ID = GroupID;
drop view Student_info;
select * from Student_info;
create VIEW Teacher_info AS
select Teacher_Name, Degree , Phone , Salary from teachers
union
select 'Total Salaries' , null , null , sum(Salary) from teachers
order by Salary desc;
drop view Teacher_info;
select * from Teacher_info;

-- IF Statement
select teacher_name , Age , IF(Age > 50 , 'Old Man' , 'Still Young') as MyOpinion from teachers;

DELIMITER &
CREATE PROCEDURE get_orders(stat varchar(20))
BEGIN

    IF stat = 'Shipped' THEN
		SELECT OrderNumber,
		Status,
		orderDate,
		shippedDate
		FROM orders
		where status = stat;
    
    ELSEIF stat = 'Cancelled' THEN
		SELECT OrderNumber,
		Status,
		orderDate,
		Comments
		FROM orders
		where status = stat;
    
    ELSE 
		SELECT OrderNumber,
		Status,
		orderDate,
        requiredDate
		FROM orders
		where status = stat;
	END IF;
    
END&
DELIMITER ;

CALL get_orders('Cancelled');

-- Procedures
DELIMITER $$
create procedure Group_Search(GroupNum varchar(6))
BEGIN

select Student_Name , Nationality , Group_Num as 'Group'
from students join groups_ g on g.ID = GroupID
where Group_Num = GroupNum order by Student_Name;

END$$
DELIMITER ;
select * from groups_;
CALL Group_Search('230.40');

DELIMITER $$
CREATE PROCEDURE Student_Search(StudentName varchar(40))
BEGIN

	SET @StudentNamePattern = Concat(StudentName , '%');
	
		select  Student_Name, Age, Nationality, Phone, 
		group_num, faculty_name, speciality_name , Average,
		CASE 
			WHEN Average > 90 THEN TutionFee*0.0
			WHEN Average BETWEEN 85 AND 90 THEN TutionFee*0.5
			WHEN Average BETWEEN 80 AND 84 THEN TutionFee*0.75
			ELSE TutionFee
		END AS Tutionfee
		from students join groups_ g on g.ID = GroupID
		join specialties s on s.ID = SpecialityID
		join faculties f on f.ID = FacultyID where Student_Name LIKE @StudentNamePattern;

END$$
DELIMITER ;
drop procedure Group_Search;

CALL Student_Search('Marie');

DELIMITER &
CREATE PROCEDURE get_orders(stat varchar(20))
BEGIN

    IF stat = 'Shipped' THEN
		SELECT OrderNumber,
		Status,
		orderDate,
		shippedDate
		FROM orders
		where status = stat;
    
    ELSEIF stat = 'Cancelled' THEN
		SELECT OrderNumber,
		Status,
		orderDate,
		Comments
		FROM orders
		where status = stat;
    
    ELSE 
		SELECT OrderNumber,
		Status,
		orderDate,
        requiredDate
		FROM orders
		where status = stat;
	END IF;
    
END&
DELIMITER ;
drop procedure get_orders;
CALL get_orders('Cancelled');
select status from orders;

-- Triggers
DELIMITER ^
CREATE TRIGGER Experience_Update_Salary
BEFORE UPDATE ON teachers
FOR EACH ROW
BEGIN

IF (OLD.Experience_Over_10y = 0 AND NEW.Experience_Over_10y = 1) THEN
	SET NEW.salary = (OLD.salary + 1000);
END IF;

END^
DELIMITER ;

DROP TRIGGER Experience_Update_Salary;
select * from teachers;
update teachers set Salary = 9000 where ID = 11;

CREATE TABLE Salary_History(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Teacher_ID INT,
    Teacher_Name varchar(30),
    Old_Salary DECIMAL(10,2),
    New_Salary DECIMAL(10,2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Teacher_ID) REFERENCES Teachers(ID)
);
select * from salary_history;

DELIMITER ^
CREATE TRIGGER salary_update_trigger
AFTER UPDATE ON Teachers
FOR EACH ROW
BEGIN

IF OLD.Salary <> New.Salary THEN
	INSERT INTO Salary_History (Teacher_ID, Teacher_Name ,Old_Salary, New_Salary)
	VALUES (NEW.ID, NEW.Teacher_Name ,OLD.Salary, NEW.Salary);
END IF;

END^
DELIMITER ;

UPDATE teachers SET Salary = salary + 1000 where ID = 21;

select * from salary_history;
drop trigger salary_update_trigger;
select * from salary_history;

-- While Loop
delimiter ^
create procedure Discount()
begin
    declare counter int;
    declare maxID int;
    
    select max(ID) into maxID from students;
    
    set counter = 1;
    
    while counter <= maxID DO
        begin
            if (select Average from students where ID = counter) > 90 then
                update students set Discount = '100%' where ID = counter;
            
            elseif (select Average from students where ID = counter) between 85 and 90 then
                update students set Discount = '50%' where ID = counter;
            
            elseif (select Average from students where ID = counter) between 80 and 84 then
                update students set Discount = '25%' where ID = counter;
            
            else
                update students set Discount = '0%' where ID = counter;
            end if;
            
            set counter = counter + 1;
        end;
    end while;
end^
delimiter ;
drop procedure Discount;
alter table students
drop Discount;
select * from students;
call Discount();
select * from students;

-- Copying Data
create database backupdb;
drop database backupdb;
create temporary table SFB(
select students.ID , Student_Name , Age , Speciality_Name,
Average , Current_Semester , Semesters_Required
from students join groups_ g on GroupID = g.ID
join specialties s on SpecialityID = s.ID
where Current_Semester = Semesters_Required
);
select * from SFB;

CREATE TABLE backupdb.Seniors2023 AS
SELECT * FROM University.SFB;
select * from Seniors2023;

select max(ID) into maxID;

delete from seniors2023;
INSERT INTO Seniors2023
(ID, Student_Name, Age, Speciality_Name, Average)
SELECT ID, Student_Name, Age, Speciality_Name, Average
FROM University.SFB;

select * from employees;
drop table employees;

-- Events
CREATE EVENT Auto_Backup
  ON SCHEDULE every 1 minute
  starts current_timestamp()
  ends current_timestamp() + interval 1 hour
  ON COMPLETION PRESERVE
  DO
    insert into backupdb.students
    (ID,Student_Name,Age,Nationality,Phone,GroupID,Average,Discount,Current_Semester)
	select * from university.students;

show processlist;
set global event_scheduler = on;
create table backupdb.students as 
select * from University.students;
truncate backupdb.students;
select * from students;
drop event Auto_Backup;

CREATE EVENT insert_student
  ON SCHEDULE at current_timestamp() + interval 1 minute
  DO
    insert into university.students(Student_Name,Age,Nationality,Phone,GroupID,Average)
    value('Qusai Alnjem',19,'Syria',0453928731,5,88);

select * from university.students;

-- Functions --
DELIMITER //
CREATE FUNCTION Classes_Count(teacher varchar(30))
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE RESULT INT;
    SET RESULT = (select count(*) from classes
    join teachers t on TeacherID = t.ID
    where Teacher_Name = teacher group by Teacher_Name);
    RETURN RESULT;
END//
DELIMITER ;

select Classes_Count('Eden Kelly') as classes;
select * from teachers;
drop function classses_count;

-- Project --
create table Applicants_Info(
ID int primary key auto_increment,
Name varchar(30) not null,
Age int,
Country varchar(20),
Phone decimal(10,0),
Email varchar(50),
Address varchar(20)
);
create table Applicants_Grades(
Applicant_ID int,
High_School int not null,
Math int not null,
Physics int not null,
English int not null,
ILETS decimal(3,1) not null,
SAT int not null,
foreign key(Applicant_ID) references Applicants_Info(ID) on delete cascade
);

insert into applicants_info(Name,Age,Country,Phone,Email,Address)
values('Eren Yeager' , 19 , 'Germany' , 0457823971 , 'eren@gmail.com' , null),
('Mikasa Ackerman' , 19 , 'UK' , 0457823289 , 'mikasa@gmail.com' , null),
('Levi Ackerman' , 22 , 'Finland' , 0232823971 , 'levi@gmail.com' , null),
('Erwin Smith' , 24 , 'Norway' , 0457434971 , 'erwin@gmail.com' , null),
('Historia Reiss' , 18 , 'UK' , 0267823971 , 'historia@gmail.com' , null);
select * from applicants_info;

insert into applicants_grades(Applicant_ID,High_School,Math,Physics,English,ILETS,SAT)
values(1,95,99,91,85,6.0,1200),(2,98,99,99,97,7.5,1325),
(3,85,83,89,81,4.5,1050),(4,99,99,99,99,8.0,1375),(5,97,98,88,95,7.0,1200);
select * from applicants_grades;

DELIMITER !
create function Requirments_Test(app_ID int)
returns int
reads sql data
begin
	
    set @result = (select if(exists(select * from Applicants 
    where Applicant_ID = app_ID
    and high_school>=95
    and Math>95 
    and Physics>95 
    and English>95 
    and ILETS>6.0 
    and SAT>900),
    app_ID , 0));
    
    return @result;
end!
DELIMITER ;

DELIMITER !
create procedure Candidates()
begin
	declare counter int;
    declare maxID int;
    
	create temporary table Applicants AS
	SELECT
	ROW_NUMBER() OVER (ORDER BY a.ID) AS ID,
	a.Name , applicants_grades.*
	FROM applicants_info a JOIN applicants_grades 
	ON a.ID = Applicant_ID;
    
    set counter = 1;
    set maxID = (select count(*) from applicants_info);
    
    while counter <= maxID do
		begin
			if (select Requirments_Test(counter)) = 0 then
				delete from Applicants where Applicant_ID = counter;
			end if;
            set counter = counter + 1;
        end;
    end while;
    
    -- Showing The Result --
    select * from Applicants;
    drop temporary table Applicants;
end!
DELIMITER ;

select * from applicants_info;
select * from applicants_grades;
CALL Candidates();
drop procedure Candidates;
