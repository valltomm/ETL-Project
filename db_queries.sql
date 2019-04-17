-- Create and use customer_db
CREATE DATABASE Hotels_db;
USE Hotels_db;

-- Create tables for raw data to be loaded into
CREATE TABLE Listing_abnb (
  id INT PRIMARY KEY,
  postal_code TEXT,
  price integer,
  source_loaded text  
);

CREATE TABLE listing_hotels (
  id INT PRIMARY KEY,
  postal_code TEXT,
  price integer,
  source_loaded text 
);
select * from listing_hotels;

-- Joins the tables
SELECT Listing_abnb.postal_code, Listing_abnb.price, Listing_abnb.source_loaded, listing_hotels.postal_code, listing_hotels.price, listing_hotels.source_loaded
FROM Listing_abnb
JOIN listing_hotels
ON Listing_abnb.postal_code = listing_hotels.postal_code;

