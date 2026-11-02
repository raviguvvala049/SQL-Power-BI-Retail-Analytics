
-- 1. Category-wise Total Sales
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY Category;


-- 2. Region-wise Total Sales
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY Region;


-- 3. Segment-wise Total Profit
SELECT
    Segment,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Segment;


-- 4. Year-wise Total Sales
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS sales_year,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY sales_year
ORDER BY sales_year;


-- 5. Categories with Sales Greater Than 100000
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY Category
HAVING SUM(Sales) > 100000;


-- 6. Regions with Profit Greater Than 50000
SELECT
    Region,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Region
HAVING SUM(Profit) > 50000;


-- 7. Customers with Total Sales Greater Than 10000
SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY `Customer Name`
HAVING SUM(Sales) > 10000
ORDER BY total_sales DESC;


-- 8. Products with Negative Total Profit
SELECT
    `Product Name`,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;
