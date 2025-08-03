
# Project 3: Predicting Taxi Tip Amounts using Linear Regression in BigQuery ML

## 📌 Objective
To predict the tip amount of New York yellow taxi rides using a linear regression model in BigQuery ML based on features such as fare amount, trip distance, passenger count, and payment type.

---

## 🧠 Dataset
- **Source**: `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
- **Features Used**:
  - `fare_amount`
  - `trip_distance`
  - `passenger_count`
  - `payment_type`
- **Target Column**:
  - `tip_amount`

---

## 🛠️ Step-by-Step Implementation

### 1. Data Preview Query
```sql
SELECT *
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
LIMIT 10;
```

### 2. Create Regression Model
```sql
CREATE OR REPLACE MODEL `sahil-project-3-ml-reg.proj3_ml_dataset.tip_prediction_model`
OPTIONS(
  model_type = 'linear_reg',
  input_label_cols = ['tip_amount']
) AS
SELECT
  fare_amount,
  trip_distance,
  passenger_count,
  payment_type,
  tip_amount
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
WHERE 
  tip_amount IS NOT NULL
  AND fare_amount > 0
  AND trip_distance > 0
  AND passenger_count > 0
  AND payment_type IS NOT NULL
  AND tip_amount >= 0
LIMIT 100000;
```

### 3. Predict Tip Amounts
```sql
SELECT
  predicted.fare_amount,
  predicted.trip_distance,
  predicted.passenger_count,
  predicted.payment_type,
  predicted.predicted_tip_amount,
  predicted.tip_amount AS actual_tip_amount
FROM ML.PREDICT(
  MODEL `sahil-project-3-ml-reg.proj3_ml_dataset.tip_prediction_model`,
  (
    SELECT
      fare_amount,
      trip_distance,
      passenger_count,
      payment_type,
      tip_amount
    FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
    WHERE 
      tip_amount IS NOT NULL
      AND fare_amount > 0
      AND trip_distance > 0
      AND passenger_count > 0
      AND payment_type IS NOT NULL
      AND tip_amount >= 0
    LIMIT 1000 OFFSET 100000
  )
) AS predicted;
```

### 4. Model Evaluation
```sql
SELECT *
FROM ML.EVALUATE(
  MODEL `sahil-project-3-ml-reg.proj3_ml_dataset.tip_prediction_model`,
  (
    SELECT
      fare_amount,
      trip_distance,
      passenger_count,
      payment_type,
      tip_amount
    FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018`
    WHERE 
      tip_amount IS NOT NULL
      AND fare_amount > 0
      AND trip_distance > 0
      AND passenger_count > 0
      AND payment_type IS NOT NULL
      AND tip_amount >= 0
    LIMIT 100000
  )
);
```

---

## 📊 Evaluation Summary
- **Mean Absolute Error (MAE)**, **Mean Squared Error (MSE)**, and **Root Mean Squared Error (RMSE)** were relatively high.
- Indicates **limited predictive power** due to the wide variability in tipping behaviour.
- **Conclusion**: This model is useful for learning regression workflow, but performs poorly in real-world prediction.

---

## 📂 Project Files
The following files were exported for documentation and future use:
- `1_clean_data_prev.csv`
- `2_prediction_data.csv`
- `3_Evaluation_data.csv`
- `project_3_queries.txt`

---

## ✅ Final Notes
- This project shows a basic regression pipeline using BigQuery ML.
- Data leakage was minimised using `OFFSET` during prediction selection.
- Visualization was **not included** due to poor prediction quality.
