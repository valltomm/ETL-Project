-- Query to check successful load
select * from listing_hotels;

select * from Listing_abnb;

-------- Joins the tables, checking data was uploaded succesfully ----------------------
-- Join tables on FSA and see the count
SELECT count(*)
FROM Listing_abnb
JOIN listing_hotels
ON LTRIM(RTRIM(UPPER(Listing_abnb.fsa))) = LTRIM(RTRIM(UPPER(listing_hotels.FSA)));

-- Find the best discount price for accomodation in toronto based on FSA 
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


-- See the Distinct FSA from Airbnb table
SELECT DISTINCT FSA FROM LISTING_ABNB  WHERE FSA = 'M4M' ORDER BY FSA;

-- See the Distinct FSA from Hotels table  where FSA = 'M4M'
SELECT DISTINCT FSA FROM LISTING_HOTELS WHERE LTRIM(RTRIM(FSA)) = 'M4M' ORDER BY FSA;
