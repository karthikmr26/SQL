##Subqueries

LIKE clause---->Partial Match
● The LIKE clause is used to compare a value to similar values using wildcard operators.
● There are two kinds of wildcard operators in SQL:
○ % sign stands for any number of characters including none.
○ _ sign stands for only one character.
● For example,
○ “a%” represents a string starting with “a”.
○ “%a” represents a string which ends with “a”.
○ “a_b%” represents a string starting with a and having one character between “a” and
“b”


%y%---Word y
y%---start with y
%y----End with y
where lower(name) like %y

###need to get the first name start with B
select *
from `farmers_market.Customer`
where lower(customer_first_name) like 'b%'

###need to get the first name end with i
select *
from `farmers_market.Customer`
where lower(customer_first_name) like '%i'

###need to get the first name start with J end with a
select *
from `farmers_market.Customer`
where lower(customer_first_name) like 'j%a'

##Distinct  ----Unique value to return
select distinct(product_id)
from `farmers_market.Customer_purchases`

##Your manager wants to see all the unique customer IDs present in the customer_purchases table. How would you get this data?
select distinct(customer_id)
from `farmers_market.Customer_purchases`

##IS NULL
● The IS NULL condition is used in SQL to test for a NULL value. It returns TRUE if a NULL
value is found, otherwise returns FALSE.
● Syntax: expression IS NULL

empty->space is null>actuall null

## remove  null in tables
select *
from `farmers_market.product`
where product_size is not null


## remove  empty cell in tables
select *
from `farmers_market.product`
where trim(product_size) =''


##Subqueries--->nested query
● A Subquery is a query within a query.It provides data to the enclosing query.
● Syntax:
SELECT column_name
FROM table_name
WHERE column_name expression operator
( SELECT COLUMN_NAME from TABLE_NAME WHERE ... );

##Analyze purchases made at the market on days when it rained.

select *
from `farmers_market.Customer_purchases`
where market_date in (select market_date
from `farmers_market.Market_date_info`
where market_rain_flag=1)

