-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 12.10.2023
-- Description:	INSERT Contact
-- =============================================
CREATE PROCEDURE UpdateContact 
	@id UNIQUEIDENTIFIER,
	@firstname VARCHAR(20),
	@lastname VARCHAR(20),
	@cellnumber VARCHAR(20),
	@rowcount INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[contact]
            SET    id = @id,
				   firstname = @firstname,
                   lastname = @lastname,
                   cellnumber = @cellnumber
            WHERE  id = @id
	SET @rowcount = @@ROWCOUNT
END