-- Create database
CREATE DATABASE datavio_db;

-- Select databse
USE datavio_db;

-- Create brands table
CREATE TABLE brands (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create categories table
CREATE TABLE categories (
    id INT PRIMARY KEY,
    category VARCHAR(255),
    sub_category VARCHAR(255)
);

-- Create listingdata table
CREATE TABLE listingdata (
    unique_identifier VARCHAR(255) PRIMARY KEY,
    page_content TEXT,
    promotion_history JSON,
    seller_name VARCHAR(255),
    seller_rating FLOAT,
    category_id INT,
    brand_id INT,
    mrp FLOAT,
    selling_price FLOAT,
    rating FLOAT,
    breadcrumb_category_id TEXT,
    variations_count TEXT,
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create listinghistory table
CREATE TABLE listinghistory (
    id INT PRIMARY KEY,
    rating_history JSON,
    rating_value_history JSON,
    listing_id VARCHAR(255)
);

-- SHOW VARIABLES LIKE 'secure_file_priv';

-- Import listingdata table data
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\listingdata.csv'
INTO TABLE listingdata
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(unique_identifier, page_content, promotion_history, seller_name, seller_rating, category_id, brand_id, mrp, selling_price, rating, breadcrumb_category_id, variations_count);

select * from LISTINGDATA;

-- Import listinghistory table data
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\listinghistory.csv'
INTO TABLE listinghistory
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, rating_history, rating_value_history, listing_id);

select * from listinghistory;

-- 1.	Write a PSQL query to identify all the unique categories sold by any specific brand name. (You can assume the brand name to be `JOCKEY`)

SELECT DISTINCT
    category
FROM
    categories c
        JOIN
    listingdata ld ON c.id = ld.category_id
        JOIN
    brands b ON ld.brand_id = b.id
WHERE
    b.name = 'Rite Clique';   -- Used this ('Rite Clique') brand only as there is only one matching brand in both the tables.
    
-- 2.	Write a PSQL query to find the average prices(selling_price) of each category sold by any specific brand name. 
-- (You can assume the brand name to be `JOCKEY`)

SELECT
    category, AVG(selling_price) AS avg_sell_price
FROM
    categories c
        JOIN
    listingdata ld ON c.id = ld.category_id
        JOIN
    brands b ON ld.brand_id = b.id
WHERE
    b.name = 'Rite Clique'  -- Used this ('Rite Clique') brand only as there is only one matching brand in both the tables.
GROUP BY category;

-- 3.	Write a PSQL query to find the average promotion value for each category sold by any specific brand name in the month of May. 
-- (You can assume the brand name to be `JOCKEY`)
    
SELECT 
    c.category, 
    AVG(p.value) AS avg_promotion_value
FROM 
    brands b
JOIN 
    listingdata l ON b.id = l.brand_id
JOIN 
    categories c ON l.category_id = c.id
JOIN 
    JSON_TABLE(
        l.promotion_history, 
        '$[*]' COLUMNS (
            date VARCHAR(50) PATH '$.date',
            value DOUBLE PATH '$.value'
        )
    ) p
WHERE 
    b.name = 'Rite Clique'  -- Used this ('Rite Clique') brand only as there is only one matching brand in both the tables.
    AND (MONTHNAME(STR_TO_DATE(p.date, '%Y-%m-%d')) = 'May')
GROUP BY 
    c.category;


