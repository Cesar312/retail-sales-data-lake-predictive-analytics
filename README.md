# Retail Sales Data Lake, Analytics & Prediction Model  

This repository contains the end-to-end process of ingesting, cleaning, transforming, analyzing, and predicting sales trends from a retail store. The analysis and transformation were performed on Databricks clusters using PySpark and SQL, and using MLflow to track machine learning experiments for predictive modeling.

***Last Modified Date***: 2025-03-18  

## Table of Contents  
- [Overview](#overview)
- [Dataset](#dataset)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Data Lake Architecture](#data-lake-architecture)
- [Data Preparation](#data-preparation)
- [Data Analysis](#data-analysis)
- [Visualizations \& Dashboard](#visualizations--dashboard)
- [Machine Learning Model \& MLflow Tracking](#machine-learning-model--mlflow-tracking)
- [How to Reproduce](#how-to-reproduce)
- [Future Improvements](#future-improvements)
- [License](#license)

### Overview  
This project demonstrates how to: 
- **Store and clean raw sales data** in a **data lake** (Databricks FileStore).
- **Analyze and visualize** trends using **PySpark DataFrames** and **SQL queries**.
- **Predict future sales trends** using **Machine Learning with MLflow tracking**.
- **Deploy the trained model** to predict sales for upcoming months.

### Dataset  
The dataset contains the following features:
- **Order ID**
- **Product**
- **Quantity Ordered**
- **Price Each**
- **Order Date**
- **Purchase Address**
- **Derived Features: City, State, ReportYear, ReportMonth**

You can find more details on the columns and data in the `Retail-Sales-Data-Preparation.ipynb` notebook and the SQL scripts.

### Technologies Used  
- **Databricks** for cluster management, notebooks, SQL analytics, experiment tracking, and deployment
- **PySpark** for data manipulation and transformations
- **SQL** (Databricks SQL) for analytical queries
- **Databricks Files System (DBFS)** as the data lake storage location
- **Parquet / Delta** Lake for optimized storage and querying
- **MLflow** for model tracking and logging
- **Scikit-learn** for the prediction model

### Project Structure  
- **Retail-Sales-Data_Preparation.ipynb**  
Contains the PySpark code for reading the raw CSV data, cleaning columns, handling missing values, and applying transformations.
- **Retail-Sales-Queries.sql**  
A collection of SQL queries that explore the sales data, run summary statistics, and handle intermediate analysis steps.
- **Retail-Sales-Analytics.sql**  
The final set of SQL queries that derive key business metrics, such as monthly sales, product-level aggregations, and top-selling categories.
- **Retail-Sales-Predictive-Analytics.ipynb**  
With PySpark, we predict monthly sales by city using a linear regression model. The experiments were tracked using MLflow, and the trained model was saved for future predictions.

### Data Lake Architecture  
- **Ingest**  
  - The raw CSV data is uploaded to DBFS at a path such as 
    `dbfs:/FileStore/salesdata/input/`.
  - This location represents the ***raw zone*** of our data lake.  
- **Transform**  
  - Using PySpark in a Databricks notebook, the data was loaded from the raw zone.
  - We cast columns (e.g. Quantity Ordered from `String` to `Int`), clean corrupted rows, added new columns, and fix other anomalies.  
- **Publish**  
  - The refined data is saved as Parquet / Delta Lake files in 
    `dbfs:/FileStore/salesdata/published/`
  - This acts as the ***curated zone*** of the data lake, optimized for analytics.  
- **Analyze**  
  - The published data is queried via Databricks SQL or Spark DataFrames, enabling fast aggregations and computations.  
- **Prediction**  
  - Using PySpark ML, a pipeline transforms features into a format suitable for ML model training.
  - Define a linear regression model to a workflow that predicts retail sales while tracking the experiments with evaluation metrics and logging.
- **Deployment**
  - From the MLflow tracking server, access the trained model to make real-time predictions. 

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
- **Exploratory Queries**
  - Finding total revenue by month
  - Pinpoint peak ordering times 
  - Identifying popular product combinations in sales orders  
- **Advanced Analytics**
  - Partitioning data by Year/Month for efficient queries
  - Summarizing results in aggregated tables  

### Visualizations & Dashboard  
The final step was creating a dashboard in Databricks to visualize:
- **Monthly Revenue Trends**
- **Peak Ordering Times**
- **Geographic Breakdown of Orders**
- **Popular Product Combinations**

### Machine Learning Model & MLflow Tracking   
- Preprocessed the data with feature engineering techniques 
- Train Linear Regression model to predict monthly sales by city
- Logged experiments in MLflow with evaluation metrics
- Saved model and loaded it for future sales predictions
- Deployed MLflow pipeline to track and compare multiple models

### How to Reproduce  
- **Clone Repository**  
   `git clone https://github.com/Cesar312/retail-sales-data-lake-predictive-analytics.git`
- **Create Databricks Clusters**  
   - Standard cluster for the EDA and SQL queries
   - ML cluster for model training, experiment tracking, and deployment of the prediction model  
- **Upload Data to Databricks**  
   - Upload raw CSV files to `dbfs:/FileStore/salesdata/input/`
- **Run the PySpark Notebook**  
   - Open `Retail-Sales-Data-Preparation.ipynb`
   - Execute cells to clean and publish data
- **Train the Model**  
   - Open `Retail-Sales-Predictive-Analytics.ipynb`
   - Execute cells to train and track experiments
   - View the evaluation metrics in MLflow UI
- **Predict Future Sales**  
   - Load the trained model
   - Make predictions for new months

### Future Improvements  
- Automate model retraining on new data updates
- Test advanced models like XGBoost or Time-Series Forecasting
- Create a backend API microservice to serve predictions by deploying the trained ML model retrieved from the Databricks MLflow registry
  
### License  
This project is licensed under the MIT License -- see the [LICENSE.txt](LICENSE.txt) file for details.  

#### Databricks Community Edition
This project was developed and executed using [Databricks Community Edition](https://community.cloud.databricks.com/).
The code and queries are shared for educational purposes. Databricks itself is a proprietary platform, and
this repository does not include any proprietary Databricks software.
