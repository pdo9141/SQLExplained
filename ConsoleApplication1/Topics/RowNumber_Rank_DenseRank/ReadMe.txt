01) Returns the sequential number of a row starting at 1
02) ORDER BY clause is required
03) PARTITION BY clause is optional
04) When the data is partitioned, row number is reset to 1 when the partition changes
05) One use case is to delete all duplicates from a table

Similarities between RANK, DENSE_RANK and ROW_NUMBER
01) Returns an increasing integer value starting at 1 based on the ordering of rows imposed by the ORDER BY clause (if there are no ties)
02) ORDER BY clause is required
03) PARTITION BY clause is optional
04) When the data is partitioned, the integer value is reset to 1 when the partition changes

Difference between RANK, DENSE_RANK and ROW_NUMBER functions
01) ROW_NUMBER : Returns an increasing unique number for each row starting at 1, even if there are duplicates.
02) RANK : Returns an increasing unique number for each row starting at 1. When there are duplicates, same rank 
	is assigned to all the duplicate rows, but the next row after the duplicate rows will have the rank it would have been assigned 
	if there had been no duplicates. So RANK function skips rankings if there are duplicates.
03) DENSE_RANK : Returns an increasing unique number for each row starting at 1. When there are duplicates, same rank is assigned to all 
	the duplicate rows but the DENSE_RANK function will not skip any ranks. This means the next row after the duplicate rows will have the next rank in the sequence.