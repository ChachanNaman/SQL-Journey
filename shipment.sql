CREATE DATABASE product_ship;
USE product_ship;

CREATE TABLE CUSTOMER (
    CUST_ID INT PRIMARY KEY,
    CUST_NAME VARCHAR(50),
    ANNUAL_REVENUE DECIMAL(15, 2),
    CUST_TYPE ENUM('manufacturer', 'wholesaler', 'retailer')
);

CREATE TABLE TRUCK (
    TRUCK_NO INT PRIMARY KEY,
    DRIVER_NAME VARCHAR(50)
);

CREATE TABLE CITY (
    CITY_NAME VARCHAR(50) PRIMARY KEY,
    POPULATION INT
);

CREATE TABLE SHIPMENT (
    SHIPMENT_NO INT PRIMARY KEY,
    CUST_ID INT,
    WEIGHT DECIMAL(10, 2),
    TRUCK_NO INT,
    DESTINATION VARCHAR(50),
    SHIP_DATE DATE,
    FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID),
    FOREIGN KEY (TRUCK_NO) REFERENCES TRUCK(TRUCK_NO),
    FOREIGN KEY (DESTINATION) REFERENCES CITY(CITY_NAME)
);
INSERT INTO CUSTOMER VALUES
(301, 'Acme Corp', 12000000.00, 'manufacturer'),
(302, 'QuickTrade', 9000000.00, 'wholesaler'),
(303, 'RetailPro', 5000000.00, 'retailer'),
(311, 'MegaBuild', 15000000.00, 'manufacturer');

INSERT INTO TRUCK VALUES
(1, 'Jake Stinson'),
(2, 'Jensen'),
(3, 'Emily Ray');

INSERT INTO CITY VALUES
('Denver', 750000),
('St. Louis', 300000),
('Chicago', 2700000),
('New York', 8500000);

INSERT INTO SHIPMENT VALUES
(501, 301, 150.0, 1, 'Denver', '2024-05-10'),
(502, 302, 75.0, 2, 'St. Louis', '2024-05-12'),
(503, 303, 120.0, 2, 'Chicago', '2024-05-14'),
(504, 311, 100.0, 1, 'New York', '2024-05-15'),
(505, 311, 130.0, 3, 'Chicago', '2024-05-16'),
(506, 301, 90.0, 1, 'Denver', '2024-05-17');

select t.DRIVER_NAME 
from TRUCK as t
where TRUCK_NO in (select TRUCK_NO from SHIPMENT where WEIGHT > 100);

select CUST_NAME, ANNUAL_REVENUE 
from CUSTOMER
where CUST_ID in (select CUST_ID from SHIPMENT where WEIGHT > 100);

select CUST_NAME, ANNUAL_REVENUE 
from CUSTOMER
where CUST_ID in (select CUST_ID from SHIPMENT where TRUCK_NO in (select TRUCK_NO from TRUCK where DRIVER_NAME= 'Jensen'));

select CUST_NAME 
from CUSTOMER 
where CUST_TYPE = 'manufacturer'
or
CUST_ID in (select CUST_ID  from SHIPMENT where  DESTINATION = 'St. Louis');

SELECT TRUCK_NO
FROM TRUCK
WHERE DRIVER_NAME = 'Jake Stinson'
  AND TRUCK_NO NOT IN (
      SELECT TRUCK_NO FROM SHIPMENT WHERE DESTINATION = 'Denver'
  );
  
  