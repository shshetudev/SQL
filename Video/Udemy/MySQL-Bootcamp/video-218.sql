#Many to Many relationship

CREATE TABLE reviewers(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100)
);

CREATE TABLE series(
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100),
released_year YEAR(4),
genre VARCHAR(100)
);

DROP TABLE reviews;
#Total numbers: 2 digit and after decimal: 1
CREATE TABLE reviews(
id INT AUTO_INCREMENT PRIMARY KEY,
rating decim`reviews`al(2,1), 
series_id INT,
reviewer_id INT,
FOREIGN KEY(series_id) REFERENCES series(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(reviewer_id) REFERENCES reviewers(id) ON DELETE CASCADE ON UPDATE CASCADE
);

#Data input to: series
INSERT INTO series(title,released_year,genre) VALUES
('Archer',2009,'Animation'),
('Arrested Development',2003,'comedy'),
("Bob's Burgers",2011,'Animation'),
('BoJack Horsman',2014,'Animation'),
('Curb Your Enthusiasm',2000,'Comedy'),
("Fargo",2014,'Drama'),
('Freaks and Geeks',1999,'Comedy'),
('General Hospital',1963,'Drama'),
('Halt and Catch Fire',2014,'Drama'),
('Malcolm in The Middle',2000,'Comedy'),
('Pushing Daisies',2007,'Comedy'),
('Seinfeld',1989,'Comedy'),
('Stranger Things',2016,'Drama')
;

#Data input to: reviewers
INSERT INTO reviewers(first_name,last_name) VALUES
('Thomas','Stoneman'),
('Wyatt','Skaggs'),
('Kimbra','Masters'),
('Domingo','Cortes'),
('Colt','Steele'),
('Pinkie','Petit'),
('Marlon','Crafford')
;

SELECT * FROM reviewers;
DESC review`reviewers`s;
SELECT * FROM reviews;
SELECT * FROM series;

	#Challenge-1
#Query-1
SELECT title,rating FROM series JOIN
reviews ON series.id = reviews.`series_id`;

#Challenge-2
#Query-2
SELECT title,AVG(IFNULL(rating,0)) AS avg_rating FROM series JOIN
reviews ON series.id = reviews.`series_id`
GROUP BY series.`id`
ORDER BY avg_rating
;

#Challenge-3
SELECT reviewers.`first_name`,reviewers.`last_name`,reviews.`rating` FROM reviewers
JOIN reviews ON reviewers.id = reviews.`reviewer_id`;

#Challenge-4
SELECT title AS unreviewd_series FROM series 
LEFT JOIN 
reviews ON series.id = reviews.`series_id`
WHERE rating IS NULL;

#Challenge-5
#genre,avg_rating
SELECT series.`genre` AS genre, ROUND(
AVG(IFNULL(reviews.`rating`,0)),2
) AS avg_rating FROM series
JOIN reviews ON series.`id` = reviews.`series_id`
GROUP BY genre;

#Challenge-6
#first_name,last_name,count,min,max,avg,status-> active,inactive
#if(count(rating)>0,'ACTIVE','INACTIVE') as status
SELECT first_name,last_name,COUNT(rating) AS 'count',MIN(IFNULL(rating,0)) AS 'min', MAX(IFNULL(rating,0)) AS 'max',
AVG(IFNULL(rating,0)) AS AVG, 
CASE 
WHEN COUNT(rating)>0 THEN 'ACTIVE'
ELSE 'INACTIVE'
END AS STATUS  FROM reviewers  
LEFT JOIN reviews ON reviewers.`id` = reviews.`reviewer_id`

GROUP BY reviewers.`first_name`;


#Challenge-7
SELECT s.title AS title,r.rating,CONCAT(re.first_name," ",re.last_name) AS reviewer
FROM reviewers re 
INNER JOIN reviews r ON (re.`id` = r.`reviewer_id`)
INNER JOIN series s ON (s.id = r.`series_id`)
;






