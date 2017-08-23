CREATE PROCEDURE dbo.uspEditScheduleInterviewer
	@employeeId INT,
	@scheduleId INT,
	@status TINYINT,
	@note VARCHAR(1000)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE dbo.ScheduleInterviewer
		SET [Status] = @Status,
			Note = @Note,
			ModifedDate = GETDATE()
		WHERE ScheduleId = @scheduleId
		  AND EmployeeId = @employeeId

		RETURN @employeeId 
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
