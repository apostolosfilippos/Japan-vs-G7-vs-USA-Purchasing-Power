🇯🇵 Japan vs G7: Purchasing Power Analysis

Analysis of Japan's purchasing power 2000–2023 using Databricks (SQL) and Power BI.

## 📌 The Core Insight

Japan experienced prolonged wage stagnation despite historically low inflation, while G7 peers achieved stronger purchasing power growth through higher wages that outpaced price increases. Over 23 years: Japan +15%, USA +60%, G7 Average +40%. This reveals that **inflation alone doesn't determine economic progress—structural wage dynamics matter more**.

## 📊 Key Metrics (2000–2023)

| Metric | Japan | USA | G7 Avg |
|--------|-------|-----|--------|
| Purchasing Power (2023) | $51K | $82K | $64K |
| 23-Year Growth | +15% | +60% | +40% |
| Avg Inflation (CPI) | -0.5% | +2.8% | +2.5% |

## 🛠️ Tech Stack

- **Databricks SQL** (Medallion Architecture: Bronze → Silver → Gold layers)
- **Visualization**: Power BI
- **Data Sources**: World Bank & OECD

## 🏗️ SQL Pipeline

**Bronze Layer**: Raw data ingestion from World Bank API.  
**Silver Layer**: Cleaned CPI and Purchasing Power Parity metrics.  
**Gold Layer**: Final dataset joins silver tables and computes G7 aggregate for Power BI.

The medallion approach ensures data quality, reusability, and enables future analysis scaling across additional countries or metrics.

![g7](https://github.com/user-attachments/assets/e744fb2b-4e64-4a30-83e4-8d1413d754eb)
