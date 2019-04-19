-- Create and use Hotels_db
CREATE DATABASE Hotels_db;
USE Hotels_db;

-- Create two tables for raw data to be loaded into
-- Creating the airbnb table
CREATE TABLE Listing_abnb (
  id INT primary key auto_increment ,
  fsa text,
  postal_code TEXT,
  property_type Text,
  room_type text,
  price integer,
  source_loaded text
);

-- Creating the hotels table
CREATE TABLE listing_hotels (
  id INT primary key auto_increment,
  FSA TEXT,
  postal_code TEXT,
  price integer,
  source_loaded text 
);

