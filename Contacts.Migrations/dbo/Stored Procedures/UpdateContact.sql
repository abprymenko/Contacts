-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 02.01.2024
-- Description:	UPDATE Contact
-- =============================================
CREATE   PROCEDURE [dbo].[UpdateContact] 
	@id UNIQUEIDENTIFIER,
	@firstname VARCHAR(20),
	@lastname VARCHAR(20),
	@cellnumber VARCHAR(20),
	@email VARCHAR(20),
	@updatedId UNIQUEIDENTIFIER OUTPUT
AS
DECLARE 
        @ErrorNumber     INT,
		@ErrorSeverity   INT,
		@ErrorState		 INT,
		@ErrorMessage    VARCHAR(4000),
		@ErrorLine       INT,
        @ErrorProcedure  VARCHAR(200)
BEGIN TRY
BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [dbo].[contact]
            SET    firstname = @firstname,
                   lastname = @lastname,
                   cellnumber = @cellnumber,
				   email = @email
            WHERE  id = @id
	IF(@@ROWCOUNT = 1)
		BEGIN
		SET @updatedId = @id;
		END
	ELSE
		BEGIN
		EXECUTE [dbo].[InsertContact] @firstname, @lastname, @cellnumber, @email, @updatedId OUTPUT
		END
COMMIT TRANSACTION
END TRY
BEGIN CATCH
SELECT	   @ErrorNumber = ERROR_NUMBER(),
	       @ErrorSeverity = ERROR_SEVERITY(),
		   @ErrorState = ERROR_STATE(),
	 	   @ErrorMessage = N'Error %d, Level %d, State %d, Procedure %s, Line %d, ' + 'Message: '+ ERROR_MESSAGE(),
		   @ErrorLine = ERROR_LINE(),
           @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');
 RAISERROR
        (
        @ErrorMessage, 
        @ErrorSeverity, 
        1,               
        @ErrorNumber,
        @ErrorSeverity,
        @ErrorState,
        @ErrorProcedure,
        @ErrorLine
        );
ROLLBACK TRANSACTION
END CATCH;