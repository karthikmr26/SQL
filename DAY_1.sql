##Intro to Databases & BigQuery Setup

## SQL:Sturutured Query Language (It is the standard language which run the query on the sturutured data)(Set of insturution)
and  allows us to interact with relational databases in order to store, manipulate and retrieve the data in databases

##Relational Database
● It is a collection of interrelated tables. The data within these tables have relationships with one another. 
Example: Microsoft SQL Server, MySQL, etc.
● A relational database is structured.

##Non-relational Database
● It is a kind of database that doesn’t use tables, fields, and columns structured data.
Example: MongoDB, Apache Cassandra, etc.
● A non-relational database is semi-structured or unstructured..

##Database which have multiple tables 

##DBMS:Database management system it provide an interface to perform various operation like storing data,DB creation,Updating and creating table in the DB
codeing :SQL Words:10

##RDBMS Relational database:store the date in the form of tables and they co-related with one dB to other other DB to provide the o/p

##ERD : Entity relationship diagram ->schema with strutured diagram of all the tables or the design of the blueprint.

## Data type:three main types of datatypes in RDBMS: Numeric, string and date and time.

String datatype
● CHAR(n): A fixed length string of size n.
● VARCHAR(n): A variable length string with a maximum length n.

Numeric datatypes
● INTEGER(size)/INT(size): A medium integer.
● FLOAT(): A floating point number.

Date and Time Data Types
● DATE : date having format: YYYY-MM-DD.
● DATETIME: date and time combination having format: YYYY-MM-DD hh:mm:ss.
● TIME: time format: hh:mm:ss

##To get the data_type in Big Query 
SELECT *
FROM scaler-dsml-sql-393208.Ecommerce.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'customers'

##To get the data_type in My_SQL
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'farmers_market' and table_name = 'market_date_info'

Select *
from farmers_market.customer
where customer_first_name=char(5)

##Keys: which says that what relationship between the two or more clm in the table

Primary key: no dupilcate,without null values 
A primary key is a field in a table which uniquely identifies each row/record in a database table. must contain unique values and  cannot have NULL values.

Unique Key: no dupilcate,with null values many

Foreign Key: It should be a primary key in some other table
It is a column or a combination of columns whose values match a Primary Key in a different table.It is a column used to link two tables together. 