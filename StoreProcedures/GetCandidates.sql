CREATE PROCEDURE dbo.uspGetCandidates
AS
BEGIN
	SELECT Id AS id,
	       FirstName AS firstName,
		   LastName AS lastName,		   
		   PhoneNumber AS phone,
		   Email AS email,
		   [Address] AS [address],
		   CV AS cv,
		   PositionId AS positionId,
		   RoleId AS roleId,
		   StatusId AS statusId
	FROM dbo.Candidate
END;