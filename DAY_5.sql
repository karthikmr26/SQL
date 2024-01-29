##Group By and Aggregation

## find the customer who not done any purchase till now
select customer_first_name
from `farmers_market.Customer`
where customer_id not in (select distinct customer_id
from `farmers_market.Customer_purchases`);


####Conditional Statement
##IF:
● The IF() function returns a value if the condition is TRUE and another value if the condition is FALSE.
● The IF() function can return values that can be either numeric or strings dependingupon the context in which the function is used.
● The IF() function accepts one parameter which is the condition to be evaluated.
Syntax:
IF(condition, true_value, false_value)

##If the QNT>5"high","Low"
select *,if(quantity>5,"High",'Low') as Level
from `farmers_market.Customer_purchases`

##revenue >15 good or bad
select *,if ((quantity*cost_to_customer_per_qty)>15,'Good_order','Bad_order') as Order_state
from `farmers_market.Customer_purchases`

##Replacing the orginall NULL as medium
select *,if(product_size is null,'Medium',product_size) as NULL_Medium
from `farmers_market.product`
or
select *,ifnull(product_size,'Medium') as NULL_Medium
from `farmers_market.product`

##Replacing the empty as medium
select *,if(trim(product_size)='','Medium',product_size) as NULL_Medium
from `farmers_market.product`


##IFNULL:
● The IFNULL function specifies a value other than a null that is returned to your application when a null is encountered.
● The IFNULL() function is specified as follows: IFNULL(v1,v2)
● If the value of the first argument is not null, IFNULL returns the value of the first argument. If the first argument evaluates to a null, IFNULL returns the second argument.

##CASE and WHEN
● The CASE statement in SQL handles if/then logic.
● The CASE statement is followed by at least one pair of WHEN and THEN statements and finally an ELSE clause.
● The CASE expression goes through conditions and returns a value when the first condition is met. Once a condition is true, it will stop reading and return the result. If no conditions are
true, it returns the value in the ELSE clause.
● Syntax:
CASE
WHEN condition1 THEN result1
:
WHEN conditionN THEN resultN
ELSE result
END AS [new_column_name];

##revenue >15 good or bad using case_when
select *,case when (quantity*cost_to_customer_per_qty)>15 then 'Good_order' else 'Bad_order' end as Order_state
from `farmers_market.Customer_purchases`

##Put the total cost to customer purchases into bins of -
● under $5.00,
● $5.00–$9.99,
● $10.00–$19.99, or
● $20.00 and over.

select *,case when (quantity*cost_to_customer_per_qty)<5 then '$5.00'
when (quantity*cost_to_customer_per_qty) between 5 and 10 then '$5.00–$9.99'
when (quantity*cost_to_customer_per_qty) between 11 and 20 then '$10.00–$19.99'
else '20.00' end as Bins
from `farmers_market.Customer_purchases`