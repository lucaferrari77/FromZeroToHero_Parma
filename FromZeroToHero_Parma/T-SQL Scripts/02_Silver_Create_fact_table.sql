/********************************************************************************************************************************
Tables in data warehousing, general concepts available here: https://learn.microsoft.com/en-us/fabric/data-warehouse/tables

Data type and size are foundamental when talking about performance.
With this script we create a set of tables with optimized data type and size.
https://learn.microsoft.com/en-us/fabric/data-warehouse/data-types
https://learn.microsoft.com/en-us/fabric/data-warehouse/tsql-surface-area

Then, we ingest data using T-SQL code and the 3 part names [DB].[Schema].[Table name]
All lakehouses and warehouses in the same workspace are accessible this way.

With this script you are creating the Fact table in the sales schema

********************************************************************************************************************************/

CREATE TABLE sales.fact_sale
AS
SELECT
    'V_' + CAST(SaleKey AS VARCHAR(12)) SaleKey,
    CityKey,
    'C_' + CAST(CustomerKey AS VARCHAR(12)) CustomerKey,
    BillToCustomerKey,
    StockItemKey,
    InvoiceDateKey,
    DeliveryDateKey,
    SalespersonKey,
    WWIInvoiceID,
    Quantity,
    UnitPrice,
    TaxRate,
    TotalExcludingTax,
    TaxAmount,
    Profit,
    TotalIncludingTax,
    TotalDryItems,
    TotalChillerItems,
    LineageKey,
    Year,
    Quarter,
    Month
FROM Bronze.dbo.fact_sale
GO


