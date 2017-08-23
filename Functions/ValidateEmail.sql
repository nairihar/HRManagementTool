CREATE FUNCTION dbo.fnValidateEmail (
	@email VARCHAR(254)
)
RETURNS BIT
AS
BEGIN
RETURN (
SELECT
	CASE 
		WHEN 	@Email IS NULL THEN 0
		WHEN	CHARINDEX(' ', @email) 	<> 0 OR
				CHARINDEX('/', @email) 	<> 0 OR
				CHARINDEX(':', @email) 	<> 0 OR
				CHARINDEX(';', @email) 	<> 0 THEN 0
		WHEN LEN(@Email)-1 <= CHARINDEX('.', @Email) THEN 0
		WHEN 	@Email LIKE '%@%@%' OR 
				@Email NOT LIKE '%@%.%'  THEN 0
		ELSE 1
	END
)
END