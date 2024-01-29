##Extracting data using SQL

## There are different types of SQL commands:

○ DML (Data manipulation language)--->View access to the data---->Data Analyst
Insert,update,delete
○ DDL (Data definition language)--->Edit access to the data---->Sql Developer
Create,Alter,drop,Truncate
○ DCL (Data control language)---> access to the data---->DataBase Admin
Grand,Revoke
○ TCL (Transaction control language)--->Update the core data Structure ---->Data Engineer or Developer
commit,rollback,save
○ DQL (Data Query language)--->View access to the data---->Data Analyst
Select

##Keys: which says that what relationship between the two or more clm in the table

Primary key: no dupilcate,without null values 
A primary key is a field in a table which uniquely identifies each row/record in a database table. must contain unique values and  cannot have NULL values.

Unique Key: no dupilcate,with null values many

Foreign Key: It should be a primary key in some other table
It is a column or a combination of columns whose values match a Primary Key in a different table.It is a column used to link two tables together. 

Candidate Key:Combination of two clm to get an unique key.

##Relationships:Symbol used to define the relationship between the schema tables.1 table can have multiple releationship.
 
##Types of relationships in RDBMS
There are three types of relationships that can be present between tables:
● One-to-one relationship occurs when each row in table 1 has only one related row in table 2.
Child----|-- Parent  or Cutomer Id---------------------||--Bank Acc No

● One-to-many occurs when one record in table 1 is related to one or more records in table 2.
    Parent --||-----------|<-------Child
● Many-to-many occurs when multiple records in one table are related to multiple records in another table.
--->|------|<-------

###Coding
SQL query syntax
SELECT [columns to return]
FROM [table name]
WHERE [conditional statement]
ORDER BY [columns to sort on]
LIMIT [no. of first n rows to be returned]

Data In the Table:dataset_name.tabele_name
Select * from farmers_market.customer---MySQL
Select * from `farmers_market.customer`----BigQuery

To display all clm i an table:Select *
To display specific clm in a table:Select custustomer_id

##OFFSET 
 clause is used to find a starting point to display a set of rows as a final output by eliminating a set of records from a given table in order.
 OFFSET [no_of_rows_to_skip]
##LIMIT as:
LIMIT [no_of_first_n_rows_to_be_returned] 



##Limit first 10 rows

Select * from farmers_market.customer
limit 10

##To sort the data in ASC(Default) or DES

Select * from farmers_market.customer
order by customer_last_name desc,customer_first_name desc
limit 10

##To sort the data in ASC(Default) or DES

Select * from farmers_market.customer
order by customer_last_name desc,customer_first_name desc
limit 10


## Display the quantity of the first 10 in purchase

Select * from farmers_market.customer_purchases
order by quantity desc
limit 5


##To display only my send highest quantity
Select * from farmers_market.customer_purchases
order by quantity desc
limit 1
offset 2




##: Extract the third-highest and fourth-highest salaries from the following employees
table
Solution query:

SELECT salary
FROM employees
ORDER BY salary desc
LIMIT 2 OFFSET 2
