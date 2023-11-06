/********************************************************************************************************************************
Tables in data warehousing, general concepts available here: https://learn.microsoft.com/en-us/fabric/data-warehouse/tables

Data type and size are foundamental when talking about performance.
With this script we create a set of tables with optimized data type and size.
https://learn.microsoft.com/en-us/fabric/data-warehouse/data-types
https://learn.microsoft.com/en-us/fabric/data-warehouse/tsql-surface-area

Then, we ingest data using T-SQL code and the 3 part names [DB].[Schema].[Table name]
All lakehouses and warehouses in the same workspace are accessible this way.

With this script you create the dimension tables in the sales schema with some data transformation.

********************************************************************************************************************************/
CREATE SCHEMA sales
GO

CREATE TABLE [sales].[dimension_date](
	[Date] [datetime2](6) NULL,
	[DayNumber] [int] NULL,
	[Day] [int] NULL,
	[Month] [varchar](15) NULL,
	[ShortMonth] [varchar](5) NULL,
	[CalendarMonthNumber] [int] NULL,
	[CalendarMonthLabel] [varchar](15) NULL,
	[CalendarYear] [int] NULL,
	[CalendarYearLabel] [varchar](15) NULL,
	[FiscalMonthNumber] [int] NULL,
	[FiscalMonthLabel] [varchar](15) NULL,
	[FiscalYear] [int] NULL,
	[FiscalYearLabel] [varchar](15) NULL,
	[ISOWeekNumber] [int] NULL
)
GO

CREATE TABLE [sales].[dimension_city](
	[CityKey] [int] NULL,
	[WWICityID] [int] NULL,
	[City] [varchar](50) NULL,
	[StateProvince] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Continent] [varchar](25) NULL,
	[SalesTerritory] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Subregion] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[LatestRecordedPopulation] [bigint] NULL,
    [IsActive] [bit],
	[LineageKey] [int] NULL
) 
GO

CREATE TABLE [sales].[dimension_customer](
	[CustomerKey] [varchar](15) NULL,
	[WWICustomerID] [bigint] NULL,
	[Customer] [varchar](125) NULL,
	[BillToCustomer] [varchar](125) NULL,
	[Category] [varchar](125) NULL,
	[BuyingGroup] [varchar](50) NULL,
	[PrimaryContact] [varchar](50) NULL,
	[PostalCode] [varchar](10) NULL,
    [IsActive] [bit],
	[LineageKey] [bigint] NULL
) 



CREATE TABLE [sales].[dimension_employee](
	[EmployeeKey] [int] NULL,
	[WWIEmployeeID] [int] NULL,
	[Employee] [varchar](50) NULL,
	[PreferredName] [varchar](50) NULL,
	[IsSalesperson] [bit] NULL,
    [IsActive] [bit],
	[LineageKey] [int] NULL
) 
GO

CREATE TABLE [sales].[dimension_stock_item](
	[StockItemKey] [int] NULL,
	[WWIStockItemID] [int] NULL,
	[StockItem] [varchar](125) NULL,
	[Color] [varchar](25) NULL,
	[SellingPackage] [varchar](50) NULL,
	[BuyingPackage] [varchar](50) NULL,
	[Brand] [varchar](125) NULL,
	[Size] [varchar](50) NULL,
	[LeadTimeDays] [int] NULL,
	[QuantityPerOuter] [int] NULL,
	[IsChillerStock] [bit] NULL,
	[Barcode] [varchar](50) NULL,
	[TaxRate] [decimal](18, 3) NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[RecommendedRetailPrice] [decimal](18, 2) NULL,
	[TypicalWeightPerUnit] [decimal](18, 3) NULL,
	[IsActive] [bit],
	[LineageKey] [int] NULL
) 
GO

INSERT INTO [sales].[dimension_date]
SELECT * FROM [Bronze].[dbo].[dimension_date]
GO

INSERT INTO [sales].[dimension_city]
SELECT 
	[CityKey],
	[WWICityID],
	[City],
	[StateProvince],
	[Country],
	[Continent],
	[SalesTerritory],
	[Region],
	[Subregion],
	[Location],
	[LatestRecordedPopulation],
	IIF(CAST(ValidTo AS Date) = CAST('9999-12-31' AS DATE), 1,0) [IsActive],
	[LineageKey]
FROM [Bronze].[dbo].[dimension_city]
GO

INSERT INTO [sales].[dimension_customer]
SELECT
	'C_' + CAST([CustomerKey] AS VARCHAR(15)) [CustomerKey],
	[WWICustomerID],
	[Customer],
	[BillToCustomer],
	[Category],
	[BuyingGroup],
	[PrimaryContact],
	[PostalCode],
	IIF(CAST(ValidTo AS Date) = CAST('9999-12-31' AS DATE), 1,0) [IsActive],
	[LineageKey]
FROM [Bronze].[dbo].[dimension_customer]
GO

INSERT INTO [sales].[dimension_employee]
SELECT
	[EmployeeKey],
	[WWIEmployeeID],
	[Employee],
	[PreferredName],
	[IsSalesperson],
	IIF(CAST(ValidTo AS Date) = CAST('9999-12-31' AS DATE), 1,0) [IsActive],
	[LineageKey]
FROM [Bronze].[dbo].[dimension_employee]
GO

INSERT INTO [sales].[dimension_stock_item]
SELECT
	[StockItemKey],
	[WWIStockItemID],
	[StockItem],
	[Color],
	[SellingPackage],
	[BuyingPackage],
	[Brand],
	[Size],
	[LeadTimeDays],
	[QuantityPerOuter],
	[IsChillerStock],
	[Barcode],
	[TaxRate],
	[UnitPrice],
	[RecommendedRetailPrice],
	[TypicalWeightPerUnit],
	IIF(CAST(ValidTo AS Date) = CAST('9999-12-31' AS DATE), 1,0) [IsActive],
	[LineageKey]
FROM [Bronze].[dbo].[dimension_stock_item]
GO