create database pizzahut;

USE pizzahut;

create table pizzahut.pizzasale(
pizza_id int not null,
order_id int not null,
pizza_name_id varchar(80),
quantity int  not null,
order_date varchar(50) not null,
order_time time not null,
unit_price float not null,
total_price float not null,
pizza_size text not null,
pizza_category text not null,
pizza_ingredients text not null,
pizza_name text not null,
primary key (pizza_id));


describe pizzahut.pizzasale;

ALTER TABLE pizzasale ADD (orderdate DATE);
UPDATE pizzasale SET orderdate = STR_TO_DATE(order_date,'%d-%m-%Y');
ALTER TABLE pizzasale DROP order_date;
ALTER TABLE pizzasale RENAME COLUMN orderdate to order_date;

SELECT * FROM pizzasale;
-- Total Revenue
SELECT SUM(total_price) AS total_revenue
FROM pizzasale;

-- AVERAGE ORDER VALUE
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS avg_order_value
FROM pizzasale;

-- TOTAL PIZZA SOLD
SELECT SUM(quantity) AS total_pizza_sold
FROM pizzasale;

-- TOTAL ORDER PLACED
SELECT COUNT(DISTINCT order_id) AS total_order_placed
FROM pizzasale;

-- Average Pizzas per Order
SELECT ROUND(SUM(quantity)/COUNT(DISTINCT order_id),2) AS avg_pizza_per_order
FROM pizzasale;

-- Daily trend for total orders
SELECT dayname(order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders
FROM pizzasale
GROUP BY dayname(order_date) ;

-- Hourly trend for total orders
SELECT * FROM pizzasale;
SELECT HOUR(order_time) AS order_hours,COUNT(DISTINCT order_id) AS total_orders
FROM pizzasale
GROUP BY HOUR(order_time) ;

-- Monthly trend for total orders
SELECT monthname(order_date) AS order_month,COUNT(DISTINCT order_id) AS total_orders
FROM pizzasale
GROUP BY monthname(order_date)
ORDER BY total_orders;

-- Percentage of sales by pizza category
SELECT pizza_category,SUM(total_price) AS total_sales,ROUND(SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizzasale),2) AS PCT
FROM pizzasale 
GROUP BY pizza_category;

-- For the month of january
SELECT pizza_category,SUM(total_price) AS total_sales,SUM(total_price) * 100/ 
(SELECT SUM(total_price) FROM pizzasale WHERE month(order_date) = 1 ) AS PCT
FROM pizzasale
WHERE month(order_date) = 1 
GROUP BY pizza_category;

-- For quarter
SELECT pizza_category,SUM(total_price) AS total_sales,SUM(total_price) * 100/ 
(SELECT SUM(total_price) FROM pizzasale WHERE quarter(order_date)) AS PCT
FROM pizzasale
WHERE quarter(order_date)
GROUP BY pizza_category;

-- Percentage of sales by pizza size
SELECT pizza_size,ROUND(SUM(total_price),2) AS total_sales,ROUND(SUM(total_price) * 100/ 
(SELECT SUM(total_price) FROM pizzasale),2) AS PCT
FROM pizzasale
GROUP BY pizza_size
ORDER BY PCT DESC;

-- Top 5 best sellers by revenue,total qantity, and total orders
SELECT * FROM pizzasale;
SELECT pizza_name,ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasale
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT pizza_name,ROUND(SUM(quantity),2) AS total_quatity
FROM pizzasale
GROUP BY pizza_name
ORDER BY total_quatity DESC
LIMIT 5;

SELECT pizza_name,ROUND(COUNT(DISTINCT order_id),2) AS total_orders
FROM pizzasale
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;


-- Bottom 5 best sellers by revenue,total qantity, and total orders
SELECT pizza_name,ROUND(SUM(total_price),2) AS total_revenue
FROM pizzasale
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

SELECT pizza_name,ROUND(SUM(quantity),2) AS total_quantity
FROM pizzasale
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

SELECT pizza_name,ROUND(COUNT(DISTINCT order_id),2) AS total_orders
FROM pizzasale
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;

