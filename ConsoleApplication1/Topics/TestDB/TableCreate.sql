USE TestDB
CREATE TABLE dbo.Customers
(
   ID INT IDENTITY(1, 1) NOT NULL,
   FirstName VARCHAR(50) NOT NULL,
   LastName VARCHAR(50) NOT NULL,
   Address VARCHAR(100) NOT NULL,
   City VARCHAR(50) NOT NULL,
   State CHAR(2) NOT NULL,
   Zip CHAR(5) NOT NULL
)

-- We will keep the products table simple as well.
CREATE TABLE dbo.Products
(
   ID INT IDENTITY(1, 1) NOT NULL,
   Name VARCHAR(50) NOT NULL,
   Price DECIMAL(8,2) NOT NULL,
   Description VARCHAR(1000) NOT NULL
)

-- Because we want a customer to be able to order many items
-- at a time, we are going to need to know about the order
-- itself, and each item that was ordered.
CREATE TABLE dbo.Orders
(
   ID INT IDENTITY(1, 1) NOT NULL,
   CustomerID INT NOT NULL,
   OrderTime DATETIME NOT NULL DEFAULT GETDATE()
)

CREATE TABLE dbo.OrderItems
(
   ID INT IDENTITY(1, 1) NOT NULL,
   OrderID INT NOT NULL,
   ProductID INT NOT NULL,
   Quantity INT NOT NULL
)
