use hello;

#UPDATE : 

update students
set grade = "o"
where grade = "a";
#it will throw an error coz it's minor change and working on safe 
#to get out of safe mode we will write -> SET SQL_SAFE_UPDATES= 0;

SET SQL_SAFE_UPDATES= 0;

update students
set grade = "o"
where grade = "a";

update students
set marks = marks +1;

SELECT * FROM STUDENTS;

#DELETE : 

delete from students
where marks <20;

SELECT * FROM STUDENTS;






