use hello;

select *from students;

#order by  :  arrange in ascending order 
select *from students
order by city asc;

#AGGREGATE FUNCTIONS-> count(),max(),min(),sum(),avg()
select max(marks)
from students;
select min(marks)
from students;
select count(name)
from students;
select sum(marks)
from students;
select avg(marks)
from students;


