-- WE WANT QUERY OF LATEST PURCHASE MADE BY ALL CUSTOMERS

-- This is no good, every column added to GROUP BY clause is going to cause more and more strain on SQL
-- As each record comes in, SQL has to check to see if there is already a record with the same ID, FirstName,
-- LastName, Address, City, State, and Zip
SELECT
	Customers.*
	MAX(Orders.OrderTime) AS LatestOrderTime
FROM dbo.Customers
INNER JOIN dbo.Orders ON Customers.ID = Orders.CustomerID
GROUP By Customers.ID, Customers.FirstName, Customers.LastName, Customers.Address, Customers.City, Customers.State, Customers.Zip


-- You can leverage a CTE (Common Table Expressions) to help improve performance
-- One thing to note that the CTE can only be used once in your query. 
-- So you can't declare your CTE at the top, then do multiple queries against it.
WITH LatestOrders (ID) AS (SELECT MAX(ID) FROM dbo.Orders GROUP By CustomerID)

-- Only retrieve the records that are in the "LatestOrders" CTE
SELECT
	Customers.*,
	Orders.OrderTime AS LatestOrderTime
FROM dbo.Customers 
INNER JOIN dbo.Orders ON Customers.ID = Orders.CustomerID
WHERE Orders.ID IN (SELECT ID FROM LatestOrders)

-- You can also do this the old fashion way witbout CTE (introduced in SQL Server 2005)
SELECT
	Customers.*,
	Orders.OrderTime AS LatestOrderTime
FROM dbo.Customers 
INNER JOIN dbo.Orders ON Customers.ID = Orders.CustomerID
WHERE Orders.ID IN (SELECT MAX(ID) FROM dbo.Orders GROUP BY CustomerID)

-- An bad example that returns total sales per customer, in addition to returning the customer's name and address
SELECT
	c.CustomerId, c.CustomerName, c.CustomerType, c.Address1, c.City, c.State, SUM(s.Sales) AS TotalSales
FROM Customers c
INNER JOIN Sales s ON c.CustomerId = s.CustomerId
GROUP BY c.CustomerId, c.CustomerName, c.CustomerType, c.Address1, c.City, c.State

-- You should only be grouping on CustomerID and not on all those other columns
-- Push the grouping down a level, into a derived table
SELECT
	c.CustomerId, c.CustomerName, c.CustomerType, c.Address1, c.City, c.State, s.TotalSales
FROM Customers c
INNER JOIN (
	SELECT 
		CustomerId, SUM(Sales) AS TotalSales
	FROM Sales
	GROUP BY CustomerId
) s ON c.CustomerId = s.CustomerId

-- Bad example of people mimicing the expressions in their SELECT list in the GROUP BY clause
-- Too many people just keep stuffing column names and expressions into the GROUP BY clause until the errors go away.
-- Take a minute to really consider what you need to return and how it should be grouped, and try using derived tables
-- more frequently when writing aggregate queries to help keep them structured and efficient.
SELECT
	LastName + ', ' + FirstName
FROM Names
GROUP By LastName + ', ' + FirstName

-- You should not be grouping by the expression itself; you should be grouping by what is needed
-- to evaluate that expression. The correct grouping is:
GROUP BY LastName, FirstName








