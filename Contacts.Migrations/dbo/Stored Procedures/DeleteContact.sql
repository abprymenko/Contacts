-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 02.01.2024
-- Description:	DELETE Contact
-- =============================================
CREATE PROCEDURE [dbo].[DeleteContact] 
	@id UNIQUEIDENTIFIER,
	@rowcount INT = 0 OUTPUT
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
	DELETE FROM [dbo].[contact]
            WHERE  id = @id
	SET @rowcount = @@ROWCOUNT
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