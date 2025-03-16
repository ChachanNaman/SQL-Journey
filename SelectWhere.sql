create database hello;
use hello;


create table students(
roll_no int primary key, 
name varchar(20),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into students
(roll_no , name , marks, grade , city)
values
(101 ,"naman" , 99 , "a" , "pune"),
(102 ,"krish" , 77 , "b" , "mumbai"),
(103 ,"pritam" , 22 , "c" , "mumbai"),
(104 ,"sairaj" , 11 , "a" , "delhi"),
(105 ,"pratik" , 88 , "f" , "delhi"),
(106 ,"aman" , 33 , "c" , "delhi");

select *from students;
select name , marks from students;

#Where clause
select * 
from students 
where marks>60;

select * 
from students 
where city = "mumbai";

