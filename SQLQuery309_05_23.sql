
select *
from customer_data..customer_address

-- we want to know if there is a duplicate in our data. To do this we look to investigate a column that is
-- meant to be unique. In this case, customer id is expected to be unique

select customer_id
from customer_data..customer_address

select distinct customer_id
from customer_data..customer_address


-- show you the customer_ids that have more than one occurrence in the table run 
SELECT customer_id, COUNT(*) as duplicate_count
FROM customer_data..customer_address
GROUP BY customer_id
HAVING COUNT(*) > 1;

--we can see that customer id returns 29 rows. However, with distinct, it returns 24 rows. implying the presence of duplicates

-- lets say we want to know the number of figures in our strings, we can double check this using the LENGTH function. An example

select country
from customer_data..customer_address
where len(country) > 2

-- now we want to use the substring function to correct the data.
-- The SUBSTRING() function in SQL is used to extract a substring (a portion of a string) from a given string.

select
customer_id
from
customer_data..customer_address
where SUBSTRING (country, 1, 2) = 'US'

-- add distinct to remove duplicates
select distinct customer_id
from
customer_data..customer_address
where SUBSTRING (country, 1, 2) = 'US'

-- use the trim funtion to remove empty spaces