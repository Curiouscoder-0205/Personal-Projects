# Personal-Projects
Personal projects outside work

> 📘 This is a read-only public portfolio. Feel free to view or fork, but editing is restricted to the owner.

# Project 1: 🏦 Power BI Finance Dashboard
Folder Link [PowerBI_proj2_fin](./PowerBI_proj2_fin/)

Please click option 'View raw' after clicking on 'Finance_dashboard.pbix' to download the dashboard in your local, or view the PDF report attached in the project GIT folder.

## ℹ️ About the Project
Free dataset sourced online showing country wise data such as certain product types sold, along with the year, months, unit price, units sold, etc.
I have created some custom measures (such as profit, profit ratio) to understand more about the data and have created some interactive visuals on the dashboard.

# Project 2: ⚽️ Fifa Top Players Dashboard in R
Folder Link [R_proj1_fifa](./R_proj1_fifa/)

## ℹ️ About the Project
FIFA Top-10 forward-line players comparison on different attributes for Years 2019 and 2020. This dashboard was created in R and published on R pubs.
Please find Rpubs link: https://rpubs.com/Sahilnagpal_0205/627178.

Code used to create the dashboard has been attached in a separate file: "Dashboard codes Fifa Players.txt"

# Project 3: 📉 Power BI Absenteeism at Work Dashboard
Folder Link [PowerBI_proj1_absenteeism](./PowerBI_proj1_absenteeism/) 

Please click option 'View raw' after clicking on 'Absenteeism at work_Dashboard.pbix' to download the dashboard in your local, or view the PDF report attached in the project GIT folder.

## ℹ️ About the Project
The analysis done includes creating a new table relationship in Power BI by creating a new master of Reason for absence ID and Reason for absence description. It also includes analysis of which reason is the leading factor contributing to absenteeism at work, along with correlation analysis of factors such as 'Age' and 'Distance from Residence to Work', with total absenteeism in hours for employees.

## 📁 Data Source:
Free Kaggle dataset used for analysis, original source - https://www.kaggle.com/datasets/kewagbln/absenteeism-at-work-uci-ml-repositiory.
The database was created with records of absenteeism at work from July 2007 to July 2010 at a courier company in Brazil.

Number of Instances: 740
Number of Attributes: 21
Missing Values: 0

# Project 4: 👥 GCP BigQuery and Looker Studio - Workforce Diversity Analysis using Google DEI Dataset

## 📅 Date: 27 July 2025
Folder Link [GCP_proj1_google_dei](./GCP_proj1_google_dei/)

## ℹ️ About the Project
This project explores diversity trends across sectors in the U.S. workforce post-2020 using Google’s DEI public dataset. 
Data was queried using Google BigQuery, ranked using SQL window functions, and prepared for visualization in Looker Studio.

## 📁 Data Source:

Google DEI Public Dataset (BigQuery)
Table: bigquery-public-data.google_dei.full_csv-latest-data-is-2023
Accessed via: Google Cloud BigQuery Public Datasets Explorer
https://console.cloud.google.com/ (requires login)


# Project 5: 🐧 GCP Penguin Species Classification with BigQuery ML

## 📅 Date: 29 July 2025
Folder Link [GCP_proj2_Penguin_ML](./GCP_proj2_Penguin_ML/)

## ℹ️ About the Project
A hands-on machine learning project using Google BigQuery ML to classify penguin species based on physical features. This project includes both binary and multi-class classification models built and evaluated using SQL-only workflows — ideal for data analysts looking to break into ML.

## 📁 Data Source
- Source: [`bigquery-public-data.ml_datasets.penguins`](https://console.cloud.google.com/marketplace/product/bigquery-public-data/ml-datasets)
- Features used:
  - `body_mass_g`, `flipper_length_mm`, `culmen_length_mm`, `culmen_depth_mm`
  - `sex`, `island`
  - `species` (label)
    

# Project 6: 🚕 Predicting Taxi Tip Amounts using Linear Regression in BigQuery ML

## 📅 Date: 03 August 2025
Folder Link [GCP_Proj3_TaxiDataset_ML_Reg](./GCP_Proj3_TaxiDataset_ML_Reg/)

## ℹ️ About the Project
To predict the tip amount of New York yellow taxi rides using a linear regression model in BigQuery ML based on features such as fare amount, trip distance, passenger count, and payment type.

## 📁 Data Source
- **Source**: `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
- **Features Used**:
  - `fare_amount`
  - `trip_distance`
  - `passenger_count`
  - `payment_type`
- **Target Column**:
  - `tip_amount`
    
 
# Project 7: 🧠 Credit Card Fraud Detection using Vertex AI AutoML

## 📅 Date: 04 August 2025
Folder Link [GCP_Proj4_Fraud_Detection_AutoML](./GCP_Proj4_Fraud_Detection_AutoML/)

## ℹ️ About the Project
To classify credit card transactions as fraudulent or legitimate using Google Cloud Vertex AI AutoML on a public anonymised dataset.


## 📁 Data Source
- **Source**: `bigquery-public-data.ml_datasets.ulb_fraud_detection`
- **Copied Table**: `sahil-project-4-automl.fraud_detection.ulb_fraud_detection`
- **Imported to Vertex AI Dataset**: `fraud_detection_ml`
- **Target Column**: `Class` (1 = Fraud, 0 = Not Fraud)
- **Features**: `V1` to `V28`, `Amount`, `Time` (numerical features)


# Project 8: 🚍 Bus Service Performance Dashboard – Greater Sydney & Outer Metropolitan

###  Data as on: May 2025  
### 🔧 Tools Used: BigQuery | Power BI (Online) | DAX | Data Modelling | Visual Analytics

## 📅 Date: 07 August 2025

Folder Link [PowerBI_Proj3_Bus_Data_May25](./PowerBI_Proj3_Bus_Data_May25/)

Please click option 'View raw' after clicking on 'Bus_Data_Report.pbix' to download the dashboard in your local, or view the PDF report attached in the project GIT folder.


## ℹ️  About the Project

To analyse and visualise bus performance data for Greater Sydney (GS) and Outer Metropolitan (ROM) across two financial years (FY24 & FY25), focusing on key performance indicators such as:
- On-Time Running (OTR)
- % of Services Cancelled
- Passenger Complaints per 100K
- Driver Vacancies
- Untracked Trips

## 📁 Data Source: https://opendata.transport.nsw.gov.au/data/dataset/greater-sydney-outer-metropolitan-bus-service-performance-data


# 🚃 Project 9: Public Transport Trip Forecasting (NSW) — Linear Regression, SARIMA, SARIMAX in Databricks Python

## 📅 Date: 10 August 2025
Folder Link [Python_Proj1_ML_OpalAllModes](./Python_Proj1_ML_OpalAllModes/)

## ℹ️  About the Project

Forecast monthly public transport trips using open NSW data to support planning and demand management.  

## 📁 Data Source:
- **Source:** NSW Open Data (Opal Trips – All Modes): https://opendata.transport.nsw.gov.au/data/dataset/opal-trips-all-modes
- **Grain:** Monthly counts by `year_month`, `travel_mode`, `card_type`.
- **Range used in demo:** 2024-01 to 2025-06.

# 🛒 Project 10: E-Commerce Sales Pipeline in Databricks (Medallion Architecture)

## 📅 Date: 24 September 2025
Folder Link [Databricks_DE_proj1_Ecommerce](./Databricks_DE_proj1_Ecommerce/)

## ℹ️  About the Project

This project demonstrates how to build an **end-to-end data engineering pipeline** using **Databricks, PySpark, and Delta tables**, following the **Medallion architecture (Bronze → Silver → Gold)**.  
The pipeline transforms raw e-commerce sales CSVs into business-ready fact and dimension tables, enabling KPI reporting and dashboards.

## 📁 Data Source: 
- A **dummy e-commerce dataset** was created to simulate real-world sales data.  
- Includes 4 CSV files ingested into the Bronze layer:
  - `customers` → basic customer profiles (id, name, region, signup date)  
  - `orders` → order headers (order id, customer id, order date, status)  
  - `order_items` → order line items (order_item id, order id, product id, quantity, unit price)  
  - `products` → product catalog (product id, name, category, list price)  
- Data was intentionally seeded with minor imperfections (blank fields, inconsistent casing, mixed date formats, `$` signs in prices) to demonstrate cleaning and transformation in the Silver layer.

# 🛒 Project 11: Incremental ETL with CDC & SCD in Databricks using E-commerce sales data

## 📅 Date: 30 September 2025
Folder Link [Databricks_DE_proj2_Ecommerce](./Databricks_DE_proj2_Ecommerce/)

## ℹ️  About the Project 
In **Project 1 Databrciks E-commerce**, we implemented a baseline medallion architecture (Bronze → Silver → Gold) on static CSV files of e-commerce data, focusing on cleaning and structuring. Those original CSVs and Python notebook remain available in the same Project for reference. Please click on the link, and then open the 'Archived_CSVs' folder.  [Databricks_DE_proj1_Ecommerce](./Databricks_DE_proj1_Ecommerce/)

This follow-up project extends that work into a more realistic **incremental pipeline**, introducing advanced data engineering concepts:  
- ⚡ **Incremental loads (daily feeds)** instead of static files.  
- 🔄 **CDC (Change Data Capture)** for customers → keep only the latest state.  
- 🗂️ **SCD Type-2 (Slowly Changing Dimension)** for products → preserve history with valid date ranges.  
- ⏳ **Fact tables with point-in-time joins** to attach the correct product version to each order. 
- 📊 **Incremental aggregates (Gold layer)** for KPIs such as revenue, order counts, and average order value.  

The pipeline is built using the **Databricks Lakehouse (PySpark + Delta Lake)** and simulates daily e-commerce data feeds. 

## 📁 Data Source  
- The e-commerce dataset is **simulated** within this notebook for Day-1 and Day-2 feeds.  
- The original static CSVs referenced in Project 1 provide the base dataset idea.  
- Day-2 simulation introduces changes and new records to demonstrate CDC/SCD behaviour.

# Project 12: Analytics Engineering Project with dbt & BigQuery

## 📅 Date: 19 July 2026
Folder Link [dbt_Project_Fleet_Data](./dbt_Project_Fleet_Data/)

## ℹ️  About the Project 
This project demonstrates an end-to-end Analytics Engineering workflow using **dbt Core**, **Google BigQuery**, and **SQL**.

The objective was to transform raw operational fleet management data into analytics-ready business models while applying software engineering best practices such as modular SQL development, data quality testing, documentation, and version control.

## 🚀 Tech Stack

- dbt Core
- Google BigQuery
- SQL
- Git & GitHub

## 📁 Data Source  
The project uses a **synthetic fleet management dataset** generated with AI to simulate realistic business scenarios.

The dataset contains five operational source tables:

- Contract
- Fleet Vehicle
- Vehicle Usage
- Driver
- Invoice

The generated data was intentionally designed to include realistic business relationships and data quality considerations suitable for Analytics Engineering practice.

    
# 👤 Author

**Sahil Nagpal**  
[LinkedIn](https://www.linkedin.com/in/sahil-nagpal-318999172/)

