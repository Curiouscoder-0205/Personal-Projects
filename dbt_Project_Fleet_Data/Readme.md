# Analytics Engineering Project with dbt & BigQuery

## 📖 Overview

This project demonstrates an end-to-end Analytics Engineering workflow using **dbt Core**, **Google BigQuery**, and **SQL**.

The objective was to transform raw operational fleet management data into analytics-ready business models while applying software engineering best practices such as modular SQL development, data quality testing, documentation, and version control.

---

## 🚀 Tech Stack

- dbt Core
- Google BigQuery
- SQL
- Git & GitHub

---

## 📂 Project Architecture

```
Raw Source Tables
        │
        ▼
Staging Models (Views)
        │
        ▼
Business Marts (Tables)
```

---

## 📊 Dataset

The project uses a **synthetic fleet management dataset** generated with AI to simulate realistic business scenarios.

The dataset contains five operational source tables:

- Contract
- Fleet Vehicle
- Vehicle Usage
- Driver
- Invoice

The generated data was intentionally designed to include realistic business relationships and data quality considerations suitable for Analytics Engineering practice.

---

## 🏗️ What I Built

### Data Ingestion

- Loaded raw source tables into Google BigQuery
- Configured dbt source definitions
- Established source freshness and metadata

### Staging Layer

Built staging models to:

- Standardize naming conventions
- Cast data into appropriate data types
- Remove duplicate records
- Apply basic data cleansing
- Create reusable cleaned datasets

### Data Quality Testing

Implemented dbt tests including:

- Primary key uniqueness
- Not Null validation
- Relationship tests between tables
- Source integrity validation

### Business Marts

Created three analytics-ready marts:

#### 📌 Contract Fleet Overview

Provides a consolidated view of contracts, assigned vehicles, and drivers.

#### 📌 Outstanding Contracts

Tracks contract status together with invoice information to identify outstanding customer balances.

#### 📌 Business Vehicle Usage

Aggregates vehicle usage metrics for business reporting and operational analysis.

---

## 📁 Project Structure

```
models/
│
├── staging/
│   ├── stg_contract.sql
│   ├── stg_driver.sql
│   ├── stg_fleet_vehicle.sql
│   ├── stg_invoice.sql
│   └── stg_vehicle_usage.sql
│
├── marts/
│   ├── mart_contract_fleet_overview.sql
│   ├── mart_outstanding_contracts.sql
│   └── mart_business_vehicle_usage.sql
│
└── sources.yml
```

---

## ✅ Data Quality

This project includes dbt tests for:

- Unique keys
- Not Null constraints
- Relationship integrity
- Source validation

These tests help ensure that downstream business models are built on trusted, high-quality data.

---

## 📸 Project Screenshots

Include screenshots of:

- Project folder structure
- dbt lineage graph
- Successful `dbt build`
- BigQuery dataset
- Example business mart output

---

## 🎯 Skills Demonstrated

- Analytics Engineering
- SQL
- dbt Core
- Google BigQuery
- Data Modeling
- Data Transformation
- Data Quality Testing
- Git Version Control


