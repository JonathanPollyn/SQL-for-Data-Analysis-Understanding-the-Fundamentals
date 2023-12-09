USE PollynzDataTech
GO

-- Common Table Expression
WITH CTE_NAME
AS
(
	INNER QUERY
)
OUTER QUERY
--======================================
;WITH first_CTE
AS
(
	SELECT 
	first_name,
	last_name,
	date_of_birth,
	gender,
	phone_number
FROM dbo.Patient
)
SELECT *
FROM first_CTE
-- LOGICAL PROCESS
SELECT 
	first_name,
	last_name,
	CONCAT(first_name, ' ',last_name ) AS Full_Name,
	date_of_birth,
	gender,
	phone_number
FROM dbo.Patient
where Full_Name = 'John Doe'
-- 1. FROM
-- 2. WHERE
-- 3. GROUP BY
-- 4. HAVING
-- 5. SELECT 
-- ORDER BY
--====================
;WITH second_CTE
AS
(
SELECT 
	first_name,
	last_name,
	CONCAT(first_name, ' ',last_name ) AS Full_Name,
	date_of_birth,
	gender,
	phone_number
FROM dbo.Patient
)
SELECT *
FROM second_CTE
where Full_Name = 'John Doe'
-- All columns must name
-- All column names must be unique
-- Order by is not needed
--NOTE
--==========================================
-- CALLING MULTIPLE CTE
;WITH PATIENT_INFO
AS
(
SELECT 
	patient_id,
	first_name,
	last_name,
	CONCAT(first_name, ' ',last_name ) AS Full_Name,
	date_of_birth,
	gender,
	phone_number
FROM dbo.Patient
), Appointment_Info
AS
(
	SELECT 
	patient_id,
	appointment_date,
	reason_for_visit,  
	status
FROM dbo.Appointment
)
SELECT *
FROM PATIENT_INFO AS P
JOIN Appointment_Info a
ON p.patient_id = a.patient_id


