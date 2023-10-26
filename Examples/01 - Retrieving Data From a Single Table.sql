USE PollynzDataTech
GO

------------------------------------------------
-- SELECT Statement - Retrieving ALL Columns
------------------------------------------------
SELECT <column list> *
FROM <data source>

-- Write a query to return all the columns from the Address table
SELECT *
FROM dbo.Address

-- Write a query to return all the columns from the AddressType table
SELECT *
FROM dbo.AddressType

-- Write a query to return all the columns from the Appointment table
SELECT *
FROM dbo.Appointment

-- Write a query to return all the columns from the Insurance table
SELECT *
FROM dbo.Insurance


------------------------------------------------
-- SELECT Statement -  Retrieving Specific Columns
------------------------------------------------
SELECT col1,col2,col3,col4
FROM table_name

/* Write a query to retrieve disgnosis name, severity, diagnosis_description
from the dbo.Diagnosis
*/
SELECT 
	diagnosis_name, severity, diagnosis_description
FROM dbo.Diagnosis

/*
Write a query to retrieve the bill Id, bill date and bill amount
from the billing table
*/
SELECT 
	bill_id, bill_date, bill_amount
FROM dbo.Billing
/*
Write a query to retrieve the first name, last name, date of birth, gender and insurance information
from the patient table
*/
SELECT 
	first_name, last_name, date_of_birth, gender, insurance_information
FROM dbo.Patient

/*
Write a query to retrieve prescription date, medication name, dosage and frequency
from the Prescription table
*/
SELECT 
	prescription_date, medication_name, dosage, frequency
FROM dbo.Prescription
------------------------------------------------
-- Sorting Data with ORDER BY
------------------------------------------------
ASC -- 
DESC --
/*
Write a query that will retrieve the medical condition, past medical history and record date and time
from the medical history table but sort the record by past medical history in descending order
*/
SELECT 
	medical_condition, past_medical_history, record_date_and_time
FROM dbo.MedicalHistory
ORDER BY past_medical_history DESC
/*
Write a query to retrieve the first name, phone number, email address, date of birth and gender from 
the provider table and sort the records by the date of birth in ascending order
*/
SELECT 
	first_name, phone_number, email_address, date_of_birth, gender
FROM dbo.Provider
ORDER BY date_of_birth ASC  -- 1970-12-30

SELECT 
	first_name, phone_number, email_address, date_of_birth, gender
FROM dbo.Provider
ORDER BY date_of_birth
/*
Write a query to retrieve the procedure date, procedure description, cost and duration,
but sort the records based on the cost in highest to lowest cost.
*/
SELECT 
	procedure_date, procedure_description, cost, duration
FROM dbo.[Procedure]
ORDER BY cost DESC
------------------------------------------------
-- Using Aliases
------------------------------------------------

/*
Write a query to retrieve the policy number, expiration date and claim status 
from the insurance table. Rename the claim status to read "Status"
*/
SELECT 
	insurance_policy_number, 
	insurance_expiry_date, 
	claim_status AS [Status]
FROM dbo.Insurance

SELECT 
	insurance_policy_number, 
	insurance_expiry_date, 
	claim_status [Status]
FROM dbo.Insurance
/*
Write a query to retrieve the appointment date, appointment type, reason of visit and note from
the appointment table. Rename the appointment type to display type and the appointment time to display time
*/
SELECT 
	appointment_date,
	appointment_type AS [Type],
	reason_for_visit,
	appointment_time AS [Time],
	notes
FROM dbo.Appointment

/*
Write a query to retrieve the first name, last name, data of birth, Medical license number,
and the employment history from the MedicalStaff table. Rename the employment history to "History",
the first name to "First Name", data of birth to "Birth Date" and Medical license number to "License No."
*/
SELECT 
	First_Name AS [First Name],
	Last_Name,
	Date_of_Birth AS 'Birth Date',
	Medical_License_Number AS "License No.",
	Employment_History as History
FROM MedicalStaff

