01) A standard or non-indexed view is just a stored SQL query. When we retrieve data from the view, the data is retrieved from the 
	underlying base tables. So, a view is just a virtual table, it does not store any data, by default. However, when you create
	an index on a view, the view gets materialized. This means, the view is now capable of storing data.		
02) View should be created with SchemaBinding option
03) If an Aggregate function in the SELECT LIST, references an expression, and if there is a possibility for that expression
	to become NULL, then a replacement value should be specified
04) If GROUP BY is specified, the view select list must contain a COUNT_BIG(*) expression
05) The base tables in the view, should be referenced with 2 part name (schema.tablename)
06) Indexes on views are only suitable where the data is not changed heavily (OLAP environment), do not use in OLTP environment