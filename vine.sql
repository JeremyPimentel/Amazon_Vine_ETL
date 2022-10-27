-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

CREATE TABLE vine_table_2 (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);


INSERT INTO vine_table_2
SELECT * FROM vine_table
WHERE total_votes >= 20;


CREATE TABLE vine_table_3 (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

INSERT INTO vine_table_3
SELECT * FROM vine_table
WHERE total_votes >= 20 AND
CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

CREATE TABLE vine_table_4 (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

INSERT INTO vine_table_4
SELECT * FROM vine_table
WHERE vine = 'Y';

SELECT * FROM vine_table_4;

CREATE TABLE vine_table_5 (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

INSERT INTO vine_table_5
SELECT * FROM vine_table
WHERE vine = 'N';

SELECT * FROM vine_table_5;

DROP TABLE vine_table_6;
CREATE TABLE vine_table_6 (
  total_reviews INTEGER,
  total_5_star_ratings INTEGER,
  percentage_5_star_reviews_paid INTEGER,
  percentage_5_star_reviews_unpaid INTEGER
);

CREATE TABLE total_reviews(
total_reviews INTEGER);


INSERT INTO total_reviews
SELECT COUNT(review_id)
FROM vine_table;
SELECT * FROM total_reviews;


CREATE TABLE total_5_reviews(
total_5_star_reviews INTEGER);

INSERT INTO total_5_reviews
SELECT COUNT(star_rating)
FROM vine_table
WHERE star_rating = 5;
SELECT * FROM total_5_reviews;


CREATE TABLE total_paid_5_reviews(
total_5_reviews_paid INTEGER);

INSERT INTO total_paid_5_reviews
SELECT COUNT(star_rating)
FROM vine_table
WHERE (star_rating = 5 AND
vine = 'Y');
SELECT * FROM total_paid_5_reviews;


SELECT CAST(total_5_reviews_paid AS FLOAT)*100 AS percent_five_star
FROM total_paid_5_reviews/

SELECT
CAST(total_5_star_reviews AS FLOAT) *100 AS percent_five_star
FROM total_5_reviews;


-- CAST(total_5_reivews_paid AS FLOAT)/
-- CAST(total_5_star_reviews AS FLOAT)*100 AS percent_five_star;



 
SELECT * FROM total_paid_5_reviews;
SELECT * FROM total_5_reviews;

SELECT * FROM vine_table_6;





SELECT
	CAST(
		COUNT(star_rating) filter (where star_rating = 5 AND vine = 'Y') as float
	) 
	/
	cast( COUNT(star_rating) filter (where star_rating = 5) as float
	)
	*100
from vine_table;


SELECT
	CAST(
		COUNT(star_rating) filter (where star_rating = 5 AND vine = 'N') as float
	) 
	/
	cast( COUNT(star_rating) filter (where star_rating = 5) as float
	)
	*100
from vine_table;


