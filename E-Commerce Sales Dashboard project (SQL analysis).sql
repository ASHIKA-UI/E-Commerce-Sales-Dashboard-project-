SELECT * FROM superstore.orders;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_clean.csv'
INTO TABLE superstore.orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM superstore.orders;

SELECT * FROM superstore.orders LIMIT 5;

SELECT category,
	ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore.orders
GROUP BY category
ORDER BY total_sales DESC;

SELECT region,
	ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore.orders
GROUP BY region
ORDER BY total_sales DESC;


SELECT order_year, order_month, order_month_name,
	ROUND(SUM(sales), 2) AS total_sales
FROM superstore.orders
GROUP BY order_year, order_month, order_month_name
ORDER BY order_year, order_month DESC;


SELECT
CASE 
WHEN discount = 0 THEN 'NO DISCOUNT'
WHEN discount <= 0.2 THEN 'LOW (0 - 20%)'
WHEN discount <= 0.4 THEN 'MEDIUM (20 - 40%)'
ELSE 'HIGH (40%+)'
END AS discount_band,
ROUND(AVG(profit_margin),2) AS  avg_profit_marigin
FROM superstore.orders
GROUP BY discount_band
ORDER BY avg_profit_marigin DESC;

SELECT product_name,
	ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore.orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;









