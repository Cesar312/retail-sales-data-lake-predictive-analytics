# Retail Sales Data Lake, Analytics, & Prediction Model  

This repository contains the end-to-end process of ingesting, cleaning, transforming, and analyzing sales data from a retail store. The analysis and transformation were performed on a Databricks cluster using PySpark and SQL, culminating in a dashboard showcasing drawn insights.   

***Last Modified Date***: 2025-03-16  

## Table of Contents  
- [Overview](#overview)
- [Dataset](#dataset)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Data Lake Architecture](#data-lake-architecture)
- [Data Preparation](#data-preparation)
- [Data Analysis](#data-analysis)
- [Visualizations \& Dashboard](#visualizations--dashboard)
- [Prediction Model](#prediction-model)
- [License](#license)

### Overview  
This project demonstrates how to build a data lake and apply data engineering and analysis techniques using PySpark on Databricks. The steps include:
1. **Storing the raw CSV data** in a data lake location (Databricks File System).
2. **Cleaning and transforming** the data.
3. **Analyzing** the data with SQL queries and PySpark DataFrames.
4. **Creating a dashboard** to visualize key metrics and trends from the sales data.

### Dataset  
The raw CSV files contain the following fields:
- **Order ID**
- **Product**
- **Quantity Ordered**
- **Price Each**
- **Order Date**
- **Purchase Address**

You can find more details on the columns and data in the Retail-Sales-Data-Preparation.ipynb notebook and the SQL scripts.

### Technologies Used  
- **Databricks** for cluster management, notebooks, and SQL analytics
- **PySpark** for data manipulation and transformations
- **SQL** (Databricks SQL) for analytical queries
- **Databricks Files System (DBFS)** as the data lake storage location
- **Parquet/Delta** for optimized storage and querying

### Project Structure  
- **Retail-Sales-Data_Preparation.ipynb**  
Contains the PySpark code for reading the raw CSV data, cleaning columns, handling missing values, and applying transformations.
- **Retail-Sales-Queries.sql**  
A collection of SQL queries that explore the sales data, run summary statistics, and handle intermediate analysis steps.
- **Retail-Sales-Analytics.sql**  
The final set of SQL queries that derive key business metrics, such as monthly sales, product-level aggregations, and top-selling categories.

### Data Lake Architecture  
- **Ingest**  
  - The raw CSV data is uploaded to DBFS at a path such as 
    `dbfs:/FileStore/salesdata/input/`.
  - This location represents the ***raw zone*** of our data lake.  
- **Transform**  
  - Using PySpark in a Databricks notebook, the data was loaded from the raw zone.
  - We cast columns (e.g. Quantity Ordered from `String` to `Int`), clean corrupted rows, added new columns, and fix other anomalies.  
- **Publish**  
  - The refined data is saved as Parquet/Delta files in 
    `dbfs:/FileStore/salesdata/published/`
  - This acts as the ***curated zone*** of the data lake, optimized for analytics.  
- **Analyze**  
  - The published data is queried via Databricks SQL or Spark DataFrames, enabling fast aggregations and computations.  

### Data Preparation  
The Retail-Sales-Data-Preparation.ipynb notebook includes:  
- Reading the Raw CSV Files
- Cleaning & Transformations
  - Removing header rows that slipped into the data
  - Converting columns to proper data types
  - Splitting out `Purchase Address` into `City`, `State`, etc. 
- Writing to the Curated Zone

### Data Analysis  
Analysis was performed via PySpark DataFrame APIs and SQL:
- Exploratory Queries:
  - Finding total revenue by month
  - Pinpoint peak ordering times 
  - Identifying popular product combinations in sales orders  
- Advanced Analytics
  - Partitioning data by Year/Month for efficient queries
  - Summarizing results in aggregated tables  

### Visualizations & Dashboard  
The final step was creating a dashboard in Databricks to visualize:
- **Monthly Revenue Trends**
- **Peak Ordering Times**
- **Geographic Breakdown of Orders**
- **Popular Product Combinations**

### Prediction Model  
In development, stay tuned.
### License  
This project is licensed under the MIT License -- see the [LICENSE.txt](LICENSE.txt) file for details.  

#### Databricks Community Edition
This project was developed and executed using [Databricks Community Edition](https://community.cloud.databricks.com/).
The code and queries are shared for educational purposes. Databricks itself is a proprietary platform, and
this repository does not include any proprietary Databricks software.
