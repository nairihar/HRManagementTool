CREATE PROCEDURE dbo.uspInsertEmployee
	@E EmployeeType READONLY
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		DECLARE @EmployeeId INT

		INSERT INTO dbo.Employee (FirstName, LastName, UserName, PasswordHash, CreatedBy, PositionId, RoleId)
		SELECT TOP 1 *
		FROM @E

		SET @EmployeeId = SCOPE_IDENTITY();

		RETURN @EmployeeId 
	END	 TRY
	BEGIN CATCH
		DECLARE @Number INT;
		DECLARE @Severity INT;
		DECLARE @State INT;
		DECLARE @Procedure VARCHAR(255);
		DECLARE @Line INT;
		DECLARE @Message VARCHAR(8000);

		SELECT @Number = ERROR_NUMBER(),
			   @Severity = ERROR_SEVERITY(),
			   @State = ERROR_STATE(),
			   @Procedure = ERROR_PROCEDURE(),
			   @Line = ERROR_LINE(),
			   @Message = ERROR_MESSAGE();

		exec dbo.InsertError @Number, @Severity, @State, @Procedure, @Line, @Message

		RETURN -1

	END CATCH
END;