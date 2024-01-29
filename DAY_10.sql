##Window Functions

1. Aggregate Window Functions
● SUM(), MIN(),MAX(), COUNT(),AVG()

2. Ranking Window Functions
● ROW_NUMBER()  RANK() DENSE_RANK() 

3. Value Window Functions
● LEAD()  LAG()  NTILE() 
Some more window functions:
● NTH_VALUE()  FIRST_VALUE() LASTVALUE() 


##Window functions---------------------->retain the entire table + table output----Windows 
● Window functions are used to perform some operation on a group of rows and provide a resultant value for each row in the table.They compute their result based on a sliding
window frame, a set of rows that are somehow related to the current row.
● OVER clause is used with window functions to define the window.
● GROUP BY collapses the individual records into groups. i.e. after using GROUP BY, you cannot refer to any individual field because it is collapsed.
● However, Window functions do not collapse individual records and the row-level information is intact in the partitions. Thus, we can create queries showing data from the
individual record together with the result of the window function.

Syntax
SELECT<column_1>,<column_2>,<window_function>() OVER (PARTITION BY < column_to_partition_by >ORDER BY < column_to_order_by ><window_frame>) AS <window_column_alias>
FROM <table_name>;

PARTITION BY
● It divides the rows into multiple groups, called partitions, to which the window function is applied.
● With no PARTITION BY clause, the entire result set is the partition.

FOPO-FUNTION OVER PARTION BY ORDER BY


## FO---->Funtion OVer============Table + One value in all the row of agg funtion
select *,sum(quantity)over()
from `farmers_market.Customer_purchases`

## FOP---->Funtion OVer Partition============Table + output of group by 
select *,sum(quantity)over(partition by product_id)
from `farmers_market.Customer_purchases`

###Cumulative Sum or Running total------------FOO------>Funtion over order by-----Running total
select *,sum(quantity)over(order by transaction_time)
from `farmers_market.Customer_purchases`
order by 

#FOPO----->Table +group By +running total
select *,sum(quantity)over(partition by product_id order by transaction_time)
from `farmers_market.Customer_purchases`
order by product_id

1. Aggregate Window Functions
● SUM()
● MIN()
● MAX()
● COUNT()
● AVG()

2. Ranking Window Functions
● ROW_NUMBER() - This function assigns a unique number to each row in the table.
● RANK() - This function is used to assign a value to the records in the table, and it can be the same for two or more records having the same values (lies within the
same partition). It also skips ranks if the records are the same.
● DENSE_RANK() - This function assigns a unique rank to the records in the table. It is similar to the RANK() function but it doesn't skip ranks if two or more records have
the same ranks.

####FOO-------MIN for Rank Funtion
#Rank------------>It skip the values
select *,rank()over(order by quantity)
from `farmers_market.Vendor_inventory`
order by quantity


#Dense_Rank--Mostly USed-------->NO Skip 
select *,dense_rank()over(order by quantity)
from `farmers_market.Vendor_inventory`
order by quantity

#Row_Numbers----------->Sequense no
select *,row_number()over(order by quantity)
from `farmers_market.Vendor_inventory`
order by quantity

#Interview_QUES
select *
from(select *,dense_rank()over(partition by dep_id order by salary desc) as R
from EMP)A
where R=2

3. Value Window Functions
● LEAD() - This function allows us to retrieve data from the next row of the current row
in the same result set.
Syntax: LEAD(expression, offset, default_value) OVER(PARTITION
BY columns ORDER BY columns)
● LAG() - This function allows us to retrieve data from the preceding row of the current
row in the same result set.
Syntax: LAG(expression, offset, default_value) OVER(PARTITION BY
columns ORDER BY columns)
Note: Both LEAD() and LAG() functions have similar syntax and take three arguments:
● the name of a column or an expression,
● the offset to be skipped below or above, and
● the default value to be returned if the stored value obtained from the row
below is empty. It is specified only if you specify the second argument, the
offset.
● NTILE() - This function divide rows within a partition as equally as possible into n
groups, and assigns each row its group number.

Some more window functions:
● NTH_VALUE() : This function returns the value of a given expression from the Nth row of the window frame. If that Nth row does not exist, the function returns NULL.
The syntax of NTH_VALUE() function is given as:
NTH_VALUE(expression, N)
● FIRST_VALUE() : This window function returns the first value in an ordered partition of a result set.
● LASTVALUE() : This window function returns the first value in an ordered partition of a result set.




























Window frame
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


Execution order in SQL
1. FROM 
2. WHERE 
3. GROUP BY 
4. Aggregate functions 
5. HAVING 
6. Window functions
7. SELECT 
8. DISTINCT
9. UNION/INTERSECT/EXCEPT 
10.ORDER BY 
11. OFFSET
12.LIMIT/FETCH/TOP 


