
-- 1. Find Top 10 Products by Sales
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


-- 2. Find Top 5 Customers by Sales
SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 5;


-- 3. Find Orders with Sales Greater Than Average Sales
SELECT
    `Order ID`,
    Sales
FROM superstore
WHERE Sales > (
    SELECT AVG(Sales)
    FROM superstore
);


-- 4. Find Products with Below Average Profit
SELECT
    `Product Name`,
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore
GROUP BY `Product Name`
HAVING SUM(Profit) < (
    SELECT AVG(product_profit)
    FROM (
        SELECT SUM(Profit) AS product_profit
        FROM superstore
        GROUP BY `Product Name`
    ) AS product_summary
)
ORDER BY total_profit ASC;


-- 5. Calculate Category-wise Sales Ranking
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS sales_rank
FROM superstore
GROUP BY Category;


-- 6. Calculate Monthly Sales
SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
        '%Y-%m'
    ) AS sales_month,
    ROUND(SUM(Sales), 2) AS monthly_sales
FROM superstore
GROUP BY sales_month
ORDER BY sales_month;


-- 7. Find Duplicate Order IDs
SELECT
    `Order ID`,
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY `Order ID`
HAVING COUNT(*) > 1;


-- 8. Calculate Running Total of Monthly Sales
SELECT
    sales_month,
    monthly_sales,
    SUM(monthly_sales) OVER (
        ORDER BY sales_month
    ) AS running_total
FROM (
    SELECT
        DATE_FORMAT(
            STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
            '%Y-%m'
        ) AS sales_month,
        SUM(Sales) AS monthly_sales
    FROM superstore
    GROUP BY sales_month
) AS monthly_summary
ORDER BY sales_month;
