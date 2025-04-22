CREATE DATABASE custdb;
USE custdb;

CREATE TABLE customers (
    custname VARCHAR(400), 
    creditlim DOUBLE
);

INSERT INTO customers (custname, creditlim) VALUES
('naman', 60000),
('krish', 7000),
('palak', 3000),
('harsh', 4000),
('aman', 55000),
('goat', 8000);

DELIMITER $$

create function cust_level(p_credlim double)
returns varchar(20)
deterministic 
begin
declare lvl varchar(50);
if p_credlim>5000 then
set lvl = 'platinum';
elseif p_credlim>=10000 then
set lvl = 'gold';
elseif p_credlim<10000 then
set lvl = 'silver';

end if;
return lvl;

end$$

DELIMITER ;

select custname , cust_level(creditlim)
from customers
order by custname;





