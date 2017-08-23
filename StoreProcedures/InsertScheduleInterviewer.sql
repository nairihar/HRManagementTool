CREATE PROCEDURE dbo.uspInsertScheduleInterviewer
	@scheduleInterviewId INT,
	@employeeId INT,
	@createdBy INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		DECLARE @ScheduleInterviewerId INT

		INSERT INTO dbo.ScheduleInterviewer (ScheduleId, EmployeeId, CreatedBy)
		VALUES (@scheduleInterviewId, @employeeId, @createdBy)

		SET @ScheduleInterviewerId = SCOPE_IDENTITY();

		RETURN @ScheduleInterviewerId 
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