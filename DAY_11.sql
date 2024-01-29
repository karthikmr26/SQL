#####WINDOWS/_Continue

3. Value Window Functions
● NTILE() - This function divide rows within a partition as equally as possible into n groups, and assigns each row its group number.
Group-------------ntile()

####Percentile

100 ntile means group 

##Divide the vendors based on price in 10 groups
select *,ntile(10)over(order by original_price) as A
from `farmers_market.Vendor_inventory`
order by A


##Create 2 groups for each product_id by quantity
select *,ntile(2)over(partition by product_id order by quantity)
from `farmers_market.Customer_purchases`
where product_id=4

select count(product_id)
from `farmers_market.Customer_purchases`
where product_id=4)A


● LEAD() - This function allows us to retrieve data from the next row of the current row
in the same result set.
Syntax: LEAD(expression, offset, default_value) OVER(PARTITION BY columns ORDER BY columns)

● LAG() - This function allows us to retrieve data from the preceding row of the current
row in the same result set.
Syntax: LAG(expression, offset, default_value) OVER(PARTITION BY columns ORDER BY columns)

Note: Both LEAD() and LAG() functions have similar syntax and take three arguments:
● the name of a column or an expression,
● the offset to be skipped below or above, and
● the default value to be returned if the stored value obtained from the row below is empty. It is specified only if you specify the second argument, the offset.

####Lead/Lag-------->Ahead/Behinde---------------consecutive

Lead(clm_name,1)over(order by)

##Using the vendor_booth_assignments table in the Farmer’s Market database, display each vendor’s booth assignment for each market_date alongside their previous booth assignments.
select *,lead(booth_number,1)over(partition by vendor_id order by market_date)
from `farmers_market.Vendor_booth_assignments`

##Let’s say you want to find out if the total sales on each market date are higher or lower than they were on the previous market date.
select *,lag(total,1)over(order by market_date)
from
(select market_date,sum(quantity*cost_to_customer_per_qty) as total
from `farmers_market.Customer_purchases`
group by 1
order by 1)A
order by market_date


● NTH_VALUE() : This function returns the value of a given expression from the Nth row of the window frame. If that Nth row does not exist, the function returns NULL.
The syntax of NTH_VALUE() function is given as:
NTH_VALUE(expression, N)
● FIRST_VALUE() : This window function returns the first value in an ordered partition of a result set.
● LASTVALUE() : This window function returns the first value in an ordered partition of a result set.
