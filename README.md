# Nashville_housing

## Project Overview

**Project Title**: Nashville Housing Analysis

**Database**: 'housing_db'

This project is designed to demonstrate SQL skills and techniques commonly used by data analysts to explore, clean, and analyze real estate data. The focus is on housing sales in Nashville, TN, and includes setting up a structured database, performing exploratory data analysis (EDA), and answering complex property-related questions through SQL queries. This project is ideal for those beginning their data analysis journey and looking to build a strong foundation in SQL by working with real-world housing data.

## Objectives 

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named 'Housing'.
- **Table Creation**: A table named 'nashville_housing' is created to store the Nashville Housing data. the table structure includes columns for unique id, parcel id, land use, property address, town, sales date, sale price, legal reference, properties sold vacant, owner name, owner address, acerage, tax district, land value, building value, total value, year built, bedroom, number of bedrooms, number of fll baths, number of half baths.

```sql
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
```

### 2. Data Exploration & Cleaning 

- **Record Count**: Determine the total number of records in the dataset.
- **Property Count**: Find out how many properties have been sold.
- **Category Count**:Identify all unique categories 
- **Town Count**: Identify all unique towns in the dataset
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
-- Data Cleaning - You need to check if there are any NULL values in all the columns 

SELECT * 
FROM nashville_housing
WHERE unique_id IS NULL OR parcel_id IS NULL OR land_use IS NULL
OR property_address IS NULL OR town IS NULL OR sale_date IS NULL 
OR sale_price IS NULL OR legal_reference IS NULL OR sold_vacant IS NULL
OR owner_name IS NULL OR owner_address IS NULL OR acerage IS NULL
OR tax_district IS NULL OR land_value IS NULL OR building_value IS NULL
OR total_value IS NULL OR year_built IS NULL OR bedroom IS NULL
OR full_bath IS NULL OR half_bath IS NULL; 

-- Delete the NULL values
DELETE FROM nashville_housing 
WHERE unique_id IS NULL OR parcel_id IS NULL OR land_use IS NULL
OR property_address IS NULL OR town IS NULL OR sale_date IS NULL 
OR sale_price IS NULL OR legal_reference IS NULL OR sold_vacant IS NULL
OR owner_name IS NULL OR owner_address IS NULL OR acerage IS NULL
OR tax_district IS NULL OR land_value IS NULL OR building_value IS NULL
OR total_value IS NULL OR year_built IS NULL OR bedroom IS NULL
OR full_bath IS NULL OR half_bath IS NULL; 

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
```
The following SQL queries were developed to answer specific business questions: 

1. What is the average sale price of properties by land use type? 
```sql
SELECT land_use, ROUND(AVG(sale_price), 2) AS avg_price 
FROM nashville_housing 
GROUP BY land_use
ORDER by avg_price DESC; 
```
2. How many properties were sold each year?
 ```sql
SELECT YEAR(sale_date) AS sale_year, COUNT(*) AS properties_sold 
FROM nashville_housing
GROUP BY sale_year
ORDER BY properties_sold DESC;
```  


