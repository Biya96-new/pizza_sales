This project was done to analyse the sales of pizza over a period of time. So that the company can decide,what changes are to be brought about in order to improve the sales.
MYSQL was used to query the required data and a interactive Power BI dash board was craeted.

A problems was encountered while loading the data on MYSQL due to the data type issue of date column.It was not getting imported even after creating the table and specifying the data type.So after a research got to know that the data can be imported in properly if the date data type was kept as varchar and later on the following steps were followed to change it to date data type:
1.https://stackoverflow.com/questions/8163079/importing-a-csv-to-mysql-with-different-date-format
2.https://www.w3schools.com/sql/sql_alter.asp

KPI’s Requirement:
1.	Total Revenue:The sum of the total price of all the pizza orders.
2.	Average Order Value: The average amount spent per order,calculated by dividing the total revenue by total number of orders.
3.	Total Pizzas Sold: The sum of the quantities of pizza sold
4.	Total Orders: The total number of orders placed.
5.	Average Pizzas per Order: The average number of pizzas sold per order,calculated by dividing the total number of pizzas sold by the total number of orders.

Charts Requirement
1.	Daily Trend for Total Orders: Create a bar chart that display the daily trend of total orders over a specific period.
2.	Monthly trend for Daily Orders: Create a line chart that illustrates  the hourly trend of total orders throughout the day.
3.	Percentage of Sale by Pizza Category: Create a pie chart that shows the distribution of sales across different pizza category.
4.	Percentage of Sales by Pizza Size: Generate a pie chart that reperesents the percentage of sales attribute to different pizza sales.
5.	Total Pizzas Sold by Pizza Category: Create a funnel chart that represents the total number of pizzas sold for each category.
6.	Top 5 Best Sellers by Revenue,Total Quantity and Total Orders: Create a bar chart highlighting the Top 5 selling pizza based on revenue,Total Quantity,Total Orders.This chart will help us find the most sold pizza.	
7.	Bottom 5 Best Sellers by revenue,Total Quantity and Total Orders: Create a bar chart highlighting the Bottom 5 worst-selling pizza based on revenue,Total Quantity,Total Orders.This chart will help us find the least sold pizza.

This dash board helped to get an insight about the bussiest days and times of sale,the category of pizza that is sold the most,amount of sales with respect to every month or day,the variety of pizza which contributes to maximum and minimum sales with respect to revenue,quantity and total orders.

