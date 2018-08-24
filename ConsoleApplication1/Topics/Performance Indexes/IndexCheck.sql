--Show execution plan
SET STATISTICS IO ON

--Run the query without a proper index
SELECT CustomerKey, FirstName, MiddleName, Lastname
FROM DimCustomer
WHERE FirstName = 'Julio'

--Create the index
CREATE NONCLUSTERED INDEX DemoIndex
ON [dbo].[DimCustomer] ([FirstName])

--Create better index
CREATE NONCLUSTERED INDEX DemoIndex2
ON [dbo].[DimCustomer] ([FirstName])
INCLUDE (Middlename, Lastname)

--Compare indexes
SELECT CustomerKey, FirstName, MiddleName, Lastname
FROM DimCustomer WITH (INDEX(0))
WHERE FirstName = 'Julio'

SELECT CustomerKey, FirstName, MiddleName, Lastname
FROM DimCustomer WITH (INDEX(DemoIndex))
WHERE FirstName = 'Julio'

SELECT CustomerKey, FirstName, MiddleName, Lastname
FROM DimCustomer WITH (INDEX(DemoIndex2))
WHERE FirstName = 'Julio'