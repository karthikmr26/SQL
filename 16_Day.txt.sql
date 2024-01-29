create database karthik;
use karthik;

CREATE TABLE customers (
 ID INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(20) NOT NULL,
 last_name VARCHAR(20),
 age INT CHECK(age>=18),
 gender ENUM("M", "F"),
 phone_no CHAR(10) NOT NULL UNIQUE,
 email_id VARCHAR(30),
 dob DATE,
 address VARCHAR(100)
); 

alter table customers
add As_new varchar(10);


alter table customers
add As_new int;

alter table customers
add constraint  check (age in(0,1)) 


alter table customers
rename column ID to Cust_id

alter table customers
drop column address

alter table customers
modify As_new char(10);
modify email_id VARCHAR(10)

rename table customers to cust_info


INSERT INTO customers
VALUES
(101,'John','Doe',25,'M','8245639875','john@gmail.com','1998-05-10',1)

select * from karthik.customers
truncate table customers

update customers
set age=30
where age>=25

drop table cust_info

INSERT INTO customers
VALUES
(101, 'John', 'Doe', 25, 'M', '8245639875', 'john@gmail.com', '1998-05-10', 1),
(102, 'Jane', 'Smith', 32, 'F', '1098476253', 'jane@gmail.com', '1991-09-22', 1),
(103, 'David', 'Johnson', 42, 'M', '7562314098', 'david@yahoo.com', '1979-07-15', 0),
(104, 'Sarah', 'Williams', 28, 'F', '3089576124', 'sarah@gmail.com', '1995-12-03', 1),
(105, 'Michael', 'Brown', 37, 'M', '9650138742', 'michael@gmail.com', '1986-03-27', 1),
(106, 'Emily', 'Davis', 29, 'F', '4721398056', 'emily@yahoo.com', '1994-11-08',0),
(107, 'Daniel', 'Anderson', 31, 'M', '6214789305', 'daniel@gmail.com', '1992-08-19', 1),
(108, 'Olivia', 'Taylor', 24, 'F', '8356912074', 'olivia@gmail.com', '1999-02-14',1),
(109, 'Matthew', 'Wilson', 36, 'M', '2034957168', 'matthew@gmail.com','1987-09-01', 0),
(110, 'Sophia', 'Martin', 27, 'F', '5893642701', 'sophia@yahoo.com', '1996-06-12', 1);
