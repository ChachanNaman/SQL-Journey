CREATE DATABASE college;
USE college;

CREATE TABLE students(ID int PRIMARY KEY, Name varchar(20), Age int NOT NULL);
select *from students;

insert into students values(1, "naman" , 20);
insert into students values(2, "sahil" , 19);

select *from students;

