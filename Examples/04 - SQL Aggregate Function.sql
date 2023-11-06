USE PollynzDataTech
GO


----------------------------------------------------------
-- Aggregate Function: COUNT(), SUM(), MIN(), MAX() AVG()
----------------------------------------------------------
/*Write a query that will retrieve the total count of registered patients in the system

*/
SELECT COUNT(*) AS PatientsCount
FROM  dbo.Patient

/*
Write a query that will retrieve the total number of appointments for each provider
*/
SELECT COUNT(*) AS TotalAppointments, pro.first_name
FROM dbo.Appointment AS apps  -- 82
LEFT JOIN dbo.Provider AS pro 
ON apps.provider_id = pro.provider_id -- This is how the two tables are related
GROUP BY pro.first_name  -- 22 ROWS


SELECT COUNT(APPS.appointment_id) AS TotalAppointments, pro.first_name
FROM dbo.Appointment AS apps  -- 82
LEFT JOIN dbo.Provider AS pro  
ON apps.provider_id = pro.provider_id -- This is how the two tables are related
GROUP BY pro.first_name  -- 22 ROWS

SELECT COUNT(APPS.appointment_id) AS TotalAppointments, pro.first_name
FROM dbo.Appointment AS apps  -- 82
LEFT JOIN dbo.Provider AS pro 
ON apps.provider_id = pro.provider_id -- This is how the two tables are related
GROUP BY pro.first_name  -- 22 ROWS
HAVING COUNT(APPS.appointment_id) > 5  -- This is like a WHERE clause that filters grouped information



/*Write a query that will retrieve the minimum Age of all registered Patients
*/
SELECT MIN(date_of_birth) AS minimumAge
FROM dbo.Patient


/* Write a query that will retrieve the maximum bill amount associated with each procedure
*/
SELECT MAX(bill_amount) AS MaxBillAmount, bill.procedure_id
FROM dbo.Billing AS bill -- 75 ROWS
LEFT JOIN dbo.[Procedure] AS pro
ON bill.procedure_id = pro.procedure_id
GROUP BY bill.procedure_id

/*Write a query that will retrieve the average duration of procedures performed by each provider
*/

-- Revisit whenever you get to the string functions and data conversion
SELECT 
	AVG(duration) AS AvgDuration, prov.first_name
FROM dbo.[Procedure] AS proce
LEFT JOIN dbo.Provider AS prov
ON proce.provider_id = prov.provider_id

SELECT *
FROM dbo.Provider

SELECT *
FROM dbo.[Procedure]

/*Write a query that will retrieve the total medical staff members associated with each address type
*/
SELECT 
	COUNT(MS.StaffID) StaffCount, adst.Name
FROM dbo.MedicalStaff AS MS
LEFT JOIN dbo.Address AS ads
ON MS.AddressID = ads.AddressID
LEFT JOIN dbo.AddressType AS adst
ON adst.AddressTypeID = ads.AddressTypeID
GROUP BY adst.Name



/*Write a query that will retrieve the total billing amount for each patient

*/

SELECT SUM(bill_amount), pat.first_name
FROM dbo.Billing AS bill
LEFT JOIN dbo.Patient AS pat
ON pat.patient_id = bill.patient_id
GROUP BY pat.first_name
