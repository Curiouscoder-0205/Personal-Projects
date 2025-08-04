# Project 4: 🧠 Credit Card Fraud Detection using Vertex AI AutoML

## 📅 Date: 04 August 2025

## 📌 Objective
To classify credit card transactions as fraudulent or legitimate using Google Cloud Vertex AI AutoML on a public anonymised dataset.

---

## 🧠 Dataset
- **Source**: `bigquery-public-data.ml_datasets.ulb_fraud_detection`
- **Copied Table**: `sahil-project-4-automl.fraud_detection.ulb_fraud_detection`
- **Imported to Vertex AI Dataset**: `fraud_detection_ml`
- **Target Column**: `Class` (1 = Fraud, 0 = Not Fraud)
- **Features**: `V1` to `V28`, `Amount`, `Time` (numerical features)

---

## 🔧 Preprocessing
- Data was already numeric and anonymised (no manual cleaning required)
- Vertex AI automatically handled:
  - Train/validation/test splitting
  - One-hot encoding (if needed)
  - Feature scaling (min-max scaling to 0–1)
  - Feature importance analysis

---

## 🏗️ Model Training Steps
1. The dataset was imported into Vertex AI (tabular classification).
2. Target column `Class` selected.
3. AutoML selected all available features.
4. Data split: **Random (80/10/10)** as per default.
5. Training budget set to **1 node hour** with early stopping enabled.

---

## 📊 Evaluation Results
- **PR AUC**: 1.0  
- **ROC AUC**: 1.0  
- **Log loss**: 0.002  
- **Micro-average F1**: 0.999  
- **Macro-average F1**: 0.927  
- **Precision/Recall**: 99.9%  
- **Confusion Matrix**:
  - True Negatives (0 predicted as 0): 100%
  - True Positives (1 predicted as 1): 80%
  - False Negatives (1 predicted as 0): 20%

### 📌 Feature Importance (Top)
- V14: 19.5%
- V12: 13.2%
- V10: 11.3%
- V4: 10.7%
- V11: 6.9%

---

## 🖼️ Key Screenshots
- Evaluation Metrics  
- Confusion Matrix  
- Feature Importance Bar Chart  
(All screenshots stored in the project folder)

---

## ✅ Final Notes
- Vertex AI AutoML was effective and required **no code**.
- Excellent classification metrics due to a balanced dataset.
- Deployment was skipped to avoid additional cost.
- Project useful to demonstrate **end-to-end no-code ML** for tabular binary classification.
