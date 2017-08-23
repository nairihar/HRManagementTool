CREATE PROCEDURE dbo.uspInsertRoleType
	@role VARCHAR(255),
	@createdBy INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		DECLARE @RoleTypeId INT

		INSERT INTO dbo.RoleTypes([Role], CreatedBy)
		VALUES (@role, @createdBy)

		SET @RoleTypeId = SCOPE_IDENTITY();

		RETURN @RoleTypeId 
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