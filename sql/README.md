# SQL Queries  
This project includes a series of SQL queries to analyze retail sales data after it was cleaned and published into a data lake format. The SQL files offer both exploratory analysis and business-critical aggregations to extract insights such as sales performance, customer trends, and geographic patterns.  

## Retail-Sales-Queries.sql  
This file includes queries used to inspect, validate, and preview the dataset, including:
- Detecting duplicate rows
- Previewing product sales
- Grouping sales by city
- Checking unique values for year and month
- Sampling and limiting outputs

Example Snippet:
```
WITH tmp_sales_raw AS (
  SELECT *
  FROM sales_raw
  WHERE OrderID != "Order ID" 
    AND OrderID IS NOT NULL
) 
SELECT * 
FROM tmp_sales_raw
WHERE OrderID = "Order ID" 
    AND OrderID IS NULL;
```

## Retail-Sales-Analytics.sql  
This file contains final queries that power business dashboards and answer key analytical questions such as:
- Monthly total revenue
- Top products by quantity and sales
- Sales performance by city and state
- Year-over-year comparisons

Example Snippet:  
```
SELECT 
        ReportMonth,
        sum(Price * Quantity) AS TotalSales
FROM sales
        GROUP BY ReportMonth
        ORDER BY TotalSales ASC;
```