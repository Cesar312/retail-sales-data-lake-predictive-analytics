-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Databricks SQL

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Databricks provides the option to use SQL commands

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Identify Database 

-- COMMAND ----------

USE sales_db

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Data Preparation and Cleaning

-- COMMAND ----------

SELECT * 
FROM sales_raw
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Remove `NULL` and Bad Records

-- COMMAND ----------

SELECT *
FROM sales_raw
WHERE OrderID IS NULL
LIMIT 10; 

-- Uncomment the syntax below to view ALL the rows
-- SELECT *
-- FROM sales_raw
-- WHERE OrderID IS NULL;

-- COMMAND ----------

SELECT *
FROM sales_raw
WHERE OrderID = "Order ID";

-- COMMAND ----------

SELECT *
FROM sales_raw
WHERE OrderID != "Order ID" 
  AND OrderID IS NOT NULL;

-- COMMAND ----------

WITH tmp_sales_raw AS (
  SELECT *
  FROM sales_raw
  WHERE OrderID != "Order ID" 
    AND OrderID IS NOT NULL
) 
SELECT * 
FROM tmp_sales_raw
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC CTE is a temporary table created within the SQL statement, and only valid within the confines of the SQL statement. One cannot reuse the temporary table by another SQL statement from a previous cell.

-- COMMAND ----------

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

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Data Transformation

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Extract City and State from `PurchaseAddress`

-- COMMAND ----------

SELECT split(PurchaseAddress, ",")
FROM sales_raw
WHERE OrderID != "Order ID" 
  AND OrderID IS NOT NULL
LIMIT 10;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC

-- COMMAND ----------

SELECT split(PurchaseAddress, ",")[1] AS City,
        substring(split(PurchaseAddress, ",")[2], 1, 3) AS State
FROM sales_raw
WHERE OrderID != "Order ID" 
  AND OrderID IS NOT NULL
LIMIT 10;

-- COMMAND ----------

SELECT trim(split(PurchaseAddress, ",")[1]) AS City,
        trim(substring(split(PurchaseAddress, ",")[2], 1, 3)) AS State
FROM sales_raw
WHERE OrderID != "Order ID" 
  AND OrderID IS NOT NULL
LIMIT 10;

-- COMMAND ----------

SELECT cast(OrderId AS INT) AS OrderID,
      Product,
      QuantityOrdered,
      PriceEach,
      to_timestamp(OrderDate, 'MM/dd/yy HH:mm') AS OrderDate,
      PurchaseAddress,
      trim(split(PurchaseAddress, ",")[1]) AS City,
      trim(substring(split(PurchaseAddress, ",")[2], 1, 3)) AS State,
      year(to_timestamp(OrderDate, 'MM/dd/yy HH:mm')) AS ReportYear,
      month(to_timestamp(OrderDate, 'MM/dd/yy HH:mm')) AS ReportMonth
FROM sales_raw
WHERE OrderID != "Order ID" 
  AND OrderID IS NOT NULL
LIMIT 10;

-- COMMAND ----------


