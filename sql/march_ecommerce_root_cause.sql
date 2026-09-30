-- Little Sprout Sales Performance Analysis
-- March E-Commerce Growth: Root Cause Analysis
-- Objective:
-- Investigate the drivers behind the increase in E-Commerce
-- net revenue from February to March 2025.

-- 1. Transaction Volume
-- Compare unique E-Commerce transactions between February and March 2025.

SELECT
    MONTH(Transaction_Date) AS Transaction_Month,
    COUNT(DISTINCT Transaction_ID) AS Unique_Transactions
FROM dbo.Little_Sprout_Raw_Sales
WHERE Channel = 'E-Commerce'
  AND Transaction_Date >= '2025-02-01'
  AND Transaction_Date < '2025-04-01'
GROUP BY MONTH(Transaction_Date)
ORDER BY Transaction_Month;

-- 2. Units Sold & Basket Size
-- Compare total units sold and average units per transaction.

SELECT 
    MONTH(Transaction_Date) AS Transaction_Month,
    SUM(Quantity) AS Total_Units_Sold, 
    SUM(Quantity) * 1.0 / COUNT(DISTINCT Transaction_ID) 
        AS Avg_Units_Per_Transaction

FROM dbo.Little_Sprout_Raw_Sales

WHERE Channel = 'E-Commerce'
  AND Transaction_Date >= '2025-02-01'
  AND Transaction_Date < '2025-04-01'

GROUP BY MONTH(Transaction_Date)

ORDER BY Transaction_Month;

-- 3. Net Revenue & Revenue per Unit
-- Compare E-Commerce net revenue and revenue per unit between February and March.

SELECT
    MONTH(Transaction_Date) AS Transaction_Month,
    SUM(Quantity) AS Total_Units_Sold,

    SUM(
        Quantity * Unit_Price_RM *
        (
            1 - CAST(REPLACE(Discount_Pct, '%', '') AS decimal(10,2)) / 100
        )
    ) AS Total_Net_Revenue,

    SUM(
        Quantity * Unit_Price_RM *
        (
            1 - CAST(REPLACE(Discount_Pct, '%', '') AS decimal(10,2)) / 100
        )
    ) / NULLIF(SUM(Quantity), 0) AS Net_Revenue_Per_Unit

FROM dbo.Little_Sprout_Raw_Sales

WHERE Channel = 'E-Commerce'
  AND Transaction_Date >= '2025-02-01'
  AND Transaction_Date < '2025-04-01'

GROUP BY MONTH(Transaction_Date)

ORDER BY Transaction_Month;

-- 4. Average Discount
-- Compare average discount levels between February and March.

SELECT 
    MONTH(Transaction_Date) AS Transaction_Month, 
 
    AVG(
        CAST(REPLACE(Discount_Pct, '%', '') AS decimal(10,2))
    ) AS Avg_Discount_Pct

FROM dbo.Little_Sprout_Raw_Sales 
 
WHERE Channel = 'E-Commerce' 
  AND Transaction_Date >= '2025-02-01' 
  AND Transaction_Date < '2025-04-01' 
 
GROUP BY MONTH(Transaction_Date) 

ORDER BY Transaction_Month;

-- 5. Product Mix
-- Compare product sales volume and average unit prices between February and March.

SELECT  
    MONTH(Transaction_Date) AS Transaction_Month,  
    Product_Name, 
    SUM(Quantity) AS Total_Quantity,
    AVG(Unit_Price_RM) AS Avg_Unit_Price

FROM dbo.Little_Sprout_Raw_Sales  

WHERE Channel = 'E-Commerce'  
  AND Transaction_Date >= '2025-02-01'  
  AND Transaction_Date < '2025-04-01'
  
GROUP BY 
    MONTH(Transaction_Date),
    Product_Name

ORDER BY 
    Transaction_Month,
    Total_Quantity DESC;
