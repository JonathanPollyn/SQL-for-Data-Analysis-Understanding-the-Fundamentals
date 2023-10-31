USE PollynzDataTech
GO

SELECT 
FROM <TABLENAME> TBL1
INNER JOIN <TABLENAME> TB2
ON TBL1.COL1 = TBL2.COL1

TB1					TB2
TB1ID				TB2ID
1					1
2					3
3					5
4



--------------------------------------------------------------------
-- INNER JOIN: A JOIN that joins two table together but looks for matching records 
--------------------------------------------------------------------

/* Write a query to retrieve patients first name, last name, date of birth, email address of patients and
their corresponding address types

*/
SELECT 
	first_name, last_name, date_of_birth, email_address, adt.Name
FROM dbo.Patient AS pat
INNER JOIN dbo.Address AS adds
ON pat.AddressID = adds.AddressID  -- This is the relationship b/w the tables
INNER JOIN dbo.AddressType AS adt
ON adt.AddressTypeID = adds.AddressTypeID -- This is the relationship b/w the tables






SELECT *
FROM dbo.Address

SELECT *
FROM  dbo.Patient




SELECT *
FROM dbo.AddressType



SELECT *
FROM INFORMATION_SCHEMA.TABLES



/* Write a query to retrieve the first name, last name, date of birth, of the medical staff members and their 
associated addresses.
*/
SELECT 
	First_Name, Last_Name, Date_of_Birth, StreeAddress, City, PostalCode
FROM DBO.MedicalStaff AS MS
INNER JOIN dbo.Address AS adds
ON MS.AddressID = adds.AddressID

SELECT *
FROM dbo.Address

/*
Write a query that will retrieve appointments along with the patients' names and the corresponding providers' 
names.
*/
SELECT 
	appointment_date, 
	appointment_time, 
	appointment_type, 
	pat.first_name AS Patient_First_Name, 
	pat.last_name AS Patient_Last_Name,
	prd.first_name AS Provider_First_Name,
	prd.last_name Provider_Last_Name
FROM dbo.Appointment AS app
INNER JOIN dbo.Patient AS pat
ON app.patient_id = pat.patient_id
JOIN dbo.Provider prd
ON app.provider_id = prd.provider_id


SELECT *
FROM dbo.Patient


SELECT *
FROM dbo.Provider

--------------------------------------------------------------------
-- LEFT JOIN: Return all records from the left and then looks matching records on the right
--------------------------------------------------------------------

/* Write a query to retrieve all patients and their associated address types 
(include patients without addresses).

*/
SELECT *
FROM dbo.Patient pat
LEFT JOIN dbo.Address adds
ON PAT.AddressID = adds.AddressID  -- This is how the table are related
INNER JOIN dbo.AddressType addst
ON addst.AddressTypeID = adds.AddressTypeID  -- This is how the table are related



SELECT *
FROM dbo.Address

SELECT 
	*
FROM dbo.AddressType
/* Write a query to list diagnoses and their associated patients and providers 
(include diagnoses with missing patient or provider).
*/
SELECT 
		diagnosis_description, diagnosis_code, appointment_scheduling, hospital_affiliations
FROM dbo.Diagnosis AS dia
LEFT JOIN dbo.Patient pat
ON dia.patient_id = pat.patient_id  -- This is how the tables are related
LEFT JOIN dbo.Provider AS prov
ON prov.provider_id = dia.provider_id -- This is how the tables are related

SELECT *
FROM dbo.Patient

SELECT *
FROM dbo.Provider
/*
 Write a query to retrieve prescriptions, including patient names and the corresponding providers 
 (include prescriptions with missing patient or provider).
*/
SELECT *
FROM dbo.Prescription  AS pre -- 69 rows
LEFT JOIN dbo.Patient AS pat
ON pre.patient_id = pat.patient_id -- This is how the tables are related
LEFT JOIN dbo.Provider prov
ON prov.provider_id = pre.provider_id



SELECT *
FROM dbo.Patient -- 60 pat


SELECT *
FROM dbo.Provider  -- 40 row



--------------------------------------------------------------------
-- RIGHT JOIN: Combines record from two table, but returns all the record from the right side and then matching from the left
--------------------------------------------------------------------

/* Write a query to retrieve billing information, including patient names and provider names 
(include billing records with missing patient or provider).

*/
SELECT bill_amount, bill_date, pat.first_name AS Patient_Firstname, prov.first_name AS Provider_FirstName
FROM dbo.Patient AS pat 
RIGHT JOIN dbo.Billing AS bill -- 75 rows
ON pat.patient_id = bill.bill_id
RIGHT JOIN dbo.Provider prov
ON prov.provider_id = bill.provider_id

SELECT *
FROM dbo.Patient

SELECT *
FROM dbo.Provider

/*
 Write a query to retrieve prescriptions, including patient names and the corresponding providers 
 (include prescriptions with missing patient or provider).
*/
SELECT *
FROM dbo.Patient AS pat 
RIGHT JOIN dbo.Prescription  AS pre -- 69 rows
ON pre.patient_id = pat.patient_id -- This is how the tables are related
LEFT JOIN dbo.Provider prov
ON prov.provider_id = pre.provider_id


/* Write a query to retrieve appointments along with patients' names and the corresponding providers' names 
(include appointments with missing patient or provider).
*/
SELECT *
FROM dbo.Patient AS pat
RIGHT JOIN dbo.Appointment AS app
ON app.patient_id = pat.patient_id  -- This is how the tables are related
LEFT JOIN dbo.Provider AS prov
ON prov.provider_id = app.provider_id  -- 82


SELECT *
FROM dbo.Appointment  -- 82

SELECT *
FROM dbo.Patient

SELECT *
FROM dbo.Provider

--------------------------------------------------------------------
-- SELF JOIN: This is a join that join back to its self
--------------------------------------------------------------------

/* Write a query to retrieve all pairs of addresses with the same address type.

*/
SELECT adds.StreeAddress, adds.City, adds.PostalCode, adds1.StreeAddress, adds1.City, adds1.PostalCode
FROM dbo.Address AS adds 
INNER JOIN dbo.Address adds1 -- Self join happens here
ON adds.AddressTypeID = adds1.AddressTypeID

SELECT *
FROM DBO.AddressType


--------------------------------------------------------------------
-- FULL JOIN: A join to joins two tables looking records from both table
--------------------------------------------------------------------

/* Write a query that list all addresses and the names of medical staff members associated with them 
(including addresses without medical staff) and all medical staff members (including those without addresses).

*/
SELECT *
FROM dbo.MedicalStaff  AS ms
FULL JOIN dbo.Address AS adds
ON adds.AddressID = ms.AddressID  -- This is how that tables are related



