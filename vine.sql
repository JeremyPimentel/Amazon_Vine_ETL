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

DROP vine_table_6;
CREATE TABLE vine_table_6 (
  total_reviews INTEGER,
  total_5_star_ratings INTEGER,
  percentage_5_star_reviews_paid INTEGER,
  percentage_5_star_reviews_unpaid INTEGER
);


SELECT COUNT(review_id)
FROM vine_table;


SELECT COUNT(star_rating)
FROM vine_table
WHERE star_rating = 5;



SELECT COUNT(star_rating)
FROM vine_table
WHERE (star_rating = 5 AND
vine = 'Y')
;

--Determine Total Percentage Paid Reviews
--Total Number of paid reviews/Total 5_star Reviews
--Total 5_Star Reviews = total_5_star_reviews FROM vine_table_6

SELECT COUNT(star_rating) AS RESULT
FROM vine_table
WHERE (star_rating = 5 AND
vine = 'Y')
;

SELECT(
SELECT COUNT(star_rating)
FROM vine_table
WHERE (star_rating = 5 AND
vine = 'Y'))
/(SELECT total_5_star_ratings FROM vine_table_6)*100;


 


SELECT * FROM vine_table_6;









