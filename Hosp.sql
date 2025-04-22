create database hosp;
use hosp;

create table disease(
disid int primary key,
disname varchar(100));

create table patient(
patid int primary key, 
patname varchar(100),
disid int ,
foreign key (disid) references disease(disid));

INSERT INTO disease VALUES 
(1, 'Flu'),
(2, 'COVID-19'),
(3, 'Malaria');

INSERT INTO patient VALUES 
(101, 'John Doe', 1),
(102, 'Alice Smith', 2),
(103, 'Bob Lee', 3);

select *from disease, patient;

DELIMITER $$

CREATE FUNCTION getdisname(pat_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE dis_name VARCHAR(100);

    SELECT d.disname
    INTO dis_name
    FROM disease d
    JOIN patient p ON d.disid = p.disid
    WHERE p.patid = pat_id;

    RETURN dis_name;
END $$

DELIMITER ;


select getdisname(102) as diss;
select getdisname(101) as diss;
select getdisname(103) as diss;
SELECT @@sql_mode;
SET GLOBAL sql_mode='';
SHOW FUNCTION STATUS WHERE Db = 'hosp';

SELECT getdisname(101) AS diss;
SELECT getdisname(102) AS diss;
SELECT getdisname(103) AS diss;