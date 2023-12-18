-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 18.12.2023
-- Description:	INSERT Contact
-- =============================================
CREATE PROCEDURE [dbo].[InsertContact] 
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
	INSERT INTO [dbo].[contact] (firstname, lastname, cellnumber, email)
            VALUES(@firstname, @lastname, @cellnumber, @email)
	SET @rowcount = @@ROWCOUNT
END