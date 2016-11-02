DECLARE @OrderId BIGINT = NULL,
		@PageNumber INT = 1,
		@PageSize INT = 10

DECLARE @RowStart INT, @RowEnd INT
SET @PageNumber = @PageNumber - 1
SET @RowStart = @PageSize * @PageNumber + 1
SET @RowEnd = @RowStart + @PageSize - 1

WITH ResultCTE AS (
	SELECT
		ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber,
		Id,
		AppId,
		OrderId,
		ClientId
	FROM FakeTable WITH (NOLOCK)
	WHERE OrderId = @OrderId
)

SELECT
	TotalRows = (SELECT COUNT(0) FROM ResultCTE),
	*
FROM ResultCTE
WHERE RowNumber >= @RowStart AND RowNumber <= @RowEnd