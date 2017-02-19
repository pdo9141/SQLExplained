USE TestDB
--CREATE TABLE dbo.Employees
--(
--	Name VARCHAR(50) NOT NULL,
--	Gender VARCHAR(20) NOT NULL,
--	Salary INT NOT NULL
--)

--INSERT INTO Employees VALUES ('Mark', 'Male', 5000)
--INSERT INTO Employees VALUES ('John', 'Male', 4500)
--INSERT INTO Employees VALUES ('Pam', 'Female', 5500)
--INSERT INTO Employees VALUES ('Sara', 'Female', 4000)
--INSERT INTO Employees VALUES ('Todd', 'Male', 3500)
--INSERT INTO Employees VALUES ('Mary', 'Female', 5000)
--INSERT INTO Employees VALUES ('Ben', 'Male', 6500)
--INSERT INTO Employees VALUES ('Jodi', 'Female', 7000)
--INSERT INTO Employees VALUES ('Tom', 'Male', 5500)
--INSERT INTO Employees VALUES ('Ron', 'Male', 5000)

CREATE TABLE Employees
(
     ID INT,
     FirstName NVARCHAR(50),
     LastName NVARCHAR(50),
     Gender NVARCHAR(50),
     Salary INT
)
GO

INSERT INTO Employees VALUES (1, 'Mark', 'Hastings', 'Male', 60000)
INSERT INTO Employees VALUES (1, 'Mark', 'Hastings', 'Male', 60000)
INSERT INTO Employees VALUES (1, 'Mark', 'Hastings', 'Male', 60000)
INSERT INTO Employees VALUES (2, 'Mary', 'Lambeth', 'Female', 30000)
INSERT INTO Employees VALUES (2, 'Mary', 'Lambeth', 'Female', 30000)
INSERT INTO Employees VALUES (3, 'Ben', 'Hoskins', 'Male', 70000)
INSERT INTO Employees VALUES (3, 'Ben', 'Hoskins', 'Male', 70000)
INSERT INTO Employees VALUES (3, 'Ben', 'Hoskins', 'Male', 70000)