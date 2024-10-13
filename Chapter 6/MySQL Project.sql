-- Advanced Task --
-- Applicants' information and scores tables --
-- Function to test the scores --
-- Procedure to be the body of the project --
-- You have to use: while, if, variables, temporary table

create table Applicants_Info(
ID int primary key,
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

insert into applicants_info(ID,Name,Age,Country,Phone,Email,Address)
values(1003 , 'Eren Yeager' , 19 , 'Germany' , 0457823971 , 'eren@gmail.com' , null),
(2034 , 'Mikasa Ackerman' , 19 , 'UK' , 0457823289 , 'mikasa@gmail.com' , null),
(3213 , 'Levi Ackerman' , 22 , 'Finland' , 0232823971 , 'levi@gmail.com' , null),
(2388 , 'Erwin Smith' , 24 , 'Norway' , 0457434971 , 'erwin@gmail.com' , null),
(1543 , 'Historia Reiss' , 18 , 'UK' , 0267823971 , 'historia@gmail.com' , null);
select * from applicants_info;

insert into applicants_grades(Applicant_ID,High_School,Math,Physics,English,ILETS,SAT)
values(1003,95,99,91,85,6.0,1200),(2034,98,99,99,97,7.5,1325),
(3213,85,83,89,81,4.5,1050),(2388,99,99,99,99,8.0,1375),(1543,97,98,88,95,7.0,1200);
select * from applicants_grades;

DELIMITER $$
create function Requirements_Test(app_ID int)
returns int
reads sql data
begin
	
    set @result = 
    (select if(exists(select * from Applicants
	where id = app_ID
	and High_School >= 95
	and Math > 90
	and Physics > 90
	and English > 95
	and ILETS > 5.5
	and SAT > 1000)
    , app_ID , 0));
    
    return @result;
    
end$$
DELIMITER ;


DELIMITER $$
create procedure Candidates()
begin
	declare counter int;
    declare maxAp int;
    
    create temporary table Applicants(
    SELECT
	ROW_NUMBER() OVER (ORDER BY a.ID) AS ID,
	a.Name , applicants_grades.*
	FROM applicants_info a JOIN applicants_grades 
	ON a.ID = Applicant_ID
    );
    
    set counter = 1;
    set maxAp = (select count(*) from Applicants_info);
	
    while counter <= maxAp do
		begin
			if(Requirements_Test(counter) = 0) then
				delete from Applicants where id = counter;
			end if;
            
            set counter = counter + 1;
        end;
	end while;
	
    -- Showing the result --
    alter table applicants
    drop id;
    select * from Applicants;
    drop temporary table Applicants;
end$$
DELIMITER ;

call Candidates();

