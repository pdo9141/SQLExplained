CREATE TABLE dbo.Index_Utiliztion_Details
	(	Index_Utiliztion_Metrics_Id INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Index_Utiliztion_Metrics PRIMARY KEY CLUSTERED,
		Index_Utiliztion_Details_Create_Datetime DATETIME NOT NULL,
		[Database_Name] SYSNAME,
		[Schema_Name] SYSNAME,
		Table_Name SYSNAME,
		Index_Name SYSNAME,
		User_Seek_Count BIGINT,
		User_Scan_Count BIGINT,
		User_Lookup_Count BIGINT,
		User_Update_Count BIGINT,
		Last_User_Seek DATETIME,
		Last_User_Scan DATETIME,
		Last_User_Lookup DATETIME,
		Last_User_Update DATETIME,
	);
CREATE NONCLUSTERED INDEX IX_Index_Utiliztion_Details_indexUtiliztionDetailsCreateDatetime ON dbo.Index_Utiliztion_Details (Index_Utiliztion_Details_Create_Datetime);