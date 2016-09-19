USE TestDB
-- Example of many to many scenario include Store to Manager where company allows managers to switch stores
-- Another example is customer support call and tickets, one call can result in many tickets opened

-- This table will hold our phone calls.
CREATE TABLE dbo.PhoneCalls
(
   ID INT IDENTITY(1, 1) NOT NULL,
   CallTime DATETIME NOT NULL DEFAULT GETDATE(),
   CallerPhoneNumber CHAR(10) NOT NULL
)

-- This table will hold our "tickets" (or cases).
CREATE TABLE dbo.Tickets
(
   ID INT IDENTITY(1, 1) NOT NULL,
   CreatedTime DATETIME NOT NULL DEFAULT GETDATE(),
   Subject VARCHAR(250) NOT NULL,
   Notes VARCHAR(8000) NOT NULL,
   Completed BIT NOT NULL DEFAULT 0
)

-- This table will link a phone call with a ticket, called a linker or junction table
CREATE TABLE dbo.PhoneCalls_Tickets
(
   PhoneCallID INT NOT NULL,
   TicketID INT NOT NULL
)

-- A linker table (a table of IDs from two other tables for the purpose of a many-to-many relationship) 
-- is always unique whether you look at it from left to right or right to left. Meaning, PhoneCallID_TicketID 
-- is unique and TicketID_PhoneCallID is also unique, so we can add another unique index to the table!