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
