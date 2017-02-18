01) This tool specifically targets indexes. This is important because generally speaking too many indexes on high insert/delete databases
	will slow these writes down considerably, while tables with no indexes will perform writes easily and perform very bad reads
02) You get this free in SQL Server 2012 and up
03) You can query and analyze the execution plans directly. This means you can run this in production without issue whereas using
	SQL Profiler incurs a 5% performance overhead. Keep in mind though that when the SQL Server gets restarted the execution plans go away.
04) Usual links
	https://www.brentozar.com/blitzindex/
	https://ola.hallengren.com/sql-server-index-and-statistics-maintenance.html
