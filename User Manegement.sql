-- User Management --
select user , host from mysql.user;

create user 'Ahmed'@'localhost' identified by 'School2023';
show grants for Ahmed@localhost;

grant select on classicmodels.* to 'Ahmed'@'localhost';
grant update(employeeNumber) on classicmodels.employees to Ahmed@localhost;
revoke update(employeeNumber) on classicmodels.employees from Ahmed@localhost; 

create user 'Waleed'@'localhost' identified by 'Ko3la123';
show grants for Waleed@localhost;
grant all privileges on *.* to Waleed@localhost with grant option;
drop user Waleed@localhost;

create user 'Ayham'@'%' identified by 'ayham054740';
select * from mysql.user where user = 'Ayham';
grant usage on university.* to 'Ayham'@'%';
revoke usage on *.* from 'Ayham'@'%';
show grants for 'Ayham';
revoke update on *.* from 'Ayham'@'%';