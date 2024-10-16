-- SALES ANALYSIS
-- a) Finding the top selling product
-- analyzing which products are selling the most by looking at the quantity sold.

SELECT p.SKU, p.DesignNo,
SUM(s.QuantitySold) AS TotalSold
FROM Sales s
INNER JOIN Product p ON s.SKU = p.SKU
GROUP BY p.sku, p.DesignNo
ORDER BY TotalSold DESC
;

-- PRODUCT PRICING ANALYSIS
-- Pricing across platforms
SELECT p.SKU, p.DesignNo, pp.PlatformName, pp.PlatformMRP
FROM PlatformPricing pp
JOIN Product p ON pp.SKU = p.SKU
ORDER BY p.SKU;


-- PROFITABILY ANALYSIS
-- a) PROFIT PER PRODUCT

-- Calculating the profit margin for each product by comparing the sale price with the cost price (from the Product table).

SELECT p.SKU, p.DesignNo, SUM(s.QuantitySold * (s.SalePrice - p.CostPrice)) AS TotalProfit
FROM Sales s
JOIN Product p ON s.SKU = p.SKU
GROUP BY p.SKU, p.DesignNo
ORDER BY TotalProfit DESC
;

# Insight: We Determined the most profitable products by analyzing the total profit generated after subtracting the cost.

-- 4. Expense Analysis
-- a. Expense Breakdown by Category:

-- Analyze how much is being spent in different categories, such as marketing, salaries, shipping, etc.

SELECT Category, SUM(Amount) AS TotalExpense
FROM Expense
GROUP BY Category
ORDER BY TotalExpense DESC
;

-- Insight: Understand where the most money is being spent, helping you manage and optimize business expenses.

-- 5. Stock Analysis
-- a. Stock Availability:

-- Analyze which products have the lowest stock and might need restocking soon.

SELECT SKU, DesignNo, StockQuantity
FROM Product
WHERE StockQuantity < 20
ORDER BY StockQuantity ASC;

-- Insight: Identify products that are low in stock and may need to be restocked to meet demand.

-- 6. Sales Trends Analysis
-- a. Monthly Sales Performance:

-- Tracking sales performance over time to understand seasonal trends or growth.

SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS SalesMonth, SUM(QuantitySold * SalePrice) AS MonthlyRevenue
FROM Sales
GROUP BY SalesMonth
ORDER BY SalesMonth ASC;

-- 7. Return Rate Analysis
-- a. Return Rate per Product:

-- Calculate the return rate for each product to understand if any products are being returned frequently.

SELECT p.SKU, p.DesignNo, 
       SUM(CASE WHEN s.Status = 'Returned' THEN s.QuantitySold ELSE 0 END) AS ReturnedQuantity, 
       SUM(s.QuantitySold) AS TotalSold,
       (SUM(CASE WHEN s.Status = 'Returned' THEN s.QuantitySold ELSE 0 END) / SUM(s.QuantitySold)) * 100 AS ReturnRate
FROM Sales s
JOIN Product p ON s.SKU = p.SKU
GROUP BY p.SKU, p.DesignNo
ORDER BY ReturnRate DESC;

-- 8. Sales Fulfillment Analysis
-- a. Fulfillment Method Performance:

-- Analyze sales by fulfillment method (e.g., Online, In-store) to understand how customers prefer to receive their products.

SELECT FulfilmentMethod, SUM(QuantitySold * SalePrice) AS TotalRevenue
FROM Sales
GROUP BY FulfilmentMethod
ORDER BY TotalRevenue DESC;


-- 9. Cost Price vs Sale Price Analysis
-- a. Markup on Products:

-- Calculate the markup percentage on each product by comparing the sale price with the cost price.

SELECT p.SKU, p.DesignNo, 
       AVG((s.SalePrice - p.CostPrice) / p.CostPrice) * 100 AS MarkupPercentage
FROM Sales s
JOIN Product p ON s.SKU = p.SKU
GROUP BY p.SKU, p.DesignNo
ORDER BY MarkupPercentage DESC;

-- 10. Expense vs Revenue Analysis
-- a. Total Revenue vs Total Expenses:

-- Compare total revenue generated with total expenses to analyze profitability.

SELECT 
    (SELECT SUM(QuantitySold * SalePrice) FROM Sales) AS TotalRevenue,
    (SELECT SUM(Amount) FROM Expense) AS TotalExpenses,
    (SELECT SUM(QuantitySold * SalePrice) FROM Sales) - (SELECT SUM(Amount) FROM Expense) AS ProfitOrLoss;







