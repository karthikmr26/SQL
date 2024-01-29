##Intro to Aggregation and Group by

Aggregation  Funtion
min,max,avg,sum,count

Most-MAX
Least-MIN

##We want to get the most and least expensive items available in the vendor’s inventory.
select min(original_price) as Least,Max(original_price) as Most
from `farmers_market.Vendor_inventory`

##count(clm_name)--not count nulls
##count(*)--count null
##count(distinct(clm_name))--Unique Values

###it will not count the Null values
select count(product_size)
from `farmers_market.product`

##It will count the null values
select count(*)
from `farmers_market.product`

##it will count the null,empty as unique 
select count(distinct product_size)
from `farmers_market.product`

##GROUP BY
● GROUP BY groups together rows that have the same values in specified columns. It
computes summaries (aggregated measures) for each group using the aggregate functions.
● Syntax:
SELECT [column_1], [column_2],
COUNT() AS [column_name]
SUM() AS [column_name]
FROM [table_name]
WHERE [condition]
GROUP BY [column_1], [column_2];

## total _quantity of each product

select product_id,sum(quantity*cost_to_customer_per_qty) as total_quantity
from `farmers_market.Customer_purchases`
group by 1
order by 1

##Get a list of the customers who made purchases on each market date.
select market_date,count(customer_id)
from `farmers_market.Customer_purchases`
group by 1


##Calculate the total quantity purchased by each customer per market_date.
select market_date,customer_id,count(market_date)
from `farmers_market.Customer_purchases`
group by 1,2
