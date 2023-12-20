-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 18.12.2023
-- Description:	UPDATE Contact
-- =============================================
CREATE   PROCEDURE [dbo].[UpdateContact] 
	@id UNIQUEIDENTIFIER,
	@firstname VARCHAR(20),
	@lastname VARCHAR(20),
	@cellnumber VARCHAR(20),
	@email VARCHAR(20),
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
                   cellnumber = @cellnumber,
				   email = @email
            WHERE  id = @id
	SET @rowcount = @@ROWCOUNT
	if(@rowcount = 0)
	BEGIN
	EXECUTE [dbo].[InsertContact] @firstname, @lastname, @cellnumber, @email, @rowcount OUTPUT
	END
END