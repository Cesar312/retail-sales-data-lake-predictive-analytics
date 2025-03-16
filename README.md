# Retail Sales Data Lake & Analytics

This repository contains the end-to-end process of ingesting, cleaning, transforming, and analyzing sales data from a retail store. The analysis and transformation were performed on a Databricks cluster using PySpark and SQL, culminating in a dashboard showcasing drawn insights.

## Table of Contents

* Overview
* Dataset
* Technologies Used
* Project Structure
* Data Lake Architecture
* Data Preparation
* Data Analysis
* Visualizations & Dashboard
* Prediction Model

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

