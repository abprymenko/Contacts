-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 12.10.2023
-- Description:	DELETE Contact
-- =============================================
CREATE PROCEDURE DeleteContact 
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