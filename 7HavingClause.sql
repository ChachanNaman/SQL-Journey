use hello;


select city , count(roll_no)
from students
group by city
having max(marks)>30;    #in where we cant use aggregate functions

