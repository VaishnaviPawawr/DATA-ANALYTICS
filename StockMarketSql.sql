/*Kpi 1
Average Daily Trading Volume */

CREATE VIEW KPI1 AS
SELECT Ticker,Format(Avg(Volume)/1000000,2) As Avg_Volume_in_Millions
FROM `stock_market_dataset`
GROUP BY Ticker;

SELECT * FROM KPI1;

/*Kpi 2
Most Volatile Stocks */

CREATE VIEW KPI2 AS
SELECT Ticker,Round(Avg(Beta*100),2) As Avg_Beta
FROM `stock_market_dataset`
GROUP BY Ticker;

SELECT * FROM KPI2;

/*Kpi 3
Stocks with Highest Dividend and Lowest Dividend */

CREATE VIEW KPI3 AS
SELECT Ticker,Round(Sum(`Dividend Amount`),1) As Dividend_Amount
FROM `stock_market_dataset`
GROUP BY Ticker
ORDER BY 2 DESC;

SELECT * FROM KPI3;

/*Kpi 4
Highest and Lowest P/E Ratios */

CREATE VIEW KPI4 AS
SELECT Ticker,MAX(`PE Ratio`) AS Max_PE_Ratio,MIN(`PE Ratio`) AS Min_PE_Ratio
FROM`stock_market_dataset`
GROUP BY Ticker
ORDER BY 3 Desc;

SELECT * FROM KPI4;

/*Kpi 5
Stocks with Highest Market Cap */

CREATE VIEW KPI5 AS
SELECT Ticker,Format(AVG(`Market Cap`)/1000000000,2) As MarketCap_in_Billions
FROM `stock_market_dataset`
GROUP BY Ticker
ORDER BY 2 Desc;

SELECT * FROM KPI5;

/*Kpi 6
Stocks with Strong Buy Signals and stocks with Strong Selling Signal */

CREATE VIEW KPI6 AS
SELECT Ticker, `Market Cap`, `MACD`, `RSI (14 days)`
FROM stock_market_dataset
WHERE (MACD > 0 AND `RSI (14 days)` < 45) OR (MACD < 0 OR `RSI (14 days)` >= 69);

SELECT * FROM KPI6;

