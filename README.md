<h1> Project_Music_Store_Analysis </h1>
This project was focused on analyzing the music store dataset with SQL(Postgres) and help the store understand its business growth by answering relevant questions.


<h3> DATABASE AND TOOLS </h3>


* Postgre SQL


* PgAdmin


* Music store data ( _folder contains both xml and sql files_ )


<h3> BUSINESS QUESTIONS </h3>

Q1: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.

Q2: Who is the best customer? The customer who has spent the most money will be declared the best customer.
Write a query that returns the person who has spent the most money.

Q3: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A.

Q4: Let's invite the artists who have written the most rock music in our dataset.
Write a query that returns the Artist name and total track count of the top 10 rock bands.

Q5: Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. 

Q6: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent.


<h3> METHODOLOGY </h3>
(_Data cleaning was done beforehand via excel_)

* Pulled the dataset from 'Music_Store_database.sql' into Postgres to begin analysis. (_This is the cleaned dataset_)
* This was done by first creating a new database and then restoring the Music_Store_database.sql from there.
* Post that, analysis was done using different SQL queries, all of which are present in my 'Queries.sql' file

<h3> NOTES </h3>


* Schema played a big role in helping me out with the query formation, if you are attempting to use this to recreate or learn, please make use of it, especially for multiple JOINS.
* All in all a good practice.


**MY COMPLETE QUESTIONS AND ANSWERS(VIA SQL QUERY) ARE ATTACHED IN THE FILES NAMED 'Queries.sql', HERE ARE SOME SCREENGRABS TO HELP KEEP YOU ON THE RIGHT TRACK **


![Screenshot (28)](https://user-images.githubusercontent.com/131772248/235194757-974ecc57-926a-4f2c-a0b2-02f14b65dab9.png)
![Screenshot (26)](https://user-images.githubusercontent.com/131772248/235194771-ffdb18d0-c0a8-4411-8b82-237aa0d42b02.png)
![Screenshot (27)](https://user-images.githubusercontent.com/131772248/235194775-41c7506b-ef67-448f-b31c-f4ba5f23d901.png)
