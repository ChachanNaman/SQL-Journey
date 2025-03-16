use hello;

#GROUP BY -> group the rows that have same values 
#generally we use aggregate functions for this

select grade
from students
group by grade;   #group by grades

select grade , count(roll_no)      group by grades and gives column of count in each grade area
from students
group by grade;

#when writing more than 1 thing in select then it should be in group by also 
select grade , marks ,  count(roll_no)      #group by grades and gives column of count in each grade area
from students
group by grade ,marks;

#used both order by, group by
select city ,avg(marks)      #group by grades and gives column of count in each grade area
from students
group by city
order by city;
