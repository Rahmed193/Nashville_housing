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
