##Joins 3 continued

##SELF JOIN
● In this type of join, we join a table to itself

##CROSS JOIN
● CROSS JOIN returns all possible combinations of rows from the left and right tables.

##finding emp slary > than Manager salary 

select emp_id
from empee
where salary>=
(select salary
from employee
where emp_id=
(select  distinct manager id from employee ))


EMP table and Manager table
select E.emp_id,EMP.salary from E,m.salary fom M
from employee E
inner join employee  M
on E.Manager_id=M.emp_id
where emp.salary>mgr.salary


##Get a list of the customers who made purchases on each market date.
##Find out the customers WHO have deleted their account from the market.
####UNION
select C.customer_id,'New_Cust' as Type
from `farmers_market.Customer` C 
left join `farmers_market.Customer_purchases` CP
on C.customer_id=CP.customer_id
where CP.customer_id is null
union distinct
select CP.customer_id,'Del_Cust' as Type
from `farmers_market.Customer_purchases` CP
left join `farmers_market.Customer` C 
on C.customer_id=CP.customer_id
where C.customer_id is null
#########FULL
select C.customer_id as New_Cust,CP.customer_id as Del_Cust
from `farmers_market.Customer` C 
full join `farmers_market.Customer_purchases` CP
on C.customer_id=CP.customer_id
where CP.customer_id is null or C.customer_id is null


###Cross Join

Team
RCB
CSK
MI

Homegames and awaygame

select P.team as H_G,I.team as A_G
from IPL I----------------------------------------------------------------->from IPL I, IPL P
cross join IPL P
where P.team !=I.team

