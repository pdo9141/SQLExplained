USE TestDB
CREATE TABLE dbo.Suppliers
(
   SupplierId INT IDENTITY(1, 1) NOT NULL,
   SupplierName VARCHAR(50)
)

CREATE TABLE dbo.SupplierOrders
(
   ID BIGINT IDENTITY(1, 1) NOT NULL,
   OrderId BIGINT NOT NULL,
   SupplierId INT NOT NULL,
   OrderDate DATETIME NOT NULL
)

INSERT INTO Suppliers VALUES ('IBM')
INSERT INTO Suppliers VALUES ('Hewlett Packard')
INSERT INTO Suppliers VALUES ('Microsof')
INSERT INTO Suppliers VALUES ('NVIDIA')

INSERT INTO SupplierOrders (OrderId, SupplierId, OrderDate) VALUES (500125, 1, '10/10/1978')
INSERT INTO SupplierOrders (OrderId, SupplierId, OrderDate) VALUES (500126, 2, '03/23/2009')
INSERT INTO SupplierOrders (OrderId, SupplierId, OrderDate) VALUES (500127, 5, '11/11/2010')

SELECT
	s.SupplierId,
	s.SupplierName,
	o.OrderDate
FROM Suppliers s WITH (NOLOCK)
INNER JOIN SupplierOrders o WITH (NOLOCK) ON o.SupplierId = s.SupplierId

-- LEFT OUTER JOIN = LEFT JOIN
SELECT
	s.SupplierId,
	s.SupplierName,
	o.OrderDate
FROM Suppliers s WITH (NOLOCK)
LEFT OUTER JOIN SupplierOrders o WITH (NOLOCK) ON o.SupplierId = s.SupplierId

SELECT
	s.SupplierId,
	s.SupplierName,
	o.OrderDate
FROM Suppliers s WITH (NOLOCK)
LEFT JOIN SupplierOrders o WITH (NOLOCK) ON o.SupplierId = s.SupplierId

-- RIGHT OUTER JOIN = RIGHT JOIN
SELECT
	s.SupplierId,
	s.SupplierName,
	o.OrderDate
FROM Suppliers s WITH (NOLOCK)
RIGHT OUTER JOIN SupplierOrders o WITH (NOLOCK) ON o.SupplierId = s.SupplierId

SELECT
	s.SupplierId,
	s.SupplierName,
	o.OrderDate
FROM Suppliers s WITH (NOLOCK)
RIGHT JOIN SupplierOrders o WITH (NOLOCK) ON o.SupplierId = s.SupplierId

SELECT
	s.SupplierId,
	s.SupplierName,
	o.OrderDate
FROM Suppliers s WITH (NOLOCK)
FULL OUTER JOIN SupplierOrders o WITH (NOLOCK) ON o.SupplierId = s.SupplierId