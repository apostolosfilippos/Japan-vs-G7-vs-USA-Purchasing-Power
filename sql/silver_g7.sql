DROP TABLE IF EXISTS silver_g7;

CREATE TABLE silver_g7
AS
SELECT 
  REF_AREA AS country,
  TIME_PERIOD AS year,
  OBS_VALUE AS income_per_capita
FROM bronze_g7
WHERE REF_AREA IN ('USA', 'JPN', 'DEU', 'GBR', 'FRA', 'ITA', 'CAN')
  AND OBS_VALUE IS NOT NULL;
