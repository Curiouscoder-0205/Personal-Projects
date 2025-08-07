# 🚍 Bus Service Performance Dashboard – Greater Sydney & Outer Metropolitan

### 📅 Data as on: May 2025  
### 🔧 Tools Used: BigQuery | Power BI (Online) | DAX | Data Modelling | Visual Analytics

---

## 🧠 Objective

To analyse and visualise bus performance data for Greater Sydney (GS) and Outer Metropolitan (ROM) across two financial years (FY24 & FY25), focusing on key performance indicators such as:
- On-Time Running (OTR)
- % of Services Cancelled
- Passenger Complaints per 100K
- Driver Vacancies
- Untracked Trips

---

## 📁 Data Source: https://opendata.transport.nsw.gov.au/data/dataset/greater-sydney-outer-metropolitan-bus-service-performance-data

---

## 🧹 Data Preparation (BigQuery)

- Removed **June 2025** data as it was a placeholder row with no actual values.
- Interpolated **January and February 2025** region-wise using average of **December 2024** and **March 2025** values.
- Rounded key numeric columns to 3 decimal places and converted relevant fields (like OTR, % Cancelled, and % Untracked) back to percentages by multiplying by 100.
- Output used for building visuals in Power BI.

---

## 📊 Visualisations (Power BI)

### 1. Average % OTR and % of Services Cancelled (Combo Chart)
- Monthly trend comparison for both KPIs.
- Colour-coded by Financial Year (FY24 vs FY25).
- Shows OTR remained strong while service cancellation stayed low.

### 2. Total Passenger Complaints per 100K by Region and FY
- Region-wise comparison.
- GS improved from FY24 to FY25.
- ROM remained mostly consistent.

### 3. Driver Vacancies (Gauge Chart)
- Displays average monthly vacancies.
- Benchmark: 0 (ideal) to 420 (worst recorded).
- Current reading: ~151 indicates room for staffing improvement.

### 4. Scatter Plot – Normalised Complaints vs. Untracked Trips
- Explores visual correlation.
- Dots coloured by FY.
- Trendline shows very weak positive correlation.

### 5. Correlation Coefficient Card
- Calculated Pearson correlation coefficient: **0.11**
- Indicates almost no linear relationship.

---

## 📄 Page 2 (Report Commentary)

- Contains bullet-pointed analysis and takeaways for each chart.
- Helps guide interviews or walkthroughs.

---

## 📎 Code Files

> All DAX measures, BigQuery logic, and interpolation scripts are saved in the attached files.

---

## ✅ Summary

This dashboard shows your proficiency in:
- Cleaning and preparing operational data in SQL (BigQuery)
- Designing meaningful visuals in Power BI
- Creating statistical insights (correlation, averages, trends)
- Delivering clear reporting and storytelling

Perfect for interview demonstrations or performance reviews.
