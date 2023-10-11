USE [Contact]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 11.10.2023
-- Description:	CRUD DELETE
-- =============================================
CREATE PROCEDURE [dbo].[DeleteContact] 
	@id UNIQUEIDENTIFIER,
	@rowcount INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM [dbo].[contact]
            WHERE  id = @id
	SET @rowcount = @@ROWCOUNT
END
GO