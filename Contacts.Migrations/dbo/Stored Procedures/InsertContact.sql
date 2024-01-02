-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 02.01.2023
-- Description:	INSERT Contact
-- =============================================
CREATE PROCEDURE [dbo].[InsertContact] 
	@firstname VARCHAR(20),
	@lastname VARCHAR(20),
	@cellnumber VARCHAR(20),
	@email VARCHAR(20),
	@insertedId UNIQUEIDENTIFIER OUTPUT
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
	CREATE TABLE #TempTable
        (
            Id UNIQUEIDENTIFIER
        );
	INSERT INTO [dbo].[contact] (firstname, lastname, cellnumber, email)
			OUTPUT INSERTED.id INTO #TempTable (Id)
            VALUES(@firstname, @lastname, @cellnumber, @email)
	SELECT TOP 1 @insertedId = Id FROM #TempTable;
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