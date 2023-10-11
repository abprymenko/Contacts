USE [Contact]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 11.10.2023
-- Description:	CRUD INSERT
-- =============================================
CREATE PROCEDURE [dbo].[InsertContact] 
	@firstname VARCHAR(20),
	@lastname VARCHAR(20),
	@cellnumber VARCHAR(20),
	@rowcount INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [dbo].[contact] (firstname, lastname, cellnumber)
            VALUES(@firstname, @lastname, @cellnumber)
	SET @rowcount = @@ROWCOUNT
END
GO


