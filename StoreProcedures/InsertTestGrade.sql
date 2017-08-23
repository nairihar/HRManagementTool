CREATE PROCEDURE dbo.uspInsertTestGrade
	@score TINYINT,
    @scheduleId  INT,
    @candidateId INT,
    @createdBy INT 
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		DECLARE @testGradeId INT

		INSERT INTO dbo.TestGrade (Score, ScheduleId, CandidateId, CreatedBy)
		VALUES (@score, @scheduleId, @candidateId, @createdBy)

		SET @testGradeId = SCOPE_IDENTITY();

		RETURN @testGradeId 
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