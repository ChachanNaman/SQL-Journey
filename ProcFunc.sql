create database test2;
use test2;

#FUNCTION
create table employee(
id int , 
name varchar(20),
superid int ,
salary double , 
bdate date ,
dno int);

select *from employee;

insert into employee 
(id , name , superid , salary , bdate , dno)
values
(1 , 'naman'  , 3 , 100000 , '1960-01-01' , 1),
(2 , 'krish'  , 3 , 50000 , '1964-12-01' , 3),
(3 , 'aman'  , NULL , 80000 , '1974-02-07' , 3),
(4, 'palak'  , 1 , 50000 , '1970-01-17' , 2),
(5 , 'harsh'  ,NULL , NULL , '1985-01-12' , 1);

select *from employee;

delimiter $$
create function increment(oldval double , amount double)
returns double 
deterministic
begin 
declare newval double;
set newval = oldval + (1*amount);
return newval;

end $$

delimiter ;

select name , salary , increment(salary , 0.1) as incc
from employee;


#IN Procedure
create table departement(
dnumber int ,
dname varchar(50));

insert into departement values
(1, 'payroll'),
(2, 'techie'),
(3, 'research');

select *from departement;

create table deptsal(
dnumber int , 
totalsalary double );

insert into deptsal values
(1, 0),
(2, 0),
(3, 0);

USE test2;
DELIMITER //

CREATE PROCEDURE updated(IN param1 INT)
BEGIN 
    UPDATE deptsal
    SET totalsalary = (
        SELECT SUM(salary)
        FROM employee
        WHERE dno = param1
    )
    WHERE dnumber = param1;
END //

DELIMITER ;


CALL updated(1);
CALL updated(2);
CALL updated(3);
select *from deptsal;

#INOUT Procedure
delimiter //
create procedure counter(inout count int , in increment int)
begin
set count = count +increment;
end // 

delimiter ;
set @counter = 0;
call counter(@counter , 1);
select @counter;

show procedure status;

		






