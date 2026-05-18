--                                         START                                                            -- 

-- Create Database --
create database sql_project;
show databases;
use sql_project;

-- creating a table --
create table retail_sales (transactions_id int ,
sale_date date ,
sale_time time ,
customer_id int ,
gender varchar(50) ,
age int ,
category varchar(50),
quantiy int ,
price_per_unit float,
cogs float ,total_sale int );

show tables;

-- check the data has null values or not --
select*from retail_sales;
explain select*from retail_sales;

select*from retail_sales
where sale_date is null;

select*from retail_sales
where sale_time is null;

select*from retail_sales
where customer_id is null;

select*from retail_sales
where gender is null;

select*from retail_sales
where age is null;

select*from retail_sales
where category is null;

select*from retail_sales
where quantiy is null;

alter table retail_sales
change column quantiy  quantity int;

select*from retail_sales
where quantity is null;

select*from retail_sales
where price_per_unit is null;

select*from retail_sales
where cogs is null;

select*from retail_sales;

-- how many sales we have --
select count(*) as total_sales from 
retail_sales;

-- how many customers we have --
select count(distinct(customer_id)) as unique_customers 
from retail_sales;

 -- unique category --
 select distinct(category) as unique_category
 from retail_sales;
 
-- DATA ANALYSIS AND BUISSNESS KEY PROBLEMS --
-- Q1. retrive all columns mode on 2022-11-05 --
select*from retail_sales where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select*from retail_sales where category = 'Clothing' and quantity>=4 and sale_date between '2022-11-01' and '2022-11-30';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.--
select category , sum(total_sale) as total_sales ,
count(*) as total_order from 
retail_sales group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category --
select round(avg(age),2) as avg_age from retail_sales where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.--
select*from retail_sales where total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender,category ,count(transactions_id) as total_numeber_of_transaction from
retail_sales group by gender,category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year--
select sale_date,avg(total_sale) as avg_sale from retail_sales group by
 sale_date order by
 avg_sale desc limit 1;
 
 -- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales --
 select customer_id , sum(total_sale) as total_sales from retail_sales
 group by customer_id order by total_sales desc limit 5;
 
 -- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.--
 select count(distinct(customer_id)) ,category from retail_sales
 group by category;
 
 -- Q.10 Best selling category --
 select category , sum(quantity) as total_quantity ,sum(total_sale) as total_sales  from retail_sales
 group by category 
 order by total_quantity , total_sales desc limit 1;

----------------------------------------  END  -------------------------------------------------------------