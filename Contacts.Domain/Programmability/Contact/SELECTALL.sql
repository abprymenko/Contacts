USE [Contact]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 11.10.2023
-- Description:	CRUD SELECT ALL
-- =============================================
CREATE PROCEDURE [dbo].[GetContacts]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[contact] as c
	RETURN;
END
GO


