-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 02.01.2023
-- Description:	SELECT All contacts
-- =============================================
CREATE PROCEDURE [dbo].[GetContacts]
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
	SELECT *
    FROM [dbo].[contact] AS c WITH(NOLOCK)
	ORDER BY c.[firstname]
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