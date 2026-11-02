-- 1. Calculate Total Sales
SELECT SUM(Sales) AS total_sales
FROM superstore;

-- 2. Calculate Total Profit
SELECT SUM(Profit) AS total_profit
FROM superstore;

-- 3. Calculate Average Sales
SELECT AVG(Sales) AS average_sales
FROM superstore;

-- 4. Find Minimum Sales
SELECT MIN(Sales) AS minimum_sales
FROM superstore;

-- 5. Find Maximum Sales
SELECT MAX(Sales) AS maximum_sales
FROM superstore;

-- 6. Count Total Records
SELECT COUNT(*) AS total_records
FROM superstore;

-- 7. Count Unique Customers
SELECT COUNT(DISTINCT `Customer ID`) AS unique_customers
FROM superstore;

-- 8. Calculate Average Profit
SELECT AVG(Profit) AS average_profit
FROM superstore;
