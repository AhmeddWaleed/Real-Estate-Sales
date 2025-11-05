SELECT * FROM real_estate_sales;


-- Creating a copy of the dataset

CREATE TABLE RE_sales_copy
LIKE real_estate_sales ;

INSERT RE_sales_copy
SELECT * 
FROM real_estate_sales ;

SELECT * 
FROM RE_sales_copy ;


-- Checking if there are any duplicates

SELECT
		`Serial Number`, `List Year`, `date_recorded`,
		Town, Address, `Assessed Value`, `Sale Amount`, 
        `Sales Ratio`,`Property Type`, `Residential Type`,
        `Non Use Code`,`Assessor Remarks`, `OPM remarks`, Location,
        COUNT(*) as total_properties
 FROM RE_sales_copy
GROUP BY  `Serial Number`, `List Year`, `date_recorded`,
		   Town, Address, `Assessed Value`, `Sale Amount`, `Sales Ratio`,
		  `Property Type`, `Residential Type`, `Non Use Code`, `Assessor Remarks`, 
          `OPM remarks`, Location
HAVING COUNT(*) > 1;


-- Checking if there are any nulls

SELECT * 
FROM RE_sales_copy
WHERE `Serial Number` IS NULL 
	OR `List Year` IS NULL
	OR `date_recorded`IS NULL
	OR Town IS NULL 
    OR Address IS NULL
	OR `Assessed Value` IS NULL
    OR `Sale Amount` IS NULL
	OR `Sales Ratio` IS NULL
    OR `Property Type` IS NULL 
    OR `Residential Type` IS NULL 
    OR `Non Use Code`IS NULL
    OR `Assessor Remarks` IS NULL
    OR `OPM remarks`IS NULL
    OR Location IS NULL;


-- Checking if there are any blanks

-- Delete records where most essential columns are blank

DELETE                          
FROM RE_sales_copy
WHERE `date_recorded` = '' ;

DELETE                  
FROM RE_sales_copy
WHERE `Sale Amount` = '' ;

DELETE                    
FROM RE_sales_copy
WHERE `Assessed Value` = '' and `Sale Amount` = '' and `Sales Ratio` = '' ;


-- Replace blanks with “Unknown” (non-critical fields):

SELECT *                      
FROM RE_sales_copy
WHERE Address = '' ;

UPDATE RE_sales_copy
SET Address = 'Unknown'
WHERE Address = '';


SELECT *                      
FROM RE_sales_copy
WHERE `Property Type` = '' ;

UPDATE RE_sales_copy
SET `Property Type` = 'Unknown'
WHERE `Property Type` = '';


SELECT *                      
FROM RE_sales_copy
WHERE `Residential Type` = '' ;

UPDATE RE_sales_copy
SET `Residential Type` = 'Unknown'
WHERE `Residential Type` = '';


SELECT *                      
FROM RE_sales_copy
WHERE `Non Use Code` = '' ;

UPDATE RE_sales_copy
SET `Non Use Code` = 'Unknown'
WHERE `Non Use Code` = '';


SELECT *                      
FROM RE_sales_copy
WHERE `Assessor Remarks` = '' ;

UPDATE RE_sales_copy
SET `Assessor Remarks` = 'Unknown'
WHERE `Assessor Remarks` = '';


SELECT *                      
FROM RE_sales_copy
WHERE `OPM remarks` = '' ;

UPDATE RE_sales_copy
SET `OPM remarks` = 'Unknown'
WHERE `OPM remarks` = '';


SELECT *                      
FROM RE_sales_copy
WHERE Location = '' ;

UPDATE RE_sales_copy
SET Location = 'Unknown'
WHERE Location = '';

-- Changing data type of date from text to date and deleting old column

ALTER TABLE RE_sales_copy
ADD COLUMN date_recorded DATE;

UPDATE RE_sales_copy
SET date_recorded = STR_TO_DATE(`Date Recorded`, '%m/%d/%Y');

ALTER TABLE RE_sales_copy
DROP COLUMN `Date Recorded` ;


-- Unique towns and their count
  
SELECT 
DISTINCT Town
FROM RE_sales_copy; 

SELECT 
COUNT(DISTINCT Town)
FROM RE_sales_copy; 


-- Unique property type 

SELECT 
DISTINCT `property type`
FROM RE_sales_copy ;


-- Unique residential type

SELECT 
DISTINCT `residential type`
FROM RE_sales_copy ;


-- [1] Count of rows

SELECT count(*) 
FROM RE_sales_copy;


-- [2] Total sales and count by Town

SELECT 
     Town,
     COUNT(*) AS total_properties ,
     ROUND(SUM(`Sale Amount`),2) AS total_sales
FROM RE_sales_copy
GROUP BY Town
ORDER BY total_sales DESC; 


-- [3] Average sales and count by Town

SELECT 
     Town,
     COUNT(*) AS total_properties ,
     ROUND(AVG(`Sale Amount`),2) AS avg_sales
FROM RE_sales_copy
GROUP BY Town
ORDER BY avg_sales DESC; 


-- [4] Total sales and count by property type
 
SELECT 
     `property type`,
      COUNT(*) AS total_properties ,
      ROUND(SUM(`Sale Amount`),2) AS total_sales
FROM RE_sales_copy
GROUP BY `property type`
ORDER BY total_sales DESC; 


-- [5] Average Sales and count by property type

SELECT 
    `property type`,
     COUNT(*) AS total_properties ,
     ROUND(AVG(`Sale Amount`),2) AS avg_sales
FROM RE_sales_copy
GROUP BY `property type`
ORDER BY avg_sales DESC; 


-- [6] Total sales and count by residential type
 
SELECT 
	`residential type`,
     COUNT(*) AS total_properties ,
     ROUND(SUM(`Sale Amount`),2) AS total_sales
FROM RE_sales_copy
GROUP BY `residential type`
ORDER BY total_sales DESC; 


-- [7] Average Sales and count by residential type

SELECT 
     `residential type`,
     COUNT(*) AS total_properties ,
     ROUND(AVG(`Sale Amount`),2) AS avg_sales
FROM RE_sales_copy
GROUP BY `residential type`
ORDER BY avg_sales DESC; 


-- [8] Sales by month (volume , total sales)

SELECT 
     DATE_FORMAT(`date_recorded`, '%Y-%m') AS month,
     COUNT(*) AS total_properties,
     SUM(`Sale Amount`) AS total_sales
FROM RE_sales_copy
GROUP BY  month
ORDER BY month;


-- [9] sales by year (volume , total sales)

SELECT 
	 YEAR(`date_recorded`) AS year,
     SUM(`Sale Amount`) AS total_sales,
	 COUNT(*) AS total_properties
FROM RE_sales_copy
GROUP BY year
ORDER BY year;


-- [10] Top property sales

SELECT
     `Serial Number`,
     `Property Type`,
     `Residential Type`,
      Town,
      Address,
     `Sale Amount`
FROM RE_sales_copy
ORDER BY `Sale Amount` DESC;


-- [11] Total sales and count by town , property type and residential type

SELECT 
     Town,
     `property type`,
     `residential type`,
     COUNT(*) AS total_properties ,
     ROUND(SUM(`Sale Amount`),2) AS total_sales
FROM RE_sales_copy
GROUP BY Town,`property type`,`residential type`
ORDER BY total_sales DESC; 


-- [12] Average sales and count by town , property type and residential type

SELECT 
     Town,
     `property type`,
     `residential type`,
      COUNT(*) AS total_properties ,
      ROUND(AVG(`Sale Amount`),2) AS avg_sales
FROM RE_sales_copy
GROUP BY Town,`property type`,`residential type`
ORDER BY avg_sales DESC; 


















