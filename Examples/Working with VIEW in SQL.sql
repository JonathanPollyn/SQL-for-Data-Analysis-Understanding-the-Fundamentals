USE PollynzDataTech
GO

CREATE VIEW dbo.vPatientExtractionReport
AS
	SELECT 
	first_name,
	last_name,
	date_of_birth,
	gender,
	phone_number
FROM dbo.Patient
GO
-- ALTER A VIEW
ALTER VIEW dbo.vPatientExtractionReport
AS
	SELECT 
	first_name,
	last_name,
	date_of_birth,
	gender,
	phone_number,
	email_address
FROM dbo.Patient
GO
-- VIEW OPTIONS
-- SELECTING THE DEFINATION OF AN OBJECT
SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.vPatientExtractionReport')) GO

-- RECREATE VIEW WITH ENCRYPTION OPTION
ALTER VIEW dbo.vPatientExtractionReport WITH ENCRYPTION
AS
	SELECT 
	first_name,
	last_name,
	date_of_birth,
	gender,
	phone_number,
	email_address
FROM dbo.Patient
GO
SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.vPatientExtractionReport')) GO

SELECT *
FROM dbo.vPatientExtractionReport
GO
-- CREATING A VIEW WITH THE SCHEMABINDING OPTION
CREATE VIEW dbo.vPatientExtraction WITH SCHEMABINDING
AS
	SELECT 
	first_name,
	last_name,
	date_of_birth,
	gender,
	phone_number,
	email_address
FROM dbo.Patient
GO

SELECT *
FROM dbo.vPatientExtraction

SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.vPatientExtraction'))

ALTER TABLE dbo.Patient DROP COLUMN first_name

-- 