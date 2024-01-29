##Date and Time Functions


Window frame----------->Restricting the no of rows------Adjusting the frame
● Window frame is a set of rows that are somehow related to the current row.
● The window frame is evaluated individually within each partition.
● Syntax for window frame is:
ROWS | RANGE BETWEEN lower_bound AND upper_bound

● The bounds (lower_bound, upper_bound) can be any of the follwing five options:
○ UNBOUNDED PRECEDING---------B/W unbounded Preceding & current row
○ n PRECEDING-----------------B/W n Preceding & current row
○ CURRENT ROW-----------------B/W current row and current row 
○ n FOLLOWING-----------------B/W current row and n following
○ UNBOUNDED FOLLOWING---------B/W current row and unbounded following


###date when made the highest sales

select *,nth_value(market_date,3)over(partition by order by sales desc) as high
from(select market_date,sum(quantity*cost_to_customer_per_qty) as sales
from `farmers_market.Customer_purchases`
group by 1
order by 1) A
order by market_date


###date when made the firth value or last

select *,last_value(market_date)over(order by sales desc) as high
from(select market_date,sum(quantity*cost_to_customer_per_qty) as sales
from `farmers_market.Customer_purchases`
group by 1
order by 1) A
order by market_date

##Highest sale values

select *,nth_value(sales,1)over(order by sales desc) as H_S
from(select market_date,sum(quantity*cost_to_customer_per_qty) as sales
from `farmers_market.Customer_purchases`
group by 1
order by 1) A


##last 3 days running total


select *,sum(sales)over(order by market_date) as R_T
from(select market_date,sum(quantity*cost_to_customer_per_qty) as sales
from `farmers_market.Customer_purchases`
group by 1
order by 1) A


select *,sum(sales)over(order by market_date rows between 3 preceding and current row) as R_T
from(select market_date,sum(quantity*cost_to_customer_per_qty) as sales
from `farmers_market.Customer_purchases`
group by 1
order by 1) A
order by market_date


##7days moving avg in sales


select *,avg(sales)over(order by market_date rows between 6 preceding and current row) as R_T
from(select market_date,sum(quantity*cost_to_customer_per_qty) as sales
from `farmers_market.Customer_purchases`
group by 1
order by 1) A
order by market_date
