Select *
from pizzasales_db;

-- Total Revenue 
Select sum(total_price) 
As Total_Revenue
From pizzasales_db;

-- Average Order Value
Select Sum(total_price) / count(distinct order_id)
As Avg_Order_Value
from pizzasales_db;

-- Total Pizzas Sold
Select sum(quantity)
As Total_Pizzas_Sold
from pizzasales_db;

-- Total Orders
Select count(distinct order_id)
As Total_Orders
from pizzasales_db;

-- Average Pizzas Per Order
Select Sum(quantity) / count(distinct order_id)
As Avg_Pizzas_Per_Order
from pizzasales_db;

-- Percentage of Sales by Pizza Category
Select pizza_category,  Cast(sum(total_price) As decimal(10,2)) as Total_Sales, 
Cast(sum(total_price) * 100 / (Select sum(total_price) 
from pizzasales_db) As Decimal (10,2)) As Percentage_of_total_sales
from pizzasales_db 
Group by pizza_category

-- Percentage of Sales by Pizza Size
Select pizza_size,  Cast(sum(total_price) As Decimal(10,2)) as Total_Sales, 
Cast(sum(total_price) * 100 / (Select sum(total_price) 
from pizzasales_db) As Decimal(10,2)) As Percentage_of_total_sales
from pizzasales_db 
Group by pizza_size
Order by Percentage_of_total_sales DESC

-- Top 5 Pizza by Revenue 
Select pizza_name, Sum(total_price) As Total_Revenue
from pizzasales_db
Group by pizza_name
Order by Total_Revenue DESC
limit 5;

-- Bottom 5 Pizza by Revenue 
Select pizza_name, Sum(total_price) As Total_Revenue
from pizzasales_db
Group by pizza_name
Order by Total_Revenue ASC
limit 5;

-- Top 5 Pizza by Quantity Sold
Select pizza_name, Sum(quantity) As Total_quantity
from pizzasales_db
Group by pizza_name
Order by Total_quantity desc
limit 5

-- Bottom 5 Pizza by Quantity Sold
Select pizza_name, Sum(quantity) As Total_quantity
from pizzasales_db
Group by pizza_name
Order by Total_quantity asc
limit 5

-- Top 5 Pizza by Distinct Orders 
Select pizza_name, count(distinct order_id) As Total_Orders
from pizzasales_db
Group by pizza_name
Order by Total_Orders desc
limit 5

-- Bottom 5 Pizza by Distinct Orders
Select pizza_name, count(distinct order_id) As Total_Orders
from pizzasales_db
Group by pizza_name
Order by Total_Orders asc
limit 5
