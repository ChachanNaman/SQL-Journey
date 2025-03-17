create database colleges;
use colleges;

create table student(
id int primary key,
name varchar(20)
);

insert into student
(id , name )
values
(101 , "naman"),
(102,"pratik"),
(103, "krish");

create table course(
id int primary key,
course varchar(50)
);

insert into course 
(id , course)
values
(102 , "english"),
(105, "maths"),
(103 , "science"),
(107 , "sst");

select *from student;
select *from course;

#INNER JOIN : 

select *
from student
INNER JOIN course 
ON student.id = course.id;

#LEFT JOIN : 

select *
from student
LEFT JOIN course 
ON student.id = course.id;

#RIGHT JOIN :

select *
from student
RIGHT JOIN course 
ON student.id = course.id;

#FULL JOIN :
select *
from student
LEFT JOIN course 
ON student.id = course.id
UNION 
select *
from student
RIGHT JOIN course 
ON student.id = course.id;

#LEFT EXCLUSIVE JOIN : 
select *
from student
LEFT JOIN course 
ON student.id = course.id
WHERE course.id IS NULL;





