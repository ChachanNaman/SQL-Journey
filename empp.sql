create database jj;
use jj;

create table employee(
emp_name varchar(20) primary key ,
street varchar(20), 
city varchar(20));

create table company(
comp_name varchar(20) primary key, 
city varchar(20));

create table works(
emp_name varchar(20) ,
comp_name varchar(20)  ,
salary int ,
primary key(emp_name , comp_name),
foreign key (emp_name) references employee(emp_name), 
foreign key (comp_name) references company(comp_name));

CREATE TABLE manages (
    emp_name VARCHAR(50),
    manager_name VARCHAR(50),
    FOREIGN KEY (emp_name) REFERENCES employee(emp_name),
    FOREIGN KEY (manager_name) REFERENCES employee(emp_name)
);

select *
from emp
where comp_name = 'first_bank';

select * 
from emp 
where not comp_name

select comp_name , count(*) as emp_count
from works
group by comp_name
order by emp_count desc

select comp_name 
from company
where in (select comp_name 
from company
where comp_name = 'small');

select *
from employee as a 
inner join works as w 
on a.emp_name = w.emp_name 
where w.salary>10000

update works
set salary = salary +(salary*0.10)
where comp_name = 'first';

select emp_name , street ,city
from employee as e
join works as w
on e.emp_name = w.emp_name
where w.comp_name = 'jdjdd' AND w.salary>10000


