create database hellooo;
use hellooo;

CREATE TABLE employee (
    emp_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100)
);

CREATE TABLE works (
    company VARCHAR(100),
    emp_name VARCHAR(100),
    salary DECIMAL(10, 2)
);

CREATE TABLE company (
    company_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE manager (
    emp_name VARCHAR(100),
    manager_name VARCHAR(100)
);

-- Inserting data into employee table
INSERT INTO employee VALUES ('John', 'Mumbai', 'Maharashtra');
INSERT INTO employee VALUES ('Deepak', 'Delhi', 'Delhi');
INSERT INTO employee VALUES ('Alice', 'Bangalore', 'Karnataka');
INSERT INTO employee VALUES ('Bob', 'Pune', 'Maharashtra');
-- Add more employees if needed

-- Inserting data into works table
INSERT INTO works VALUES ('ABC Corporation', 'John', 60000);
INSERT INTO works VALUES ('XYZ Pvt Ltd', 'Deepak', 55000);
INSERT INTO works VALUES ('ABC Corporation', 'Alice', 70000);
INSERT INTO works VALUES ('ABC Corporation', 'Bob', 50000);
-- Add more work records if needed

-- Inserting data into company table
INSERT INTO company VALUES ('ABC Corporation', 'Mumbai');
INSERT INTO company VALUES ('XYZ Pvt Ltd', 'Delhi');
-- Add more companies if needed

-- Inserting data into manager table
INSERT INTO manager VALUES ('John', 'Mike');
INSERT INTO manager VALUES ('Deepak', 'Sara');

-- Add more managers if needed

select *from company;

select e.emp_name
from employee as e
join works as w
on e.emp_name = w.emp_name 
where w.salary>(select avg(salary) from works);

update employee
set city = 'Pune'
where emp_name = 'Deepak';

select *from employee;

update works
set salary = salary+(salary*0.20)
where company = 'XYZ Pvt Ltd';

select *from works;





