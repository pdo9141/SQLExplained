https://www.sqlshack.com/query-optimization-techniques-in-sql-server-tips-and-tricks/
https://www.sqlshack.com/sql-server-index-performance-tuning-using-built-in-index-utilization-metrics/
https://www.sqlshack.com/collecting-aggregating-analyzing-missing-sql-server-index-stats/

01) See Tuning Advisor folder
02) An important indicator is logical reads, try to get that down with proper indexes
03) Use covering indexes (include keyword) to help with key lookups in execution plan
04) Don't go too wild, if your app is write heavy then minimize your indexes
05) Avoid NOT IN, it's better to use LEFT JOIN and check for NULL to help performance
06) Avoid OR conditions in JOINs and WHERE clauses if possible. The best way to deal with an OR is to eliminate it (if possible) 
    or break it into smaller queries. Breaking a short and simple query into a longer, more drawn-out query may not seem elegant, 
    but when dealing with OR problems, it is often the best choice (possibly leverage UNION to accomplish  OR avoidance)
07) Avoid functions in JOINs and WHERE (e.g., LEFT, LEN, SUBSTRING, etc.), these may force an index scan.
    Instead of "WHERE LEFT(Person.LastName, 3) = 'For'" use "WHERE Person.LastName LIKE 'For%'" instead
08) Implicit Conversions: When SQL Server compares any values, it needs to reconcile data types. Some conversions can occur seamlessly,
    without any performance impact. But others like comparing NVARCHAR to INT may force index scan. Compare the right data types!    
09) Avoid wildcard string searches (LIKE '%For%').     
10) All tables should have a clustered index and a primary key
11) Avoid joining too many tables, break out into smaller tables and temp tables if necessary
12) Use query hints with absolute caution. Applying a hint to address an edge case may cause performance degradation for all other scenarios
    The general rule of thumb is to apply query hints as infrequently as possible, only after sufficient research has been conducted, 
    and only when we are certain there will be no ill effects of the change
13) Common scenarios in which we might consider removing or altering an index:    
    a) Missing indexes
    b) Unused indexes.
    c) Minimally used indexes.
    d) Indexes that are written to significantly more than they are read.
    e) Indexes that are scanned often, but rarely the target of seeks.
    f) Indexes that are very similar and can be combined.
14) Sys.dm_db_missing_index_details: Provides information on the table affected, and suggested index columns.
    Sys.dm_db_missing_index_group_stats: Returns info on the query cost, number of seeks the index would have resulted in, and some other metrics to gauge effectiveness.
    Sys.dm_db_missing_index_groups: Provides an index_handle, which can be used for joining to other views.    
15) SQL Server provides a dynamic management view that tracks all index usage: sys.dm_db_index_usage_stats
    This view is a cumulative total of operations against indexes and is reset when SQL Server services are restarted.
    Since this data is not maintained by SQL Server indefinitely, we need to create our own storage mechanism 
    to ensure it is persisted through server restarts, allowing us to make smart decisions with a long-term data set.
    In order to collect this data, we will follow a relatively simple process:
    a) Index_Utiliztion_Details: Create a table to store index metrics detail data. This will persist all data from each collection point-in-time 
       and do so for a limited history. This detail can be useful for troubleshooting or seeing the status of an index at a given point-in-time.
    b) Index_Utiliztion_Summary: Create a table to store aggregate index summary data. This provides a long-term view of how indexes have been 
       used since they were created. We can clear this data at any point-in-time if we decide that we’d like to begin counting these metrics anew.
    c) Populate_Index_Utilization_Data: Create and execute a stored procedure that will populate these tables.
        @Retention_Period_for_Detail_Data_Days: The number of days for which data in Index_Utilization_Details will be kept.
        @Truncate_All_Summary_Data: A flag that indicates whether the summary data should be removed so that aggregation can start anew. This could be useful after significant server or application settings in which you want a fresh measure of activity.