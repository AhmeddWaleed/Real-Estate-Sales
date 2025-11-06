# Real-Estate-Sales (MySQL & Tableau)

This project analyzes real estate data to uncover insights about property prices, sales trends, and market performance.  
Using SQL, I cleaned, transformed, and queried the dataset to answer key business questions
It aims to help businesses make data-driven decisions by understanding which property type, residential type and regions drive the most sales.

## **Project Objective**
- Identify top-performing property type, residential type and regions.
- Analyze sales trends.
- Which towns have the highest average property prices? 

## Dataset
- **Source**: [DATA.GOV – Real Estate Sales 2001-2023 GL Dataset](https://catalog.data.gov/dataset/real-estate-sales-2001-2018)

## **Tools Used**
- **SQL**
- **Tableau**: Dashboard and data visualization  

## Methodology
1. **Data Cleaning**
   - Removed duplicates and null values
   - Delete records where most essential columns are blank , Replace blanks with “Unknown” (non-critical fields)
   - Converted date column to date type
  
2. **Exploratory Data Analysis (EDA)**
   - Analyzed sales by towns, property type and residential type  
   - Examined sales peaks 
   - Examined monthly and yearly sales  

3. **Visualization**
   - Created bar charts, line plots, and pie charts for better insight communication  
   - Built an interactive Tableau dashboard

##  Visualization
[Tableau Dashboard](https://public.tableau.com/views/RealEstateSales_17575307192500/RealEstateSales?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Key Insights
- **Greenwich** generated the highest total sales
- **Single Family** are the top-performing properties
