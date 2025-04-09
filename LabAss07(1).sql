create database ass7;
use ass7;

CREATE TABLE item (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    item_type VARCHAR(50),
    cost DECIMAL(10, 2)
);


INSERT INTO item VALUES (1, 'Rice', 'Grocery Item', 100);
INSERT INTO item VALUES (2, 'Cashews', 'Dry Fruits', 200);
INSERT INTO item VALUES (3, 'Frozen Corn', 'Frozen Vegetable', 150);

DELIMITER $$

CREATE PROCEDURE calculate_gst()
BEGIN
   
    UPDATE item
    SET cost = cost + (cost * 0.00)
    WHERE item_type = 'Grocery Item';

 
    UPDATE item
    SET cost = cost + (cost * 0.05)
    WHERE item_type = 'Dry Fruits';


    UPDATE item
    SET cost = cost + (cost * 0.12)
    WHERE item_type = 'Frozen Vegetable';
END$$

DELIMITER ;


CALL calculate_gst();

Select *from item; 

