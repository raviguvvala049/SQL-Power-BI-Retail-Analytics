
-- 1. Region-wise Sales Performance
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;


-- 2. Category-wise Sales and Profit
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;


-- 3. Top 10 Customers by Sales
SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;


-- 4. Top 10 Products by Profit
SELECT
    `Product Name`,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;


-- 5. Loss-Making Products
SELECT
    `Product Name`,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;


-- 6. Year-wise Sales Analysis
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS sales_year,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY sales_year
ORDER BY sales_year;


-- 7. Monthly Sales Analysis
SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
        '%Y-%m'
    ) AS sales_month,
    ROUND(SUM(Sales), 2) AS monthly_sales
FROM superstore
GROUP BY sales_month
ORDER BY sales_month;


-- 8. Overall Business Performance
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS profit_margin_percentage,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS total_customers
FROM superstore;


-- 9. Segment-wise Business Performance
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY Segment
ORDER BY total_sales DESC;


-- 10. Ship Mode Analysis
SELECT
    `Ship Mode`,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY `Ship Mode`
ORDER BY total_sales DESC;
