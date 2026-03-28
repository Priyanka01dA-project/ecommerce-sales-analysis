CREATE DATABASE ecommerce_db;
USE ecommerce_db;

SELECT * 
FROM ecommerce_data;

SHOW TABLES;

#total sales as revenue
select round(sum(Total_Price),3)
from ecommerce_data;

#total order
select count(*) as total_order
from ecommerce_data;

#total customer
select count(distinct Customer_ID) as total_customer
from ecommerce_data;

#sales by category
select category,
round(sum(Total_Price),2) as Revenue
from ecommerce_data
group by category
order by Revenue desc;

#sales by regions
Select region,
round(sum(Total_Price),2) as Revenue
from ecommerce_data
group by region;

#count of product and there revenue
select distinct Product_Name,count(*),
sum(Total_Price) as Revenue
from ecommerce_data
group by Product_Name;

#shipping status analysis
select Shipping_Status,count(*) as orders
from ecommerce_data
group by Shipping_Status;

#avg order value 
select round(avg(Total_Price),2) as avg_order_value
from ecommerce_data;

#return order
select Shipping_Status,count(*) as returned_orders
from ecommerce_data
where Shipping_Status="Returned";

#delivered order
select Shipping_Status,count(*) as Delivered_orders
from ecommerce_data
where Shipping_Status="Delivered";

#revenue by age_group
select
case
when age<30 then "young"
when age<40 then "adult"
else "senior"
end as age_group,
round(sum(Total_Price),2) as revenue
from ecommerce_data
group by age_group;

#tend by month
SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%d-%b-%Y')) AS month,
    ROUND(SUM(total_price),2) AS revenue
FROM ecommerce_data
GROUP BY month
ORDER BY MIN(STR_TO_DATE(order_date, '%d-%b-%Y'));

#trend by year
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%b-%Y')) AS YEAR,
    ROUND(SUM(total_price),2) AS revenue
FROM ecommerce_data
GROUP BY YEAR
ORDER BY MIN(STR_TO_DATE(order_date, '%d-%b-%Y'));

#top product
select Product_Name ,round(sum(total_price),2) as revenue
from ecommerce_data
group by Product_Name
order by revenue desc
limit 3;
