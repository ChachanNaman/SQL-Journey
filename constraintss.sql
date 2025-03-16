create database school;
use school;

create table students(
id int not null,
 name varchar(20) , 
 age int,
 primary key(id , age)     #i can combine to columns to make single primary key , soo combo of both should be unique 
 );

select *from students;

create table employe (
id int,
salary int default 2000
);

insert into employe (id) values (11);   #here default salary will be shown as 2000
select *from employe;
