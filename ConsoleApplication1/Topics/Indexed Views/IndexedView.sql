CREATE VIEW vWTotalSalesByProduct
WITH SCHEMABINDING
AS
SELECT
	Name
	, SUM(ISNULL((QuantitySold * UnitPrice), 0)) AS TotalSales
	, COUNT_BIG(*) AS TotalTransactions
FROM dbo.ProductSales
JOIN dbo.Products ON dbo.Products.ProductId = dbo.ProductSales.ProductId
GROUP BY Name

CREATE UNIQUE CLUSTERED INDEX UIX_vWTotalSalesByProduct_Name ON vWTotalSalesByProduct(Name)