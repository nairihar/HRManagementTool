CREATE PROCEDURE dbo.uspGetTestGradeByCandidateId
    @candidateId INT
AS
BEGIN
	SELECT Score AS score
	FROM dbo.TestGrade
	WHERE CandidateId = @candidateId
END;