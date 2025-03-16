# Retail Sales Data Lake & Analytics  

This repository contains the end-to-end process of ingesting, cleaning, transforming, and analyzing sales data from a retail store. The analysis and transformation were performed on a Databricks cluster using PySpark and SQL, culminating in a dashboard showcasing drawn insights.

## Table of Contents  
[Retail Sales Data Lake \& Analytics](#retail-sales-data-lake--analytics)
- [Retail Sales Data Lake \& Analytics](#retail-sales-data-lake--analytics)
  - [Table of Contents](#table-of-contents)
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

## Overview  

This project demonstrates how to build a data lake and apply data engineering and analysis techniques using PySpark on Databricks. The steps include:
1. **Storing the raw CSV data** in a data lake location (Databricks File System).
2. **Cleaning and transforming** the data.
3. **Analyzing** the data with SQL queries and PySpark DataFrames.
4. **Creating a dashboard** to visualize key metrics and trends from the sales data.

## Dataset  

The raw CSV files contain the following fields:
- **Order ID**
- **Product**
- **Quantity Ordered**
- **Price Each**
- **Order Date**
- **Purchase Address**

You can find more details on the columns and data in the Retail-Sales-Data-Preparation.ipynb notebook and the SQL scripts.

## Technologies Used  

- **Databricks** for cluster management, notebooks, and SQL analytics
- **PySpark** for data manipulation and transformations
- **SQL** (Databricks SQL) for analytical queries
- **Databricks Files System (DBFS)** as the data lake storage location
- **Parquet/Delta** for optimized storage and querying

## Project Structure  

- **Retail-Sales-Data_Preparation.ipynb**  
Contains the PySpark code for reading the raw CSV data, cleaning columns, handling missing values, and applying transformations.
- **Retail-Sales-Queries.sql**  
A collection of SQL queries that explore the sales data, run summary statistics, and handle intermediate analysis steps.
- **Retail-Sales-Analytics.sql**  
The final set of SQL queries that derive key business metrics, such as monthly sales, product-level aggregations, and top-selling categories.

## Data Lake Architecture  

## Data Preparation  

## Data Analysis  

## Visualizations & Dashboard  

## Prediction Model  

## License  
