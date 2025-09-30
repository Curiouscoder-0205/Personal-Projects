# Project 2: Incremental ETL with CDC & SCD in Databricks  

## 📖 Overview  
In **Project 1 Databricks Ecommerce**, we implemented a baseline medallion architecture (Bronze → Silver → Gold) on static CSV files of e-commerce data, focusing on cleaning and structuring. Those original CSVs and Python notebook remain available in Project 1 for reference. Please click on the link, and then open the 'Archived_CSVs' folder.  [Databricks_DE_proj1_Ecommerce](../Databricks_DE_proj1_Ecommerce/)

This follow-up project extends that work into a more realistic **incremental pipeline**, introducing advanced data engineering concepts:  
- ⚡ **Incremental loads (daily feeds)** instead of static files.  
- 🔄 **CDC (Change Data Capture)** for customers → keep only the latest state.  
- 🗂️ **SCD Type-2 (Slowly Changing Dimension)** for products → preserve history with valid date ranges.  
- ⏳ **Fact tables with point-in-time joins** to attach the correct product version to each order.  
- 📊 **Incremental aggregates (Gold layer)** for KPIs such as revenue, order counts, and average order value.  

The pipeline is built using the **Databricks Lakehouse (PySpark + Delta Lake)** and simulates daily e-commerce data feeds.  

---

## 🎯 Objectives  
- Demonstrate how to extend a batch ETL pipeline into an **incremental architecture**.  
- Implement **CDC Type-1** for customers and **SCD Type-2** for products.  
- Build **Gold fact tables** with point-in-time product attributes.  
- Show **incremental daily aggregates** using MERGE for idempotent loads.  
- Apply basic **data quality checks** to validate results.  
- Showcase **Delta Lake features** like history and schema enforcement.  

---

## 📁 Data Source  
- The e-commerce dataset is **simulated** within this notebook for Day-1 and Day-2 feeds.  
- The original static CSVs referenced in Project 1 provide the base dataset idea.  
- Day-2 simulation introduces changes and new records to demonstrate CDC/SCD behaviour.  

---

## 🔄 Pipeline Flow  
1. **Bronze (incremental staging)**  
   - Day-1 and Day-2 simulated feeds written into `_inc` Bronze tables.  
2. **Silver (curated with CDC/SCD)**  
   - Customers → Type-1 CDC (latest snapshot only).  
   - Products → Type-2 SCD (track changes with valid_from, valid_to, is_current).  
   - Orders & Items → Append-only cleaned facts.  
3. **Gold (analytics-ready)**  
   - Fact table with **point-in-time product join**.  
   - Daily aggregate table with **MERGE** for incremental KPIs.  

---

## 🚀 Key Features Demonstrated  
- ⚡ **Incremental ingestion**: daily Bronze `_inc` feeds.  
- 🔄 **CDC (Type-1)**: customer updates handled via MERGE.  
- 🗂️ **SCD (Type-2)**: product changes tracked with history.  
- ⏳ **Point-in-time joins**: ensures facts always link to the correct product version.  
- 📊 **Incremental aggregation**: MERGE logic for daily KPIs.  
- ✅ **Data quality checks**: duplicates, missing joins, invalid values.  
- 🗄️ **Delta Lake capabilities**: schema enforcement, audit history.  

---

## 🖼️ Screenshots  
Below are recommended outputs to highlight in the repository (see `/assets` folder):  
1. **Silver Customers CDC** – shows latest snapshot of customers.  
2. **Silver Products SCD2** – shows product history with current/expired rows.  
3. **Gold Fact (PIT join)** – fact table enriched with correct product version.  
4. **Gold Daily Sales Aggregate** – daily KPIs (table or chart).  

---

## ⚙️ How to Run  
- Import this Python notebook in the project folder **DE_proj_2 2025-09-30.ipynb** into a **Databricks Community Edition** workspace.  
- Run cells sequentially (Steps 1–9 complete Day-1 pipeline).  
- Step 10 is **optional** to simulate Day-2 data. After running Step 10, re-run Steps 3–7 to see CDC and SCD in action.  

---

## 📚 Learnings & Outcomes  
This project demonstrates the transition from **analyst-style batch cleaning (Project 1)** to **data engineering skills** such as:  
- Incremental ETL design.  
- Handling change data (CDC, SCD).  
- Building point-in-time fact tables.  
- Creating incremental aggregates with MERGE.  
- Applying DQ checks and leveraging Delta Lake features.  

**Outcome:**  
We now have a complete pipeline that ingests daily data, applies CDC/SCD logic, and produces analytics-ready Gold tables.  

---

## 🔗 Related Projects  
- [Project 1 – Medallion ETL (batch/static)](link-to-project-1)  
