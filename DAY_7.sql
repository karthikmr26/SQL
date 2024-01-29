##Group by & agg cont & Intro to join

#Where 
Applied after from clause
Applied on all column in from statement


#having 
applied after group by
It is applied only on the AGG funtion


##HAVING clause
● WHERE keyword fails when we use it with the aggregate expressions like COUNT(),MAX(), AVG(), etc along with the grouping.
● HAVING clause is used to filter the results obtained by the GROUP BY clause based on some specific conditions.
● In a query, the HAVING clause is placed after the GROUP BY clause and before the ORDER BY clause.
● Syntax:
SELECT column1, column2,....,columnN
FROM tableName
WHERE [conditions]
GROUP BY column1
HAVING [conditons]
ORDER BY column_name

##Find the average amount spent on each market day. We want to consider only those days where the number of purchases were more than 3
select market_date,avg(quantity*cost_to_customer_per_qty) as Avg
from `farmers_market.Customer_purchases`
group by 1
having count(*)>3

##how many iteams vendor id purchased
select vendor_id,sum(quantity) as total
from `farmers_market.Vendor_inventory`
group by 1

##Filter out vendors who brought at least 100 items from the farmer’s market over the period - 2019-05-02 and 2019-05-16.
select vendor_id,Sum(quantity) as Min_c
from `farmers_market.Vendor_inventory`
where market_date between '2019-05-02' and '2019-05-16'
group by 1
having Min_c>=100

##JOINS
● JOINS are used to combine the data from two tables. It combines rows with equal values for the specified columns.
● The JOIN condition is the equality between the primary key column in one table and columns referring to them in the other table.

##Types of JOIN
● There are the following types of JOINS:
1. INNER JOIN
2. OUTER JOIN/Full
3. LEFT JOIN
4. RIGHT JOIN
5. SELF JOIN
6. CROSS JOIN

##INNER JOIN/join---->common column,matching values
● The INNER JOIN joins two tables based on a common column and selects rows that have matching values in these columns.


##LEFT JOIN----->Left colm
● LEFT JOIN returns all rows from the left table with matching rows from the right table. Rows without a match are filled with NULLs.

##RIGHT JOIN---->Right Colm
● RIGHT JOIN returns all rows from the right table with matching rows from the left table. Rows without a match are filled with NULLs.
● It is similar to the LEFT JOIN, the only difference is that we are considering all the rows on right table instead of left table.

##OUTER JOIN (FULL JOIN)
● FULL JOIN returns all rows from the left table and all rows from the right table. It fills the non-matching rows with NULLs.
● There is no direct way in MYSQL to perform the outer join. Thus, we perform it using a combination of other join types such as LEFT JOIN ad RIGHT JOIN.
● We first use LEFT JOIN and RIGHT JOIN on the tables and then use UNION to combine the results and remove the duplicate rows.


##UNION
● UNION combines the results of two result sets and removes duplicates.
● UNION ALL doesn't remove duplicate rows.


## Join
from ()------>Left table
inner/left/right/full/cross/---------->Right table
on 1.PK=2.PK