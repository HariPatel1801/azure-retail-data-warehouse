/*
Project: Azure Retail Data Warehouse using Medallion Architecture
Purpose: Gold-layer Azure SQL tables for dimensions and fact table
*/

-- ============================================================
-- Customer Dimension
-- SCD Type 1 ready: CustomerHash and audit columns included
-- ============================================================
CREATE TABLE dbo.dim_Customers
(
    CustomerKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50),
    CustomerHash VARCHAR(64),
    Created_Date DATETIME2,
    Updated_Date DATETIME2,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100)
);

CREATE UNIQUE INDEX UX_dim_Customers_CustomerID
ON dbo.dim_Customers(CustomerID);

-- ============================================================
-- Product Dimension
-- SCD Type 1 ready: ProductHash, Is_Active and audit columns
-- ============================================================
CREATE TABLE dbo.dim_Products
(
    ProductKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProductID INT NOT NULL,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10,2),
    StockQuantity INT,
    ProductHash VARCHAR(64),
    Is_Active BIT DEFAULT 1,
    Created_Date DATETIME2,
    Updated_Date DATETIME2,
    Created_By VARCHAR(100),
    Updated_By VARCHAR(100)
);

CREATE UNIQUE INDEX UX_dim_Products_ProductID
ON dbo.dim_Products(ProductID);

-- ============================================================
-- Sales Fact Table
-- Stores transactional sales records
-- ============================================================
CREATE TABLE dbo.fact_Sales
(
    SaleKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SaleID INT NOT NULL,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    Created_Date DATETIME2 DEFAULT SYSUTCDATETIME(),
    Created_By VARCHAR(100) DEFAULT 'ADF_Pipeline'
);

CREATE UNIQUE INDEX UX_fact_Sales_SaleID
ON dbo.fact_Sales(SaleID);

ALTER TABLE dbo.fact_Sales
ADD CONSTRAINT FK_fact_Sales_Customers
FOREIGN KEY (CustomerID) REFERENCES dbo.dim_Customers(CustomerID);

ALTER TABLE dbo.fact_Sales
ADD CONSTRAINT FK_fact_Sales_Products
FOREIGN KEY (ProductID) REFERENCES dbo.dim_Products(ProductID);
