CREATE FUNCTION dbo.fnValidateJSON (
	@jsonData VARCHAR(max)
)
RETURNS BIT
AS
BEGIN
RETURN (
	SELECT ISJSON(@jsonData)
)
END