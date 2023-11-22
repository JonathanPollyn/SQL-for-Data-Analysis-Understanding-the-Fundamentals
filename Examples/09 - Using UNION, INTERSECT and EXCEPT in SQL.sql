USE PollynzDataTech
GO

--RULES
-- 1. Columns from all of the resultset are equal
-- 2. The datatypes from the result should be compatiable
-- 3. The columns that is displayed are one onces that appears on the first query
-- 4. No individual result is allowed to have an order by 

/*
Retrieve the first name and last name associated with both patients and providers.
*/
SELECT 
	first_name,
	last_name	
FROM dbo.Patient
UNION
SELECT 
	first_name ,
	last_name 
FROM dbo.Provider
ORDER BY first_name



/*
Find the common addresses shared between patients and providers.
*/
SELECT 
	AddressID
FROM dbo.Patient
INTERSECT
SELECT 
	AddressID
FROM dbo.Provider

/*
List the addresses that are associated with patients but not with Providers.
*/
SELECT 
	AddressID
FROM dbo.Patient
EXCEPT
SELECT 
	AddressID
FROM dbo.Provider



/*
Get the union of all addresses associated with patients, medical staff, and providers.
*/
SELECT 
	AddressID
FROM dbo.Patient
UNION
SELECT 
	AddressID
FROM dbo.Provider
UNION
SELECT 
	AddressID
FROM dbo.MedicalStaff


SELECT 
	AddressID, 'Patient' AS Label
FROM dbo.Patient
UNION
SELECT 
	AddressID, 'Provider'
FROM dbo.Provider
UNION
SELECT 
	AddressID, 'Staff'
FROM dbo.MedicalStaff
GO

/*
Retrieve all unique addresses associated with patients, medical staff, and providers, 
excluding those patients who have appointments status as completed.
*/
(
SELECT 
	AddressID
FROM dbo.Patient
UNION
SELECT 
	AddressID
FROM dbo.Provider
UNION
SELECT 
	AddressID
FROM dbo.MedicalStaff  -- 170 rows
)
EXCEPT
SELECT AddressID
FROM dbo.Patient AS pat
JOIN dbo.Appointment AS app
ON pat.patient_id = app.patient_id
WHERE status = 'Completed'  -- 10 ROWS



