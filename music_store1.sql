select * from album;

-- Who is senior most employee based on job title ?
select * from employee order by levels desc limit 1;

-- Which countries have the most invoices ?
select count(*) as c, billing_country from invoice group by billing_country order by c desc;

-- What are top 3 values of total invoice ?
select total from invoice order by total desc limit 3;

-- Which city has the best customers? we would like to throw a promotional Music Festival in the city we made the most money. write a query 
-- that returns one city that has the highest sum of invoice totals. return both the city name & sum of all invoices totals.
select sum(total) as sum, billing_city from invoice group by billing_city order by sum desc;

-- Who is the best customer? the customer who has spent the most money will be declared the best customer. write a query that returns the 
-- person who has spent the most money.
SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) AS total
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total DESC
LIMIT 1;
