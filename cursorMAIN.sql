create database dora;
use dora;

CREATE TABLE EMPLOYEE (
    ENo INT PRIMARY KEY,
    FName VARCHAR(100),
    Age INT,
    Grade VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO EMPLOYEE (ENo, FName, Age, Grade, Salary) VALUES
(1, 'Arjun', 35, 'Asst. Prof', 50000),
(2, 'Sneha', 40, 'Associate Prof', 70000),
(3, 'Raj', 45, 'Professor', 90000),
(4, 'Meena', 32, 'Asst. Prof', 52000),
(5, 'Vikram', 38, 'Professor', 88000);

delimiter //
create procedure incre()
begin 
declare empno int;
declare grd varchar(50);

declare yy cursor for select ENo , Grade from EMPLOYEE;

open yy;

fetch yy into empno , grd ;

update EMPLOYEE 
set salary = salary +10000
where Grade = 'Asst. Prof';

update EMPLOYEE 
set salary = salary +20000
where Grade = 'Associate Prof';

update EMPLOYEE 
set salary = salary +30000
where Grade = 'Professor';

close yy ;

end //

delimiter ;

call incre() ;

select *from EMPLOYEE;




