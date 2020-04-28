DROP TABLE IF EXISTS covid;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS merged;

CREATE TABLE covid (
	id serial PRIMARY KEY,
	start_date DATE,
	us_state VARCHAR,
	positive_cases INT,
	negative_cases INT,
	number_of_death INT
);

CREATE TABLE stock(
	id serial PRIMARY KEY,
	start_date DATE,
	symbol VARCHAR,
	open_s FLOAT,
	close_s FLOAT,
	low FLOAT,
	high FLOAT
);


CREATE TABLE merged (
	id serial PRIMARY KEY,
	start_date DATE,
	us_state VARCHAR,
	positive_cases INT,
	negative_cases INT,
	number_of_death INT,
	symbol VARCHAR,
	open_s FLOAT,
	close_s FLOAT,
	low FLOAT,
	high FLOAT
);

SELECT * FROM covid;
SELECT * FROM stock;
SELECT * FROM merged;


SELECT c.start_date, c.us_state, c.positive_cases, c.negative_cases, c.number_of_death, s.symbol, s.open_s, s.close_s, s.low, s.high
FROM covid AS c
INNER JOIN stock AS s
ON s.start_date = c.start_date
WHERE s.symbol = 'SPGI'
ORDER BY c.start_date;