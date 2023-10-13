-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 12.10.2023
-- Description:	SELECT All contacts
-- =============================================
CREATE PROCEDURE GetContacts
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[contact]
	RETURN;
END