Comparative Economic Analysis: Japan vs G7 (2000 - 2024)

Data Modeling & Visualization in Power BI
📌 Project Overview

This project provides a comparative analysis of Japan’s economy relative to the G7, focusing on price levels, wages, and purchasing power. The methodology is inspired by the Mantes-Marinakis Report (2025), emphasizing the use of Purchasing Power Parities (PPP) and Constant Prices to draw objective conclusions about economic trends, similar to the divergence analysis used for the Greek economy.
📊 Data Structure & Modeling

The report is built on a Star Schema to ensure data integrity and optimal performance:

   Fact Tables: Wages, Disposable Income, Actual Consumption, Prices Rates.
   Dimension Tables: Countries, Years.

📈 Key Metrics Analyzed

   Price Level Index (PLI): Calculated as the ratio of PPP to market exchange rates. It measures local affordability and identifies currency overvaluation or undervaluation.
   Real Wages vs. Nominal: Evaluation of labor income adjusted for local purchasing power to reveal the true value of earnings.
   Actual Individual Consumption (AIC): A primary measure of material welfare and household living standards, independent of GDP fluctuations.

🔍 Key Insights

   Price Divergence: Analysis of how Japan's price levels have diverged from the G7 average, becoming significantly more "affordable" over the last two decades.
   Purchasing Power: Evaluating if household income has kept pace with the cost of living using PPS (Purchasing Power Standards).
   Welfare Trends: Using AIC to assess whether living standards have remained stable despite the devaluation of the Yen.

🛠 Methodology & Data Sources

All data was retrieved from the OECD Data Explorer using the following datasets:

   Average Annual Wages (DSD_EARNINGS@AV_AN_WAGE)
   Annual GDP and Expenditure (DSD_NAMAIN10@DF_TABLE1) for AIC.
   Annual National Disposable Income (DSD_NAMAIN10@DF_TABLE2)

   Purchasing Power Parities & Exchange Rates (DSD_PPP@DF_PPP_INDICATORS)

Data Processing:
To ensure a scientifically sound comparison, all financial values were normalized using PPPs instead of nominal exchange rates. All series use Constant Prices to account for inflation. The Price Level Index was manually derived by dividing the PPP for actual individual consumption by the annual average exchange rate, following standard OECD statistical guidelines.
