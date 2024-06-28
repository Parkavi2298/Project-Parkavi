--Task 4
--1.Database Creation
CREATE DATABASE Sales_database;

CREATE TABLE sales_sample ( 
    Product_Id INTEGER, 
    Region VARCHAR (50), 
    Date DATE, 
    Sales_amount NUMERIC 
);

--2.Data creation
INSERT INTO Sales_sample (Product_Id,Region,Date,Sales_Amount) 
VALUES  
(1001,'East','01-JUN-2024',2500), 
(1002,'West','02-JUN-2024',1750), 
(1003,'North','03-JUN-2024',1500), 
(1004,'South','04-JUN-2024',500), 
(1005,'West','05-JUN-2024',275), 
(1006,'East','06-JUN-2024',1550), 
(1007,'South','07-JUN-2024',3000), 
(1008,'East','08-JUN-2024',2000), 
(1009,'West','09-JUN-2024',4000), 
(1010,'North','10-JUN-2024',2300);

--3.Perform OLAP operations
--3.a
SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_sales 
FROM sales_sample 
GROUP BY Region, Product_Id 
ORDER BY Region, Product_Id;

--3.b
SELECT Product_Id, Region, SUM(Sales_Amount) AS Total_sales 
FROM sales_sample 
GROUP BY Product_Id, Region 
ORDER BY Product_Id, Region;

--3.c
SELECT s.Product_Id, s.Region, s.Date, SUM(s.Sales_Amount) AS Total_sales 
FROM Sales_sample s
GROUP BY ROLLUP(s.Region,s.Product_Id,s.Date);

--3.d
SELECT * 
FROM sales_sample 
WHERE Region = 'West' 
AND DATE BETWEEN '01-JUN-2024' AND '10-JUN-2024';

--3.e
SELECT * 
FROM sales_sample 
WHERE Product_Id = '1001'
AND Region = 'East' 
AND DATE = '01-JUN-2024';