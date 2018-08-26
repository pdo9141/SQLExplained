01) See Tuning Advisor folder
02) An important indicator is logical reads, try to get that down with proper indexes
03) Use covering indexes (include keyword) to help with key lookups in execution plan
04) Don't go too wild, if your app is write heavy then minimize your indexes
05) Avoid NOT IN, it's better to use LEFT JOIN and check for NULL to help performance
06) Avoid OR conditions in JOINs and WHERE clauses if possible
07) Avoid functions in JOINs and WHERE (e.g., LEFT, LEN, SUBSTRING, etc.), these may force an index scan.
    Instead of "WHERE LEFT(Person.LastName, 3) = 'For'" use "WHERE Person.LastName LIKE 'For%'" instead
08) Implicit Conversions: When SQL Server compares any values, it needs to reconcile data types. Some conversions can occur seamlessly,
    without any performance impact. But others like comparing NVARCHAR to INT may force index scan. Compare the right data types!    