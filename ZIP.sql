create database www;
use www;
-- Write a stored function which will take customer number as input and
-- returns the city in which the customer lives. The attributes of customer and
-- zipcode are as follows,
-- • Customer (cno, cname, street, zip, phno)
-- • Zipcode (zip, city)

-- Create zipcode table first (since customer will reference it)
CREATE TABLE zipcode (
    zip VARCHAR(10) PRIMARY KEY,
    city VARCHAR(30) NOT NULL
);

-- Now create customer with zip as foreign key
CREATE TABLE customer (
    cno INT PRIMARY KEY,
    cname VARCHAR(100),
    street VARCHAR(100),
    zip VARCHAR(10),
    phno VARCHAR(15),
    FOREIGN KEY (zip) REFERENCES zipcode(zip)
);

-- Insert into zipcode first (parent table)
INSERT INTO zipcode (zip, city) VALUES 
('400001', 'Mumbai'),
('411001', 'Pune'),
('560001', 'Bangalore'),
('110001', 'Delhi'),
('700001', 'Kolkata');

-- Now insert into customer (child table)
INSERT INTO customer (cno, cname, street, zip, phno) VALUES 
(101, 'Ravi Shah', 'MG Road', '400001', '9876543210'),
(102, 'Priya Nair', 'FC Road', '411001', '9823456789'),
(103, 'Amit Gupta', 'Brigade Road', '560001', '9845671230'),
(104, 'Neha Mehta', 'Connaught Place', '110001', '9812345678'),
(105, 'Arjun Das', 'Park Street', '700001', '9834567890');

delimiter $$
create function yoyo (cnoo int)
returns varchar(30)
deterministic 
begin 
declare naam varchar(30);
select z.city into naam
from zipcode as z 
join customer as c on
c.zip = z.zip
WHERE c.cno = cnoo;

return naam;
end $$

delimiter ;

select c.*, yoyo(cno)
from customer as c ;








