                                  -- University Database --
-- Faculties , Specialties , Students , Groups , Teachers , Classes
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

