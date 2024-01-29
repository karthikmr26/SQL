#two Partion By in customer purchase

select *,sum(cost_to_customer_per_qty)over(partition by product_id,market_date  order by market_date)
from `farmers_market.Customer_purchases`

## date Praseing 

## Add the date and time in single colm and name as date_time

select *,concat(market_date,' ',transaction_time) as date_time
from `farmers_market.Customer_purchases`

## change the formate of date and time Parse_datetime

select *,parse_datetime('%Y-%m-%d %H:%M:%S',concat(market_date,' ',transaction_time)) as date_time
from `farmers_market.Customer_purchases`

# to get the month from the Market_date-----%B(March)  & %b(Mar)

select *,format_datetime('%B',market_start_datetime)
from `farmers_market.Datetime_demo`

select *,format_datetime('%b',market_start_datetime)
from `farmers_market.Datetime_demo`

# to get the weekday from the Market_date-----%A(Sunday)  & %b(Sun)

select *,format_datetime('%A',market_start_datetime)
from `farmers_market.Datetime_demo`

select *,format_datetime('%a',market_start_datetime)
from `farmers_market.Datetime_demo`


##Find the number of days between the first and last market dates.

select date_diff(Last_day,first_day,day) as total_day
from
(select min(market_start_datetime) as first_day,max(market_start_datetime) as Last_day
from `farmers_market.Datetime_demo`)x

select date_diff(Last_day,first_day,year) as total_day
from
(select min(date(market_start_datetime)) as first_day,max(date(market_start_datetime)) as Last_day
from `farmers_market.Datetime_demo`)x

##Find the number of hours between the first and last market dates.

select timestamp_diff(Last_day,first_day,second) as total_day
from
(select min(market_start_datetime) as first_day,max(market_start_datetime) as Last_day
from `farmers_market.Datetime_demo`)x


# find the age

select date_diff(current_date(),'1993-09-26',year),date_diff(current_date(),'1993-09-26',month),date_diff(current_date(),'1993-09-26',day)


#If we wanted to also know how long it’s been since the customer last made a purchase?
select customer_id,date_diff(current_date(),max(market_date),day)
from `farmers_market.Customer_purchases`
group by 1

#HOW MANY CUSTOMERS MADE A PURCHASE IN LAST 30 DAYS FROM 2019-05-31

select distinct customer_id
from `farmers_market.Customer_purchases`
where date_diff('2019-05-31',market_date,day)<30



##Ad-hoc reporting
In the data analysis world, being asked questions, exploring a database, writing SQL statements to find and pull the data needed to determine the answers, and conducting the analysis of that
data to calculate the answers to the questions, is called ad-hoc reporting.
● In advanced SQL, we’ll take those skills to the next level and demonstrate how to think
through multiple analysis questions,
● simulate what it might be like to write queries to answer a question posed by a business
stakeholder.
● We’ll design and develop analytical datasets that can be used repeatedly to facilitate
ad-hoc reporting.

There are multiple ways to store queries (and the results of queries) for reuse in reports and other
analyses.
Here, we will cover two approaches for more easily querying from the results of custom dataset
queries you build:
1. Common Table Expressions
2. views.

##Common Table Expressions
● Common Table Expressions (CTEs) allow us to create temporary named results sets that
exist temporarily within the execution scope of SQL statements such as SELECT, INSERT,
UPDATE, DELETE, and MERGE.
● The WITH clause in SQL provides a better way to write the auxiliary/helper statement which
can be later used in larger queries.
● These statements are referred to as common table expressions which are nothing but
defining a temporary relational table to be used later in a SQL statement.
● The table is being called temporary because it exists only during the scope of the SQL
statement written after CTEs.
##syntax for CTEs is:
WITH [query_alias] AS (
[query]
),
[query_2_alias] AS (
[query_2]
)
SELECT [column list]
FROM [query_alias]
... [remainder of query that references aliases created above]
-> where “[query_alias]” is a placeholder for the name you want to use to refer to a query later,
and “[query]” is a placeholder for the query you want to reuse.

##Advantages of CTE:
● Making recursive query.
● Hold a query output virtually in a temporary area named as given while definition.
● No need to save Metadata.
● Useful when there is a need to do more operations on some query output.

##Recursive CTE
● Unlike a derived table, a CTE is a subquery that can be self-referencing using its own
name. It is also known as recursive CTE and can also be referenced multiple times in the
same query.
● It is defined by using the WITH RECURSIVE clause.
● A recursive CTE must contain a terminating condition.
● We will use the recursive CTE for series generation and traversal of hierarchical or
tree-structured data.
##● Syntax:
WITH RECURSIVE cte_name (column_names) AS ( subquery )
SELECT * FROM cte_name;

###Views
● Another approach to CTEs is Views.
● This involves storing the query as a database view.
● A view is treated just like a table in SQL, the only difference being that it has run when it’s
referenced to dynamically generate a result set (where a table stores the data instead of
storing the query),
● So queries that reference views can take longer to run than queries that reference tables.
● However, the view is retrieving the latest data from the underlying tables each time it is run,
so you are working with the freshest data available when you query from a view.
How it works!
Syntax:
● “CREATE VIEW [db_name.]view_name [(column_list)]
AS
select-statement; ”
● If you want to store your dataset as a view, you simply precede your SELECT statement
with replacing the bracketed statements with the actual schema name, and the name you
are giving the view


##What were the total sales at the market last week?
##How many of last week’s sales were made on Wednesdays versus on Saturdays?
##Can we calculate the total sales over another time period?
#Can we track the weekly market sales over time?
##Can we break down the weekly sales by a vendor?

with weekly_sales as(
SELECT cp.market_date,md.market_year,md.market_week,md.market_day,cp.vendor_id,v.vendor_name,v.vendor_type,
ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty),2) AS sales
FROM `farmers_market.Customer_purchases` AS cp
LEFT JOIN `farmers_market.Market_date_info` AS md
ON cp.market_date = md.market_date
LEFT JOIN `farmers_market.Vendor` AS v
ON cp.vendor_id = v.vendor_id
GROUP BY cp.market_date,md.market_year, md.market_week, md.market_day,cp.vendor_id,v.vendor_name, v.vendor_type
ORDER BY cp.market_date,md.market_year, md.market_week, md.market_day,cp.vendor_id,v.vendor_name, v.vendor_type)

select market_week,sum(sales) as total
from weekly_sales
group by 1



###Views

create view farmers_market.weekly_sales as(
SELECT cp.market_date,md.market_year,md.market_week,md.market_day,cp.vendor_id,v.vendor_name,v.vendor_type,
ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty),2) AS sales
FROM `farmers_market.Customer_purchases` AS cp
LEFT JOIN `farmers_market.Market_date_info` AS md
ON cp.market_date = md.market_date
LEFT JOIN `farmers_market.Vendor` AS v
ON cp.vendor_id = v.vendor_id
GROUP BY cp.market_date,md.market_year, md.market_week, md.market_day,cp.vendor_id,v.vendor_name, v.vendor_type
ORDER BY cp.market_date,md.market_year, md.market_week, md.market_day,cp.vendor_id,v.vendor_name, v.vendor_type)

select *
from `farmers_market.weekly_sales`
