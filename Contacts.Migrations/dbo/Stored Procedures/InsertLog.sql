-- =============================================
-- Author:		Andrii Prymenko
-- Create date: 29.12.2023
-- Description:	INSERT Log
-- =============================================
CREATE PROCEDURE [dbo].[InsertLog] 
	@date DATETIME,
	@thread VARCHAR(255),
    @level VARCHAR (50),
    @logger VARCHAR (255),
    @message VARCHAR (4000),
    @exception VARCHAR (2000),
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
	INSERT INTO [dbo].[log] ([date],[thread],[level],[logger],[message],[exception]) 
			VALUES (@date, @thread, @level, @logger, @message, @exception)
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