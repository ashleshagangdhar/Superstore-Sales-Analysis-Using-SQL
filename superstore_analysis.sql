CREATE DATABASE superstore_analysis;
USE superstore_analysis;
CREATE TABLE superstore (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
    );
DROP TABLE superstore;
SELECT COUNT(*) AS Total_Rows
FROM samplesuperstore;

-- 1.Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore;

-- 2.Top 10 Customers
SELECT `Customer Name`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore;

SELECT * FROM SampleSuperstore LIMIT 5;

-- 3.Sales By Category
SELECT Category,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore
GROUP BY Category;

-- 4.Sales By Region
SELECT Region,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore
GROUP BY Region;

-- 5.Sales By Segment
SELECT Segment,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore
GROUP BY Segment;

-- 6.Average Sales Per Order
SELECT ROUND(AVG(Sales),2) AS Avg_Sales
FROM SampleSuperstore;

-- 7.Top 5 States By Sales
SELECT State,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 5;

-- 8.Top 3 Customers Rank Wise
SELECT `Customer Name`,
       ROUND(SUM(Sales),2) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(Sales) DESC) AS Customer_Rank
FROM SampleSuperstore
GROUP BY `Customer Name`;

-- 9.. Top 5 Products Rank Wise
SELECT `Product Name`,
       ROUND(SUM(Sales),2) AS Total_Sales,
       DENSE_RANK() OVER (ORDER BY SUM(Sales) DESC) AS Product_Rank
FROM SampleSuperstore
GROUP BY `Product Name`;

-- 10.Number of Orders by Region
SELECT Region,
       COUNT(`Order ID`) AS Total_Orders
FROM SampleSuperstore
GROUP BY Region;

-- 11.Average Sales by Category
SELECT Category,
       ROUND(AVG(Sales),2) AS Avg_Sales
FROM SampleSuperstore
GROUP BY Category;

-- 12.Top Selling City
SELECT City,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

-- 13Sales Distribution by Ship Mode
SELECT `Ship Mode`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM SampleSuperstore
GROUP BY `Ship Mode`;

-- 14.Customer Count by Segment
SELECT Segment,
       COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM SampleSuperstore
GROUP BY Segment;