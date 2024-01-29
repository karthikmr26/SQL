##DATE_TIME_Funtion

##DATE and Time functions
1. STR_TO_DATE()
● This function converts the string value to date or time or DateTime values.
● Syntax: STR_TO_DATE(string, format)
● The string of percent signs and letters in single quotes at the end is an input
parameter that tells the function how the date and time are formatted.
● %Y is a 4-digit year,
● %m is a 2-digit month,
● %d is a 2-digit day,
● %h is the hour,
● %i represents the minutes, and
● %p indicates there is an AM/PM

2. EXTRACT()
● The EXTRACT() function is used to extract a part from a given date.
● Syntax: EXTRACT(part FROM date)
Example: Given the date_time_demo table. From each market_start_datetime, extract the
following:
● day of the week,
● month of year,
● year,
● hour and
● minute from the timestamp

3. DATE_ADD()/DATE_SUB()
● The DATE_ADD/DATE_SUB() function add/subtracts a time/date interval from a date
and then returns the date respectively.
● Syntax: DATE_SUB(date, INTERVAL value interval)
DATE_ADD(date, INTERVAL value interval)
● Example: SELECT DATE_SUB("2019-06-14", INTERVAL 10 DAY);
○ The above query will subtract 10 days from the date 2019-06-14 and return
the date. i.e. 2019-06-04.

4. DATEDIFF()
● The DATEDIFF() function returns the number of days between two date values.
● Syntax: DATEDIFF(date1, date2)
● Example: SELECT DATEDIFF("2019-01-01", "2016-12-24");
○ Return the number of days between two dates 2019-01-01 and 2016-12-24.
i.e. 738

5. CURDATE()
● The CURDATE() function returns the current date.
● The date is returned as "YYYY-MM-DD" (string) or as YYYYMMDD (numeric).


###Date

##########################################################################################3
#DATE and TIME


##############from the date need to get the month 
select *,extract(month from market_date) as MONTH
from `farmers_market.Market_date_info`


##############from the date need to get the year
select *,extract(year from market_date) as Year
from `farmers_market.Market_date_info`

##############from the date need to get the day
select *,extract(day from market_date) as DAY
from `farmers_market.Market_date_info`


##############from the date need to get the month,year and DAY
select *,extract(month from market_date) as MONTH,extract(year from market_date) as Year,extract(day from market_date) as DAY
from `farmers_market.Market_date_info`






##############to find the weekday
select *,extract(dayofweek from market_date) as Weekday
from `farmers_market.Market_date_info`

##############to find the week
select *,extract(week from market_date) as Week
from `farmers_market.Market_date_info`


##############to find the Quarter
select *,extract(quarter from market_date) as Quater
from `farmers_market.Market_date_info`


##############to find the hours
select *,extract(hour from market_start_datetime) as Hours
from `farmers_market.Datetime_demo`

##############to find the MINutes
select *,extract(minute from market_start_datetime) as MINs
from `farmers_market.Datetime_demo`

##############in date and time how to get only date 
select *,date(market_start_datetime) as Dates,time(market_start_datetime) as times
from `farmers_market.Datetime_demo`


##############Need to add 30 min to the table timing
select *,date_add(market_start_datetime,interval 30 minute) as Dates,
from `farmers_market.Datetime_demo`


##############Need to add 1 day to the table timing
select *,date_add(market_start_datetime,interval 1 day) as Dates,time_
from `farmers_market.Datetime_demo`


##############Need to add 1 month to the table timing
select *,date_add(market_start_datetime,interval 31 day) as Dates,
from `farmers_market.Datetime_demo`

##############Need to add 1 month to the table timing
select *, date(market_start_datetime) as Dates
from `farmers_market.Datetime_demo`