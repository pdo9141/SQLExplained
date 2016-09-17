USE TestDB
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ScheduledTasks_Sel]
(
	@NumberOfTasks INT,
	@MachineName VARCHAR(200),
	@ServicePoolName VARCHAR(200) = NULL,
	@Priority INT = NULL
)
AS
BEGIN

	DECLARE @m_LockAcquiredDate DATETIME
	SET @m_LockAcquiredDate = GETUTCDATE()

	DECLARE @m_LockId UNIQUEIDENTIFIER
	SET @m_LockId = NEWID()

	UPDATE TOP (@NumberOfTasks) st
	SET
		LockId = @m_LockId,
		OwnedUntil = DATEADD(MILLISECOND, ReleaseLockIn, GETUTCDATE()),
		MachineName = @MachineName
	FROM
		dbo.ScheduledTasks st WITH (ROWLOCK, READPAST, UPDLOCK)
	WHERE
		(LockId IS NULL OR OwnedUntil < @m_LockAcquiredDate)
		AND ActivateAt < GETUTCDATE()
		AND ServicePoolName = ISNULL(@ServicePoolName, ServicePoolName)

	SELECT
		st.TaskId,
		st.ProcessAction,
		st.[Action],
		st.ServiceRequest,
		st.RescheduleAfterProcessing,
		st.RescheduleInterval,
		st.RescheduleDayOfMonth
	FROM dbo.ScheduledTasks st WITH (NOLOCK)
	WHERE LockId = @m_LockId
	ORDER BY DateCreated

END