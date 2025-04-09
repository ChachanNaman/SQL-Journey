CREATE DATABASE package;
USE package;


CREATE TABLE Customer (
    Cust_no INT PRIMARY KEY,
    name VARCHAR(100),
    Street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE Orders (
    Order_no INT PRIMARY KEY,
    Cust_no INT,
    bill_amount DECIMAL(10,2),
    Order_date DATE,
    Ship_date DATE,
    Tocity VARCHAR(50),
    ToState VARCHAR(50),
    ToZip VARCHAR(10),
    FOREIGN KEY (Cust_no) REFERENCES Customer(Cust_no)
);

CREATE TABLE Stock (
    Stock_no INT PRIMARY KEY,
    price DECIMAL(10,2),
    tax DECIMAL(5,2)
);

CREATE TABLE Contains (
    Order_no INT,
    Stock_no INT,
    quantity INT,
    Discount DECIMAL(5,2),
    FOREIGN KEY (Order_no) REFERENCES Orders(Order_no),
    FOREIGN KEY (Stock_no) REFERENCES Stock(Stock_no)
);


INSERT INTO Customer VALUES (1, 'Naman', 'CBI Phatak', 'Jaipur', 'RJ');

INSERT INTO Orders VALUES 
(101, 1, 0.00, '2025-05-09', '2025-05-11', 'Delhi', 'DL', '400001');

INSERT INTO Stock VALUES 
(1, 100.00, 10.00), 
(2, 200.00, 5.00);

INSERT INTO Contains VALUES 
(101, 1, 2, 5.00), 
(101, 2, 1, 10.00);


DELIMITER $$

CREATE FUNCTION get_total_cost(orderId INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(
        (price + (price * tax / 100)) 
        * quantity 
        * (1 - Discount / 100)
    )
    INTO total
    FROM Contains
    JOIN Stock ON Contains.Stock_no = Stock.Stock_no
    WHERE Order_no = orderId;

    RETURN total;
END$$

DELIMITER ;

SELECT get_total_cost(101) AS Total_Cost;
