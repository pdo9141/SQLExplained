﻿USE TestDB
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ScheduledTasks] (
	[TaskId] [UNIQUEIDENTIFIER] NOT NULL,
	[ProcessAction] [VARCHAR](100) NOT NULL,
	[ServiceRequest] [XML] NOT NULL,
	[LockId] [UNIQUEIDENTIFIER] NULL,
	[OwnedUntil] [DATETIME] NULL,
	[ReleaseLockIn] [INT] NOT NULL,
	[DateCreated] [DATETIME] NOT NULL,
	[MachineName] [VARCHAR](200) NULL,
	[ActivateAt] [DATETIME] NULL,
	[RescheduleAfterProcessing] [BIT] NULL,
	[RescheduleInterval] [BIGINT] NULL,
	[RescheduleDayOfMonth] [INT] NULL,
	[DeleteOnInsertIdentifier] [UNIQUEIDENTIFIER] NULL,
	[ServicePoolName] [VARCHAR](50) NULL,
	[Priority] [BIGINT] NULL,
	[Action] [VARCHAR](200) NULL,
	CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
