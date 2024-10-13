-- Triggers --
-- Syntax --

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
    Old_Salary DECIMAL(6,2),
    New_Salary DECIMAL(6,2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Teacher_ID) REFERENCES Teachers(ID)
);

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

select * from salary_history;
