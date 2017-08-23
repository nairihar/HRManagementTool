CREATE PROCEDURE dbo.uspInsertEvaluationForm
	@notes VARCHAR(8000),
	@jsonData NVARCHAR(4000),
	@employeeId INT,
	@scheduleIntervieweId INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		DECLARE @evalFormId INT

		INSERT INTO dbo.EvaluationForm (Notes, JSONData, EmployeeId, ScheduleIntervieweId)
		VALUES (@notes, @jsonData, @employeeId, @scheduleIntervieweId)

		SET @evalFormId = SCOPE_IDENTITY();

		RETURN @evalFormId 
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


