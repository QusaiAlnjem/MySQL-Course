-- Operators In SQL --
-- ALL AND OR ANY BETWEEN EXISTS IN LIKE NOT --

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

-- ANY
select * from Students where ID = ANY(select StudentID from BlackList);
select StudentID from BlackList;

-- ALL & IN
select * from teachers where ID != -- <> 
ALL(select distinct TeacherID from Classes where Day IN ('Sunday' , 'Wednesday' , 'Monday'));
select distinct TeacherID from Classes where Day IN ('Sunday' , 'Wednesday' , 'Monday');
select ID from teachers order by ID;

-- AND & OR
select Student_Name , Age , Nationality , GroupID from students 
where GroupID = 1 AND Nationality = 'USA' AND Age > 19; 
select Student_Name , Age , Nationality , GroupID from students 
where GroupID = 1 OR Nationality = 'USA'; 

-- BETWEEN
select * from teachers where salary BETWEEN 3000 AND 6000;

-- LIKE
select * from students where Phone LIKE "5%";

-- EXISTS
select * from students where 
EXISTS(select StudentID from BlackList where StudentID = students.ID);
select * from students;

-- NOT -> IN LIKE EXISTS BETWEEN