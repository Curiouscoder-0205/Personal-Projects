# 🛒 E-Commerce Sales Pipeline in Databricks (Medallion Architecture)

This project demonstrates how to build an **end-to-end data engineering pipeline** using **Databricks, PySpark, and Delta tables**, following the **Medallion architecture (Bronze → Silver → Gold)**.  
The pipeline transforms raw e-commerce sales CSVs into business-ready fact and dimension tables, enabling KPI reporting and dashboards.

---

## 📂 Data Source
- A **dummy e-commerce dataset** was created to simulate real-world sales data.  
- Includes 4 CSV files ingested into the Bronze layer:
  - `customers` → basic customer profiles (id, name, region, signup date)  
  - `orders` → order headers (order id, customer id, order date, status)  
  - `order_items` → order line items (order_item id, order id, product id, quantity, unit price)  
  - `products` → product catalog (product id, name, category, list price)  
- Data was intentionally seeded with minor imperfections (blank fields, inconsistent casing, mixed date formats, `$` signs in prices) to demonstrate cleaning and transformation in the Silver layer.

---

## 🏷️ Project Structure

### 1. Bronze Layer
- **Source:** Raw CSV files imported into Databricks.
- **Tables:** `bronze_customers`, `bronze_orders`, `bronze_order_items`, `bronze_products`.
- **Purpose:** Store data in its raw form with minimal changes.

### 2. Silver Layer
- **Goal:** Clean, standardize, and deduplicate data for reliable joins and analytics.
- **Tables:**
  - `silver_customers` → cast IDs, trim names, normalize regions.
  - `silver_orders` → cast IDs, normalize status, keep order_date as string.
  - `silver_order_items` → cast numerics, filter invalid quantities.
  - `silver_products` → trim names, normalize categories, clean list_price.
- **Purpose:** Create a **single source of truth** for curated data.

### 3. Gold Layer
- **Goal:** Model data into fact and dimension tables optimized for BI & analytics.
- **Tables:**
  - `gold.dim_customer` → customer attributes (name, region, signup_date).
  - `gold.dim_product` → product attributes (name, category, list_price).
  - `gold.fact_order_item` → line-item grain fact with revenue calculations.
  - `gold.fact_daily_sales` → daily aggregate fact (orders, items, revenue, AOV, distinct customers).
- **Purpose:** Provide **business-ready datasets** for reporting and dashboards.

---

## 📊 KPIs Delivered
- **Top 10 Customers by Revenue**  
- **Revenue by Product Category** (with bar chart in Databricks)  
- **Daily Sales Trend** (orders, revenue, AOV)  

These KPIs demonstrate how raw data can be transformed into actionable insights.

---

## 🖼️ Screenshots
The notebook includes key screenshots to highlight the pipeline. 

[Databricks_Screenshots](./Databricks_Screenshots/)

---

## 🚀 How to Reproduce
1. Launch **Databricks Community Edition** (or paid workspace).  
2. Import raw CSVs into Bronze tables. > [Archived_CSVs](./Archived_CSVs/)
3. Run the notebook step by step > [DE_Ecommerce_Proj_24092025.ipynb
](DE_Ecommerce_Proj_24092025.ipynb):
   - Bronze sanity checks  
   - Silver transformations  
   - Gold fact/dim modeling  
   - KPI queries & visualizations  
4. Export Gold tables as CSV for BI dashboards (Power BI / Looker Studio).  

---

## ✅ Key Learnings
- Applied the **Medallion Architecture** in Databricks.  
- Used **PySpark** for type casting, trimming, normalization, and safe date parsing.  
- Built **fact and dimension tables** following a star schema.  
- Generated **business KPIs** directly from Gold tables.  
- Exported curated data for BI dashboarding.  

---

## 📌 Portfolio Value
This project demonstrates my ability to:  
- Ingest and process raw data into structured layers.  
- Design pipelines with **Bronze, Silver, and Gold tables**.  
- Deliver business-ready outputs using **PySpark and Delta Lake**.  
- Translate technical pipelines into **real business insights**.  

---
