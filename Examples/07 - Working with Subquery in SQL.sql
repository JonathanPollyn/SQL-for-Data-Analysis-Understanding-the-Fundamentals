USE PollynzDataTech
GO
-------------------------------------------
-- Advantage of Subquery
-------------------------------------------
--1.	Data Isolation 
--2.	Improved Readability
--3.	Reuse of Subqueries
--4.	Data Filtering
--5.	Data Comparison
--6.	Aggregation and Calculation
---------------------------------------------------------------
-- Non-Correlated Subquery
---------------------------------------------------------------
/* Write a query to retrieve the names of patients who have at least one prescription 

*/
SELECT 
	first_name, last_name
FROM dbo.Patient
WHERE patient_id IN
	(		
		SELECT DISTINCT
			 patient_id
		FROM dbo.Prescription
	);

SELECT 
	pa.first_name, pa.last_name
FROM dbo.Patient AS pa
WHERE patient_id IN
	(		
		SELECT DISTINCT
			 pr.patient_id
		FROM dbo.Prescription AS pr
	);

---------------------------------------------------------------
-- Scalar Subquery:
---------------------------------------------------------------
/* Write a query to retrieve the name of the provider who has the highest number of appointments
*/
SELECT 
	first_name,
	last_name
FROM dbo.Provider
WHERE provider_id = (
				SELECT TOP 1 provider_id
				FROM dbo.Appointment
				GROUP BY provider_id
				ORDER BY COUNT(*) DESC
);

---------------------------------------------------------------
-- Correlated Subquery
---------------------------------------------------------------
/*
Write a query to retrieve patients who are taking 'Ibuprofen' and 'Aspirin'
*/
SELECT 
	pat.first_name,
	pat.last_name
FROM dbo.Patient AS pat
WHERE pat.patient_id IN (
	SELECT 
	pr.patient_id
	FROM dbo.Prescription as pr
	WHERE pr.medication_name IN ('Aspirin','Ibuprofen')
);

---------------------------------------------------------------
-- Subquery in SELECT Clause:
---------------------------------------------------------------

/* Write a query to retrieve a list of providers and the number of prescriptions they have written.

*/

SELECT 
	first_name,
	last_name,
	(
		SELECT COUNT(*) 
		FROM dbo.Prescription AS pr
		WHERE pr.provider_id = pro.provider_id
	) AS NumberOfPrescription
FROM dbo.Provider AS pro;


