-- Write query to return the email, first name, last name, & genre of all rock music listeners. return your list ordered alphabetically by 
-- email starting with A.
select distinct email, first_name, last_name from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in(select track_id from track
join genre on track.genre_id=genre.genre_id
where genre.name like 'Rock') order by email;

-- Let's invite the artists who have written the most rock music in our dataset. write a query that returns the Artist name and total track 
-- count of the top 10 rock bands.
SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album2 ON album2.album_id = track.album_id
JOIN artist ON artist.artist_id = album2.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id, artist.name
ORDER BY number_of_songs DESC
LIMIT 10;

-- Return all the track names that have a song length longer than the average song length. return the name and milliseconds for each track.
-- order by the song length with the longest songs listed first.
select name, milliseconds from track where milliseconds > 
(select AVG(milliseconds) as Avg_track_length from track)
order by milliseconds DESC;



