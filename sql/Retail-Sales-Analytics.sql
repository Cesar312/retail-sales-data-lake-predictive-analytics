-- Databricks notebook source
USE sales_db

-- COMMAND ----------

SHOW TABLES

-- COMMAND ----------

DESCRIBE sales

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Identify Best Month in Sales

-- COMMAND ----------

SELECT OrderId,
        ReportMonth,
        Price,
        Quantity,
        (Price * Quantity) AS Sales
  FROM sales

LIMIT 10;

-- COMMAND ----------

SELECT 
        ReportMonth,
        sum(Price * Quantity) AS TotalSales
FROM sales
        GROUP BY ReportMonth
        ORDER BY TotalSales DESC;

-- COMMAND ----------

SELECT 
        ReportMonth,
        sum(Price * Quantity) AS TotalSales
FROM sales
        GROUP BY ReportMonth
        ORDER BY TotalSales ASC;

-- COMMAND ----------

SELECT 
  City,
  sum(Quantity) AS TotalCount
FROM sales
  GROUP BY City
  ORDER BY TotalCount ASC;

-- COMMAND ----------

SELECT 
  DISTINCT OrderId,
  hour(OrderDate) AS Hour
FROM sales;


-- COMMAND ----------

WITH tmp_hourly_orders AS (
  SELECT 
    DISTINCT OrderId,
    hour(OrderDate) AS Hour
  FROM sales
)
SELECT
  Hour,
  count(OrderId) AS TotalOrders
FROM tmp_hourly_orders
GROUP BY Hour
ORDER BY Hour ASC;

-- COMMAND ----------

SELECT 
  OrderId,
  count(1) AS OrderIds
FROM sales
  WHERE State = "NY"
  GROUP BY OrderId
  HAVING OrderIds > 1;


-- COMMAND ----------

SELECT 
    OrderId,
    State,
    collect_list(Product) AS ProductList,
    size(collect_list(Product)) AS ListSize
  FROM sales
    WHERE State = "NY"
    GROUP BY OrderId, State
    HAVING size(collect_list(Product)) > 1;

-- COMMAND ----------

WITH tmp_products AS (
  SELECT 
      OrderId,
      Product,
      State
    FROM sales
      WHERE State = "NY"
      ORDER BY Product
),

tmp_product_list AS (
  SELECT 
    OrderId,
    State,
    collect_list(Product) AS ProductList,
    size(collect_list(Product)) AS ListSize
  FROM tmp_products
    WHERE State = "NY"
    GROUP BY OrderId, State
)

SELECT 
    ProductList,
    count(1) AS Count
  FROM tmp_product_list
    WHERE ListSize > 1
    GROUP BY ProductList
    ORDER BY Count DESC;

-- COMMAND ----------

WITH tmp_products AS (
  SELECT 
      OrderId,
      Product,
      State
    FROM sales
      WHERE State = "NY"
      ORDER BY Product
),

tmp_product_list AS (
  SELECT 
    OrderId,
    State,
    collect_list(Product) AS ProductList,
    size(collect_list(Product)) AS ListSize
  FROM tmp_products
    WHERE State = "NY"
    GROUP BY OrderId, State
)

SELECT 
    ProductList,
    count(1) AS Count
  FROM tmp_product_list
    WHERE ListSize > 1
    GROUP BY ProductList
    ORDER BY Count DESC
LIMIT 5;


-- COMMAND ----------


