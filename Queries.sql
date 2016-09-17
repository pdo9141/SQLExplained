USE AdventureWorks2012
--Correlated Subqueries
SELECT 
     SalesOrderID           = soh.SalesOrderID
    ,OrderDate              = soh.OrderDate
    ,MaxUnitPrice           = (SELECT MAX(sod.UnitPrice) FROM Sales.SalesOrderDetail sod WHERE soh.SalesOrderID = sod.SalesOrderID)
FROM Sales.SalesOrderHeader AS soh

--Derived Table
SELECT 
    soh.SalesOrderID
    ,soh.OrderDate
    ,sod.max_unit_price
FROM Sales.SalesOrderHeader AS soh
JOIN
(
    SELECT 
        max_unit_price = MAX(sod.UnitPrice),
        SalesOrderID
    FROM Sales.SalesOrderDetail AS sod
    GROUP BY sod.SalesOrderID
) sod
ON sod.SalesOrderID = soh.SalesOrderID

--Cross Apply
SELECT 
    soh.SalesOrderID
    ,soh.OrderDate
    ,sod.max_unit_price
FROM Sales.SalesOrderHeader AS soh
CROSS APPLY
(
    SELECT 
        max_unit_price = MAX(sod.UnitPrice)
    FROM Sales.SalesOrderDetail AS sod
    WHERE soh.SalesOrderID = sod.SalesOrderID
) sod