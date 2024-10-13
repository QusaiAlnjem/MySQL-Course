-- Procedures --
select * from Groups_;

-- Group Search --
DELIMITER $$
CREATE PROCEDURE Group_Search(GrpNum varchar(6))
BEGIN
	
    select Student_Name , Nationality , Group_Num as 'Group'
	from students join groups_ g on g.ID = GroupID
	where Group_Num = GrpNum order by Student_Name;
    
END$$
DELIMITER ;

CALL Group_Search('200.10')

-- Student Search --
DELIMITER $$
CREATE PROCEDURE Student_Search(Student varchar(30))
BEGIN
	
	Set @StudentNamePattern = Concat(Student , '%');
    select  Student_Name, Age, Nationality, Phone, 
	group_num, faculty_name, speciality_name , Average,
	CASE 
		WHEN Average > 92 THEN TutionFee*0.2
		WHEN Average BETWEEN 80 AND 92 THEN TutionFee*0.75
		ELSE TutionFee
	END AS Tutionfee
	from students join groups_ g on g.ID = GroupID
	join specialties s on s.ID = SpecialityID
	join faculties f on f.ID = FacultyID 
    where Student_Name Like @StudentNamePattern;
    
END$$
DELIMITER ;

CALL Student_Search('Qusai Alnjem')