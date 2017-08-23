CREATE PROCEDURE dbo.uspGetCandidateStatusTypes
AS
BEGIN
	SELECT Id AS id,
		   [Status] AS [status]
	FROM dbo.CandidateStatusTypes
END;