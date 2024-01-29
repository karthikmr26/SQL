###Filtering Data in SQL


##Aliases
● SQL aliases are used to give a table, or a column in a table, a temporary name. It is doneusing AS clause.
● Syntax to give a temporary name to a table is :
FROM table_name AS alias_name

● Syntax to give a temporary name to a column is :
SELECT column_name AS alias_name

##Inline Calulation
to perform two clm calc and give a result in new clm

## To calculate the cost in Purchase table

1.All clm and cost values
select *,(quantity*cost_to_customer_per_qty) as cost
from `farmers_market.Customer_purchases`
order by cost desc

2.only cost
select (quantity*cost_to_customer_per_qty) as cost
from `farmers_market.Customer_purchases`
order by cost desc
 
## funtion in SQL
SQL funt is a piece of code that takes I/P that you give it performs some operation on those I/p and return a value

##ROUND() function
● This function rounds a number to a specified number of decimal places.
● Syntax: ROUND(number, decimals)

## To calculate the cost in Purchase table  and round funtion with 2 decimal
select round((quantity*cost_to_customer_per_qty),2) as cost
from `farmers_market.Customer_purchases`
order by cost desc
 
##CONCAT()--->Merge Tables
● It is used to concatenate two or more strings together.
● Syntax: CONCAT(string1, string2, string3, ….)

## We want to merge each customer’s name into a single column that contains the first name, then a space, and then the last name.
select concat(customer_first_name,' ',customer_last_name) as full_name
from `farmers_market.Customer`

##UPPER()
● This function takes a string as an argument and converts it into upper-case.
● Syntax: UPPER(string)
##LOWER() converts a string into lower-case.

## From the customer table get the full name of the customer in caps
select upper(concat(customer_first_name,' ',customer_last_name)) as full_name
from `farmers_market.Customer`
select lower(concat(customer_first_name,' ',customer_last_name)) as full_name
from `farmers_market.Customer`


##substring or camle case--->need the part of the string
substring(string,start,length)
substring(value, position [, length])---Len optional

## required the customer first name letter starts with caps and remaining all small 
select concat(upper(substring(customer_first_name,1,1)),lower(substring(customer_first_name,2)))
from `farmers_market.Customer`
## required the customer firstname and surname name initial
select concat(customer_first_name,' ',substring(customer_last_name,1,1))
from `farmers_market.Customer`


select
concat(upper(substring(customer_first_name,1,1)),substring(customer_first_name,2),' ',upper(substring(customer_last_name,1,1)),substring(customer_last_name,2))
from `farmers_market.Customer`

## initcap
or

select concat(initcap(customer_first_name),' ',initcap(customer_last_name)) as full_name
from farmers_market.Customer

##Filter
##WHERE
● The WHERE clause is used to filter the data based on one or more conditions.
● Multiple conditions are given for filtering using Boolean operators (AND, OR, etc).
● Syntax :
SELECT column1, column2, …
FROM table_name
WHERE condition

##BETWEEN
● BETWEEN keyword allows us to access the values within the specified range.
● It is a shorthand for >= AND <=.
● Syntax:
expression BETWEEN lower_value AND upper_value;

##IN operator
● IN operator is a shorthand for multiple OR conditions that allows you to specify multiple
values in a WHERE clause.
● Syntax:
WHERE column_name IN (value1, value2, ...)


where colour= "red" 
where colour=1
where colour!=1
where colour<>1
where colour in('red','black')
where colour not in('red','black')
where size<2,>,<=,>=
where size between 2 and 5--->inclusivive

#Extract all the product names that are part of product category 1
select *
from `farmers_market.product`
where product_category_id=1

#Extract all the product names execpt product category 1
select *
from `farmers_market.product`
where product_category_id!=1
select *
from `farmers_market.product`
where product_category_id<>1

#Print a report of everything the customer_id 4 has ever purchased at the market, sorted by date. Add total_amt column as well for each purchase.
select *,(quantity*cost_to_customer_per_qty) as Total_amt
from `farmers_market.Customer_purchases`
where customer_id=4
order by market_date

#Get all the product info for products with id between 3 and 8 (not inclusive) and of products with id 10.
select *
from `farmers_market.Customer_purchases`
where (product_id between 3 and 7) or product_id=10 

##Return a list of customers with the following last names: [Diaz, Edwards, Wilson]
select *
from `farmers_market.Customer`
where customer_last_name in ('Diaz','Edwards','Wilson')

##Find the booth assignments for vendor_id 7 for all dates between April 3, 2019 and May 16, 2019, including the 2 dates
select *
from `farmers_market.Vendor_booth_assignments`
where vendor_id=7 and market_date between '2019-04-03' and '2019-05-16'
