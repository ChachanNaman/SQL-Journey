create database iii;
use iii;

create table item(item_id int ,item_name varchar(30) ,item_type varchar(30) ,cost decimal(10,2));

INSERT INTO item VALUES (1, 'Rice', 'Grocery Item', 100);
INSERT INTO item VALUES (2, 'Cashews', 'Dry Fruits', 200);
INSERT INTO item VALUES (3, 'Frozen Corn', 'Frozen Vegetable', 150);

delimiter //
create procedure gstlagao()
begin

update item 
set cost = cost + (cost*0.00)
where item_type = 'Grocery Item';

update item 
set cost = cost + (cost*0.05)
where item_type = 'Dry Fruits';

update item 
set cost = cost + (cost*0.12)
where item_type = 'Frozen Vegetable';

end //

delimiter ;
SET SQL_SAFE_UPDATES = 0;
call gstlagao();

select *from item;
