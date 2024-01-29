##To create the “demo_db” database 

CREATE DATABASE demo_db;

##To use the “demo_db” database -
USE demo_db;



USE karthik;

##To create a partitioned table, you need to specify the partitioning method and
define the partitions.

CREATE TABLE Sales 
(cust_id INT NOT NULL,
name VARCHAR(40),
store_id VARCHAR (20) NOT NULL,
bill_no INT NOT NULL,
bill_date DATE PRIMARY KEY NOT NULL,
amount DECIMAL (8,2) NOT NULL)

PARTITION BY RANGE (year(bill_date)) 
(partition p1 VALUES LESS THAN (2016),
partition p2 VALUES LESS THAN (2017),
partition p3 VALUES LESS THAN (2018),
partition p4 VALUES LESS THAN (2020));


##Inserting values into the partitioned table -
INSERT INTO Sales VALUES
(1, 'Mike', 'S001', 101, '2015-01-02', 125.56),
(2, 'Robert', 'S003', 103, '2015-01-25', 476.50),
(3, 'Peter', 'S012', 122, '2016-02-15', 335.00),
(4, 'Joseph', 'S345', 121, '2016-03-26', 787.00),
(5, 'Harry', 'S234', 132, '2017-04-19', 678.00),
(6, 'Stephen', 'S743', 111, '2017-05-31', 864.00),
(7, 'Jacson', 'S234', 115, '2018-06-11', 762.00),
(8, 'Smith', 'S012', 125, '2019-07-24', 300.00),
(9, 'Adam', 'S456', 119, '2019-08-02', 492.20);


select TABLE_NAME,PARTITION_NAME,TABLE_ROWS from information_schema.partitions
where table_schema='karthik' and table_name='sales';


##########(LIST Partition)
CREATE TABLE Stores_list (
cust_name VARCHAR(40),
bill_no VARCHAR (20) NOT NULL,
store_id INT PRIMARY KEY NOT NULL,
bill_date DATE NOT NULL,
amount DECIMAL(8,2) NOT NULL
)
PARTITION BY LIST(store_id) (
PARTITION PEast VALUES IN (101, 103, 105),
PARTITION PWest VALUES IN (102, 104, 106),
PARTITION pNorth VALUES IN (107, 109, 111),
PARTITION PSouth VALUES IN (108, 110, 112));

#########(Hash Partition)

###Creating a hash partitioned table -

CREATE TABLE Stores_hash (
cust_name VARCHAR(40),
bill_no VARCHAR (20) NOT NULL,
store_id INT PRIMARY KEY NOT NULL,
bill_date DATE NOT NULL,
amount DECIMAL(8,2) NOT NULL
)
PARTITION BY HASH(store_id)
PARTITIONS 4;


insert init table values(.......23,.....'GOA'..)

selct * from table where state ="goa"
selct * from table where state =23

########Indexes.
● Indexes are data structures in a database that provide quick access to specific data based on the values in one or more columns. They work
similarly to indexes in books, allowing you to find information more efficiently by referencing the index rather than scanning the entire
table.
● Creating indexes on frequently queried columns can significantly improve query performance. When a query includes conditions or joins
on indexed columns, the database can use the index to locate the relevant data more quickly, reducing the time required for query
execution.


#To create the “names” table -

CREATE TABLE `names` (
`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
`first_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
`last_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
PRIMARY KEY (`id`)
);
##Inserting records into the “names” table -

INSERT INTO names VALUES (1, 'shivank', 'agrawal');
INSERT INTO names VALUES (2, 'shiva', 'agrawal');
INSERT INTO names VALUES (3, 'shi', 'agrawal');
INSERT INTO names VALUES (4, 'sh', 'agrawal');
INSERT INTO names VALUES (5, 'shivank1', 'agrawal');
INSERT INTO names VALUES (6, 'shivank', 'agrawal');

##To view the “names” table -
SELECT * FROM names;

##Before creating an index -
EXPLAIN SELECT * FROM names WHERE first_name='shivank';

##Creating an index -
CREATE INDEX first_name_index ON names(first_name);

create index Karthik on names(first_name)

##After creating an index -
EXPLAIN SELECT * FROM names WHERE first_name='shivank';



###Functions
Functions in SQL allow you to encapsulate a set of SQL statements into a reusable code block. 
They can accept parameters and return values, providing flexibility and modularity to your SQL code.

Syntax:
CREATE FUNCTION func_name(parameter data_type)
RETURNS data_type
DECLARE variable_name data_type
BEGIN
SELECT…;
RETURN variable_name
END

##Now you can define your function.
Create function `add` (ip int)
Returns int
Deterministic
Begin
Declare op int;
Set op=ip+100;
Return op;
Return op;
End

##Function vs. Stored Procedure
● A function must return a value but in Stored Procedure it is optional.
Even a procedure can return zero or n values.
● Functions can have only input parameters for it whereas Procedures
can have input or output parameters.
● Functions can be called from Procedure whereas Procedures cannot be
called from a Function.
● The procedure allows SELECT as well as DML(INSERT/UPDATE/DELETE)
statement in it whereas Function allows only SELECT statement in it.
● Procedures cannot be utilized in a SELECT statement whereas Function
can be embedded in a SELECT statement.
● Stored Procedures cannot be used in the SQL statements anywhere in
the WHERE/HAVING/SELECT section whereas Function can be.

