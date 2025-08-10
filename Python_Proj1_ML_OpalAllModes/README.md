# 🚃 Public Transport Trip Forecasting (NSW) — Linear Regression, SARIMA, SARIMAX

**Goal:** Forecast monthly public transport trips using open NSW data to support planning and demand management.  
**Author:** Sahil Nagpal · [LinkedIn](https://www.linkedin.com/in/sahil-nagpal-318999172/)

---

## 📦 Project Structure (suggested)
```
transport-trips-forecast/
├─ notebooks/
│  └─ Python_code.ipynb
├─ reports/
│  └─ Transport_Trips_Forecast_Summary.pdf
├─ data/   Opal_all_modes.csv          
├─ src/ https://opendata.transport.nsw.gov.au/data/dataset/greater-sydney-outer-metropolitan-bus-service-performance-data
├─ README.md
```

> The PDF report was generated from the notebook. You can download it from this repo or from this session:  
> **[Transport_Trips_Forecast_Summary.pdf](Transport_Trips_Forecast_Summary.pdf)**

---

## 🗂️ Data
- **Source:** NSW Open Data (Opal Trips – All Modes): https://opendata.transport.nsw.gov.au/data/dataset/greater-sydney-outer-metropolitan-bus-service-performance-data
- **Grain:** Monthly counts by `year_month`, `travel_mode`, `card_type`.
- **Range used in demo:** 2024-01 to 2025-06.

---

## 🧪 Models & Results (Test Window)
| Model              | MAE       | RMSE      | MAPE / R² |
|--------------------|----------:|----------:|:---------:|
| Linear Regression  | 782,018   | 1,196,300 | R² = 0.572 |
| SARIMA             | 8,169,985 | 8,836,844 | 23.36%    |
| **SARIMAX**        | **5,016,261** | **5,164,030** | **14.40%** |

- **Linear Regression**: one‑hot(`travel_mode`, `card_type`) + time index `t`. Good baseline, captures 57% of variance.  
- **SARIMA**: seasonality only; underperformed on this short history.  
- **SARIMAX**: trend + Fourier seasonality as exogenous features → best time‑series accuracy.

---

## 📈 Key Visuals
- **SARIMAX – Next 6 Months Forecast (Total Trips)**  

- [SARIMAX Forecast](sarimax_forecast.png)

---

## 🔧 Reproducibility (Conda)
Create and activate an environment:

```bash
conda env create -f environment.yml
conda activate ml
jupyter lab
```

Minimal packages you’ll need:
```yaml
name: ml
channels: [conda-forge]
dependencies:
  - python=3.11
  - numpy
  - pandas
  - matplotlib
  - seaborn
  - scikit-learn
  - statsmodels
  - jupyterlab
```

---

## 🧹 Data Prep (notebook excerpt)
```python
# Clean columns we need
df = df[['year_month','travel_mode','card_type','trip']].dropna().copy()

# Ensure datetime & month start frequency
df['year_month'] = pd.to_datetime(df['year_month'])
df.sort_values('year_month', inplace=True)

# Remove 'unallocated' travel_mode if present
df = df[df['travel_mode'].str.lower() != 'unallocated']

# Create time index for ML baseline
df['t'] = (df['year_month'].dt.year * 12 + df['year_month'].dt.month)
df['t'] = df['t'] - df['t'].min()
```

---

## 📚 Baseline: Linear Regression (notebook excerpt)
```python
from sklearn.preprocessing import OneHotEncoder
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

# Train/test split by time (80/20)
cutoff = df['year_month'].quantile(0.8)
train = df[df['year_month'] <= cutoff].copy()
test  = df[df['year_month'] >  cutoff].copy()

# One-hot on train, apply to test
ohe = OneHotEncoder(drop='first', handle_unknown='ignore', sparse_output=False)
X_train_cat = ohe.fit_transform(train[['travel_mode','card_type']])
X_test_cat  = ohe.transform(test[['travel_mode','card_type']])

X_train = pd.concat([pd.DataFrame(X_train_cat, index=train.index), train[['t']]], axis=1)
X_test  = pd.concat([pd.DataFrame(X_test_cat, index=test.index),  test[['t']]], axis=1)

y_train, y_test = train['trip'], test['trip']

# Fit & score
lr = LinearRegression().fit(X_train, y_train)
pred = lr.predict(X_test)
mae = mean_absolute_error(y_test, pred)
rmse = (mean_squared_error(y_test, pred))**0.5
r2 = r2_score(y_test, pred)
```

---

## ⏱️ Time Series: SARIMAX (notebook excerpt)
```python
from statsmodels.tsa.statespace.sarimax import SARIMAX
import itertools, numpy as np

# Aggregate to monthly total series
ts = (df.groupby('year_month')['trip'].sum().sort_index())
ts = ts.set_axis(pd.DatetimeIndex(ts.index), axis=0).asfreq('MS')

# Deterministic exogenous: trend + Fourier seasonality
def make_fourier_features(dti, period=12, K=2):
    t = np.arange(len(dti))
    feats = {'t': t}
    for k in range(1, K+1):
        feats[f'sin_{k}'] = np.sin(2*np.pi*k*(t/period))
        feats[f'cos_{k}'] = np.cos(2*np.pi*k*(t/period))
    return pd.DataFrame(feats, index=dti)

exog = make_fourier_features(ts.index, period=12, K=2)

# Hold out last 3 months
h = 3
ts_train, ts_test = ts.iloc[:-h], ts.iloc[-h:]
ex_train, ex_test = exog.iloc[:-h, :], exog.iloc[-h:, :]

# Small grid by AIC
p = d = q = [0,1,2]; P = Q = [0,1]; D = [0,1]; s = 12
best = {'aic': np.inf}
for order in itertools.product(p,d,q):
  for seas in itertools.product(P,D,Q,[s]):
    try:
      res = SARIMAX(ts_train, exog=ex_train, order=order, seasonal_order=seas,
                    enforce_stationarity=False, enforce_invertibility=False).fit(disp=False)
      if res.aic < best.get('aic', np.inf):
          best = {'aic': res.aic, 'order': order, 'seasonal': seas, 'model': res}
    except Exception:
      pass

# Forecast test window
fc = best['model'].get_forecast(steps=h, exog=ex_test)
pred = fc.predicted_mean
```

---

## 📝 Business Takeaways
- **SARIMAX** best captured **seasonality + trend**, giving the lowest percentage error (MAPE 14.4% on the test window).  
- **Linear Regression** explained 57% of historical variation but doesn’t handle seasonality explicitly.  
- **Recommendation:** Retrain monthly; extend history; consider holiday/weather features.

---

## 📄 Report
- Clean 2‑page summary PDF (charts + table + insights):  
  **[Transport_Trips_Forecast_Summary.pdf](Transport_Trips_Forecast_Summary.pdf)**
