CREATE PROCEDURE dbo.uspInsertOrUpdateCandidate
	@Id INT,
	@C CandidateType READONLY
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		DECLARE @CandidateId INT

		IF @Id IS NOT NULL
			BEGIN
				UPDATE c
				SET c.FirstName = isnull(vc.FirstName, c.FirstName),
					c.LastName = isnull(vc.LastName, c.LastName),
					c.Email = isnull(vc.Email, c.Email),
					c.CV = isnull(vc.CV, c.CV),
					c.[Address] = isnull(vc.[Address], c.[Address]),
					c.PhoneNumber = isnull(vc.PhoneNumber, c.PhoneNumber)
				FROM dbo.Candidate c
				INNER JOIN (select *, @Id AS Id FROM @C) vc
				ON vc.Id = c.Id

				SET @CandidateId = @Id
			END;
		ELSE
			BEGIN
				INSERT INTO dbo.Candidate 
				SELECT TOP 1 * FROM @C

				SET @CandidateId = SCOPE_IDENTITY();
			END;		

		RETURN @CandidateId 
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