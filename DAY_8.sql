##Joins continued


90%------------->PF - FK

PK to PK
PK to FK


Left --PK
Righ---FK
inner 90%
left (only when a condition us mentioned)

##Get a list of customers' zip codes for customers who made a purchase on 2019-04-06


select *
from `farmers_market.Customer` C 
inner join `farmers_market.Customer_purchases` C_P 
on C.customer_id=C_P.customer_id
where C_P.market_date='2019-04-06'

##Find out the customers who are either new to the market


select *
from `farmers_market.Customer` c 
left join `farmers_market.Customer_purchases` cp
on c.customer_id=cp.customer_id
where cp.customer_id is null


select customer_id
from `farmers_market.Customer_purchases`
where customer_id  not in (select distinct customer_id
from `farmers_market.Customer`)


##Find out the customers WHO have deleted their account from the market.

select *
from `farmers_market.Customer_purchases` cp
left join `farmers_market.Customer` c
on c.customer_id=cp.customer_id
where c.customer_id is null

##we want details about all farmer’s market booths and every vendor booth assignment for every market date.


select *
from `farmers_market.Vendor_booth_assignments`

select *
from `farmers_market.Booth`

select *
from `farmers_market.Vendor`


select *
from `farmers_market.Vendor` V
inner join `farmers_market.Vendor_booth_assignments` VBA
on V.vendor_id=VBA.vendor_id
inner join `farmers_market.Booth` B
on B.booth_number=VBA.booth_number
