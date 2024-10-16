create database Amazon_sales_data;

-- Create Product Table
CREATE TABLE Product (
    SKU VARCHAR(50) PRIMARY KEY,
    DesignNo VARCHAR(50),
    StyleID VARCHAR(50),
    Category VARCHAR(50),
    Size VARCHAR(50),
    Color VARCHAR(50),
    MRP DECIMAL(10, 2),
    StockQuantity INT,
    CostPrice DECIMAL(10, 2)
);

-- Create Sales Table
CREATE TABLE Sales (
    OrderID VARCHAR(50) PRIMARY KEY,
    OrderDate DATE,
    SKU VARCHAR(50),
    QuantitySold INT,
    SalePrice DECIMAL(10, 2),
    Status VARCHAR(50),
    SalesChannel VARCHAR(50),
    FulfilmentMethod VARCHAR(50),
    FOREIGN KEY (SKU) REFERENCES Product(SKU)
);

-- Create PlatformPricing Table
CREATE TABLE PlatformPricing (
    SKU VARCHAR(50),
    PlatformName VARCHAR(50),
    PlatformMRP DECIMAL(10, 2),
    FOREIGN KEY (SKU) REFERENCES Product(SKU)
);

-- Create Expense Table
CREATE TABLE Expense (
    ExpenseID INT AUTO_INCREMENT PRIMARY KEY,
    ExpenseDate DATE,
    Amount DECIMAL(10, 2),
    Category VARCHAR(50),
    Description VARCHAR(255)
);


-- Step 2: Populate Tables with the First 6 Entries

INSERT INTO Product (SKU, DesignNo, StyleID, Category, Size, Color, MRP, StockQuantity, CostPrice)
VALUES
('SKU001', 'D001', 'S001', 'Shirt', 'L', 'Blue', 1200.50, 50, 800),
('SKU002', 'D002', 'S002', 'Pants', 'M', 'Black', 1500.00, 40, 1000),
('SKU003', 'D003', 'S003', 'Jacket', 'XL', 'Green', 2500.75, 20, 1700),
('SKU004', 'D004', 'S004', 'Shoes', '42', 'Red', 3000.00, 15, 2000),
('SKU005', 'D005', 'S005', 'Hat', 'One Size', 'White', 500.99, 60, 300),
('SKU006', 'D006', 'S006', 'T-Shirt', 'M', 'Yellow', 999.00, 80, 600)
;


INSERT INTO PlatformPricing (SKU, PlatformName, PlatformMRP)
VALUES
('SKU001', 'Amazon', 1200.50),
('SKU002', 'Flipkart', 1500.00),
('SKU003', 'Website', 2500.75),
('SKU004', 'Amazon', 3000.00),
('SKU005', 'Flipkart', 500.99),
('SKU006', 'Amazon', 999.00);

INSERT INTO Expense (ExpenseDate, Amount, Category, Description)
VALUES
('2024-09-01', 5000.00, 'Marketing', 'Facebook Ads'),
('2024-09-02', 3000.00, 'Shipping', 'Courier Costs for September'),
('2024-09-03', 2000.00, 'Office Supplies', 'Purchased Stationery'),
('2024-09-04', 4000.00, 'Salaries', 'September Employee Salaries'),
('2024-09-05', 2500.00, 'Marketing', 'Google Ads Campaign'),
('2024-09-06', 1500.00, 'Miscellaneous', 'Office Cleaning Services')
;






