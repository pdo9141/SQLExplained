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