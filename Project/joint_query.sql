CREATE DATABASE Hotels_db;
USE Hotels_db;

-- Create tables for raw data to be loaded into
CREATE TABLE Listing_abnb (
  id INT primary key auto_increment ,
  fsa text,
  postal_code TEXT,
  property_type Text,
  room_type text,
  price integer,
  source_loaded text
);

CREATE TABLE listing_hotels (
  id INT primary key auto_increment,
  FSA TEXT,
  postal_code TEXT,
  price integer,
  source_loaded text 
);
select * from listing_hotels;

-- Joins the tables, checking data was uploaded succesfully
SELECT count(*)-- Listing_abnb.postal_code, Listing_abnb.price, Listing_abnb.source_loaded, listing_hotels.postal_code, listing_hotels.price, listing_hotels.source_loaded
FROM Listing_abnb
JOIN listing_hotels
ON LTRIM(RTRIM(UPPER(Listing_abnb.fsa))) = LTRIM(RTRIM(UPPER(listing_hotels.FSA)));

-- Find tthe best discount price for accomodation in toronto based on FSA
select a.FSA
,b.FSA
,ABNB_Price
, Hotel_Price 
FROM (
SELECT FSA
, MIN(price) as ABNB_price
FROM Listing_abnb
GROUP BY FSA ) a
JOIN (
SELECT FSA
, MIN(price) as Hotel_Price
FROM Listing_HOTELS
GROUP BY FSA) B 
ON LTRIM(RTRIM(UPPER(A.FSA))) = LTRIM(RTRIM(UPPER(B.FSA)));

SELECT DISTINCT FSA FROM LISTING_ABNB  WHERE FSA = 'M4M' ORDER BY FSA;

SELECT DISTINCT FSA FROM LISTING_HOTELS WHERE LTRIM(RTRIM(FSA)) = 'M4M' ORDER BY FSA;
