# 🐧 Penguin Species Classification with BigQuery ML

A hands-on machine learning project using Google BigQuery ML to classify penguin species based on physical features. This project includes both binary and multi-class classification models built and evaluated using SQL-only workflows — ideal for data analysts looking to break into ML.

---

## 📁 Dataset
- Source: [`bigquery-public-data.ml_datasets.penguins`](https://console.cloud.google.com/marketplace/product/bigquery-public-data/ml-datasets)
- Features used:
  - `body_mass_g`, `flipper_length_mm`, `culmen_length_mm`, `culmen_depth_mm`
  - `sex`, `island`
  - `species` (label)

---

## ✅ Project Structure

### 1. Dataset Preview

```sql
SELECT * FROM `bigquery-public-data.ml_datasets.penguins` LIMIT 10;
```

---

### 2. Binary Classification: Is the Penguin an Adelie?

- **Model:** Logistic Regression (`is_adelie` as binary label)
- **Label logic:** `CASE WHEN species = 'Adelie Penguin...' THEN 1 ELSE 0 END`

```sql
CREATE OR REPLACE MODEL `penguin_classifier` OPTIONS(...) AS SELECT ...
```

- **Evaluation Output:**
  - Accuracy: 1.0
  - Log Loss: 0.012
  - Perfectly classifies Adelie vs. other species

---

### 3. Multi-Class Classification: Predict the Species

- **Model:** Logistic Regression with `species` as multi-class label
- **Classes:** Adelie, Chinstrap, Gentoo

```sql
CREATE OR REPLACE MODEL `penguin_multiclass_classifier` OPTIONS(...) AS SELECT ...
```

- **Evaluation Output:**
  - Accuracy: 1.0
  - Precision/Recall/F1: 1.0
  - Log Loss: 0.016

> 📌 *This near-perfect performance is likely due to the dataset's small size and clear feature separation across species, making it ideal for learning and demonstration purposes.*

---

### 4. Visual Output Table for Looker Studio

```sql
CREATE OR REPLACE TABLE `prediction_flat_output` AS
SELECT species, predicted_species, probs.label AS class_label, probs.prob AS class_probability
FROM ML.PREDICT(...) AS result,
UNNEST(result.predicted_species_probs) AS probs;
```

---

## 📦 Deliverables

| File | Description |
|------|-------------|
| `project_summary.txt` | Summary of the project with explanations |
| `project_code.txt` | Full SQL code (dataset preview, training, predictions, evaluation) |
| `adelie_predictions.csv` | Binary classification predictions |
| `adelie_model_evaluation.csv` | Evaluation metrics for binary classifier |
| `penguin_predictions_nested.csv` | Multi-class predictions with nested probabilities |
| `penguin_predictions_flat.csv` | Flattened prediction output for visualization |
| `penguin_model_evaluation.csv` | Evaluation metrics for multi-class model |
| `Model_Confidence_by_Species.pdf` | Looker studio report - https://lookerstudio.google.com/s/vNj-JkJIJA4 |

---

## 🧠 Skills Demonstrated

- SQL-based machine learning with BigQuery ML
- Binary and multi-class classification
- Model evaluation and interpretation
- Preparing flat outputs for dashboarding in Looker Studio

---

## 👤 Author

**Sahil Nagpal**  
BigQuery | SQL | Data Analytics | ML Projects