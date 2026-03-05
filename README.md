🇯🇵 Japan vs G7: Purchasing Power Analysis

Analysis of Japan’s purchasing power 2000-2023 using Databricks (SQL) and Power BI.

📌 The Core Insight
   
    Japan: Low Inflation + Stagnant Wages = +15% Growth
    G7 Average: big Inflation but Wage Growth = +40% Growth
    Conclusion: Japan had less growth despite much lower inflation

![g7](https://github.com/user-attachments/assets/e744fb2b-4e64-4a30-83e4-8d1413d754eb)    

🛠️ Tech Stack

   Databricks SQL (Medallion Architecture)
   Visualization: Power BI
   Data Sources: World Bank & OECD

 SQL Pipeline
1. Bronze Layer (Raw Ingestion)

    bronze_g7: Raw data loaded directly from source.

2. Silver Layer (cleaning)

    silver_cpi: Cleaned inflation metrics.
    silver_ppp: Cleaned Purchasing Power Parity values.

3. Gold Layer (Ready for Analysis)

    gold_g7: The final table used for Power BI. This stage filters bronze_g7 for G7 countries and joins it with the Silver tables to create the final dataset and the G7 Average.


DROP TABLE IF EXISTS silver_g7;
CREATE TABLE silver_g7 AS
SELECT 
  REF_AREA AS country,
  TIME_PERIOD AS year,
  OBS_VALUE AS income_per_capita
FROM bronze_g7
WHERE REF_AREA IN ('USA', 'JPN', 'DEU', 'GBR', 'FRA', 'ITA', 'CAN')
  AND OBS_VALUE IS NOT NULL;


DROP TABLE IF EXISTS gold_g7;
CREATE TABLE gold_g7 AS
SELECT
  silver_g7.country,
  silver_g7.year,
  silver_g7.income_per_capita,
  silver_cpi.cpi,
  silver_ppp.ppp
FROM silver_g7
LEFT JOIN silver_cpi 
  ON silver_g7.country = silver_cpi.country AND silver_g7.year = silver_cpi.year
LEFT JOIN silver_ppp 
  ON silver_g7.country = silver_ppp.country AND silver_g7.year = silver_ppp.year
WHERE silver_g7.country IN ('USA', 'JPN')
UNION ALL
SELECT
  'G7' AS country,
  silver_g7.year,
  AVG(silver_g7.income_per_capita) AS income_per_capita,
  AVG(silver_cpi.cpi) AS cpi,
  AVG(silver_ppp.ppp) AS ppp
FROM silver_g7
LEFT JOIN silver_cpi 
  ON silver_g7.country = silver_cpi.country AND silver_g7.year = silver_cpi.year
LEFT JOIN silver_ppp 
  ON silver_g7.country = silver_ppp.country AND silver_g7.year = silver_ppp.year
GROUP BY silver_g7.year;

📊 Key Metrics (2000-2023)
Metric	Japan	USA	G7 Avg
Purchasing Power (2023)	$51K	$82K	$64K
23-Year Growth	+15%	+60%	+40%
Avg Inflation (CPI)	-0.5%	+2.8%	+2.5%
