SELECT 
	t.name AS 'Table', 
	SUM(i.user_seeks + i.user_scans + i.user_lookups) AS 'Total accesses',
	SUM(i.user_seeks) AS 'Seeks',
	SUM(i.user_scans) AS 'Scans',
	SUM(i.user_lookups) AS 'Lookups'
FROM sys.dm_db_index_usage_stats i 
RIGHT OUTER JOIN sys.tables t ON (t.object_id = i.object_id)
GROUP BY i.object_id, t.name
ORDER BY [Total accesses] DESC