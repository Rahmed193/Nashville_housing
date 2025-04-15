-- SQL housing analysis 
CREATE DATABASE housing; 

-- Create Table 
CREATE TABLE nashville_housing (
	unique_id INT PRIMARY KEY, 
    parcel_id VARCHAR(20),
    land_use VARCHAR(50),
    property_address VARCHAR(100), 
    town VARCHAR(100),
    sale_date DATE, 
    sale_price INT, 
    legal_reference VARCHAR(100),
    sold_vacant VARCHAR(5), 
    owner_name VARCHAR(100), 
    owner_address VARCHAR(100), 
    acerage FLOAT, 
    tax_district VARCHAR(50), 
    land_value INT, 
    building_value INT, 
    total_value INT,
    year_built INT, 
    bedroom INT, 
    full_bath INT,
    half_bath INT
    );

SELECT * FROM nashville_housing;

SELECT COUNT(*) 
FROM nashville_housing;

-- Data Cleaning - You need to check if there are any NULL values in all the columns 
SELECT * 
FROM nashville_housing
WHERE unique_id IS NULL
OR  
parcel_id IS NULL
OR 
land_use IS NULL
OR 
property_address IS NULL
OR
town IS NULL
OR
sale_date IS NULL 
OR
sale_price IS NULL
OR 
legal_reference IS NULL
OR
sold_vacant IS NULL
OR
owner_name IS NULL
OR
owner_address IS NULL
OR
acerage IS NULL
OR
tax_district IS NULL
OR
land_value IS NULL
OR
building_value IS NULL
OR
total_value IS NULL
OR
year_built IS NULL
OR
bedroom IS NULL
OR
full_bath IS NULL
OR
half_bath IS NULL;

DELETE FROM nashville_housing 
WHERE unique_id IS NULL
OR  
parcel_id IS NULL
OR 
land_use IS NULL
OR 
property_address IS NULL
OR
town IS NULL
OR
sale_date IS NULL 
OR
sale_price IS NULL
OR 
legal_reference IS NULL
OR
sold_vacant IS NULL
OR
owner_name IS NULL
OR
owner_address IS NULL
OR
acerage IS NULL
OR
tax_district IS NULL
OR
land_value IS NULL
OR
building_value IS NULL
OR
total_value IS NULL
OR
year_built IS NULL
OR
bedroom IS NULL
OR
full_bath IS NULL
OR
half_bath IS NULL; 

SELECT COUNT(*) FROM nashville_housing;

-- No NULL VALUES 

-- Data Exploration
-- How many properties have been sold?
SELECT COUNT(*)
FROM nashville_housing; 

-- What are the different categories of land use are there? 
SELECT DISTINCT land_use
FROM nashville_housing;

-- What are the different cities these sales have happened in?
SELECT DISTINCT town
FROM nashville_housing; 

-- Data Analysis & Business key problems & Answers

-- Q1. What is the average sale price of properties by land use type? 
SELECT land_use, ROUND(AVG(sale_price), 2) AS avg_price 
FROM nashville_housing 
GROUP BY land_use
ORDER by avg_price DESC; 

-- Q2. How many properties were sold each year? 
SELECT YEAR(sale_date) AS sale_year, COUNT(*) AS properties_sold 
FROM nashville_housing
GROUP BY sale_year
ORDER BY properties_sold DESC;

-- Q3. Which tax district has the highest average property value?
SELECT tax_district, ROUND(AVG(total_value),2) AS avg_total_value
FROM nashville_housing
GROUP BY tax_district
ORDER BY avg_total_value DESC; 

-- Q4. What is the average number of bedrooms and bathrooms by property type (land use)?
SELECT land_use, 
	ROUND(AVG(bedroom),0) AS avg_bedrooms, 
	ROUND(AVG(full_bath),0) AS avg_full_baths, 
	ROUND(AVG(half_bath), 0) AS avg_half_baths
FROM housing_sales 
GROUP BY land_use;

-- Q5. Which properties have the highest building value? (Top 10)
SELECT property_address, land_use, town, building_value
FROM nashville_housing
ORDER BY building_value
LIMIT 10;

-- Q6. Which neighborhoods or streets have the most property sales?
SELECT property_address, COUNT(*) AS sales_count
FROM nashville_housing
GROUP BY property_address
ORDER BY sales_count DESC
LIMIT 10;

-- Q7. What is the average age of properties sold (based on year built?
SELECT ROUND(AVG(YEAR(CURDATE()) - year_built), 0) AS avg_property_age
FROM nashville_housing
WHERE year_built IS NOT NULL; 

-- Q8. Which owners own the most properties in the dataset? 
SELECT owner_name, COUNT(*) AS properties_owned
FROM nashville_housing
GROUP BY owner_name
ORDER BY properties_owned DESC
LIMIT 10; 

-- Q9. Compare average land value vs. building value by number of bedrooms
SELECT bedroom, 
	ROUND(AVG(land_value),2) AS avg_land_value,
    ROUND(AVG(building_value),2) AS avg_building_value
FROM nashville_housing
GROUP BY bedroom
ORDER BY bedroom DESC;

-- Q10. Which properties have land values greater than twice their building values, and are over 0.5 acres in size? 

SELECT parcel_id, property_address, land_value, building_value, acerage
FROM nashville_housing
WHERE land_value > 2 * building_value AND acerage > 0.5
ORDER BY land_value DESC;

-- End of Project  
    