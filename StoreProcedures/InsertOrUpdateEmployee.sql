CREATE PROCEDURE dbo.uspInsertOrUpdateEmployee
	@Id INT,
	@E EmployeeType READONLY
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		DECLARE @EmployeeId INT

		IF @Id IS NOT NULL
			BEGIN
				UPDATE e
				SET e.FirstName = isnull(ve.FirstName, e.FirstName),
					e.LastName = isnull(ve.LastName, e.LastName),
					e.UserName = isnull(ve.UserName, e.UserName),
					e.RoleId = isnull(ve.RoleId, e.RoleId),
					e.PositionId = isnull(ve.PositionId, e.PositionId)
				FROM dbo.Employee e
				INNER JOIN (select *, @Id AS Id FROM @E) ve
				ON ve.Id = e.Id

				SET @EmployeeId = @Id
			END;
		ELSE
			BEGIN
				INSERT INTO dbo.Employee (FirstName, LastName, UserName, PasswordHash, CreatedBy, PositionId, RoleId)
				SELECT TOP 1 * FROM @E

				SET @EmployeeId = SCOPE_IDENTITY();
			END;		

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