--- Q1: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
--- Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals 

SELECT SUM(total) AS invoice_total, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC
LIMIT 1

--- Q2: Who is the best customer? The customer who has spent the most money will be declared the best customer.
--- Write a query that returns the person who has spent the most money.

SELECT 
CONCAT(customer.first_name, ' ', customer.last_name) AS full_name,
SUM(invoice.total) AS Max_amount
FROM customer
JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY Max_amount DESC;

--- Q3: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--- Return your list ordered alphabetically by email starting with A. 

SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;
--or you can use this, both work--
SELECT DISTINCT customer.first_name, customer.last_name, customer.email
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(SELECT track_id FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock' )
ORDER BY customer.email;


--- Q4: Let's invite the artists who have written the most rock music in our dataset. 
--- Write a query that returns the Artist name and total track count of the top 10 rock bands.

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

---- Q5: Return all the track names that have a song length longer than the average song length. 
--- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. 

SELECT name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;
--- OR YOU CAN USE THIS IF YOU WANT IN MINUTES AS WELL ---
SELECT AVG(milliseconds) AS avg_track_length, name, (SELECT AVG(milliseconds)/1000/60 AS Track_in_minutes)
FROM track
GROUP BY name
HAVING AVG(milliseconds) > 
    (SELECT AVG(milliseconds)
    FROM track)
ORDER BY AVG(milliseconds) DESC;


--- Q6: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent 

SELECT DISTINCT customer.first_name,customer.last_name,SUM(invoice_line.unit_price*invoice_line.quantity) AS expenditure,artist.name
FROM customer
JOIN invoice on customer.customer_id = invoice.customer_id
JOIN invoice_line on invoice.invoice_id = invoice_line.invoice_id
JOIN track on invoice_line.track_id = track.track_id
JOIN album on track.album_id = album.album_id
JOIN artist on album.artist_id = artist.artist_id
GROUP BY customer.first_name,customer.last_name,artist.name
ORDER BY expenditure DESC

