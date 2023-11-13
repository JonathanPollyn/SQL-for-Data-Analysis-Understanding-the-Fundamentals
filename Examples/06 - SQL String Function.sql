USE PollynzDataTech
GO

-------------------------------------------------------------------------------------------------------------
-- String Function:CONCAT(), LEFT(), RIGHT(), LEN(), REPLACE(), 
--REPLICATE(), SUBSTRING(), CHARINDEX(),--UPPER(), LOWER()
--------------------------------------------------------------------------------------------------------------
--CONCAT()
/*
Write a query that will retrieve the first and last name, phone number and email address 
from the patient table. 
Then create a derived column called full_name that will combine the first name
and last name.
*/
SELECT 
	first_name,
	last_name,
	phone_number,
	email_address,
	CONCAT(first_name,' ', last_name) AS full_Name
FROM dbo.Patient
GO


-- LEFT()
/*Write a query to retrieve display the patient first name, patient last name, patient phone number
 from the patient table. Then create a derived column called first_three that will extract the first three number
 of the patient phone number
*/
SELECT 
	first_name,
	last_name,
	phone_number,
	LEFT(phone_number, 3) AS first_three
FROM dbo.Patient

-- RIGHT()
/*Write a query to retrieve display the patienct first name, patient last name, patient phone number
from the patient table. Then create a derived column called last_four that will extract the last 
four of the patient phone number
*/
SELECT 
	first_name,
	last_name,
	phone_number,
	RIGHT(phone_number, 4) AS last_four
FROM dbo.Patient



--LEN()
-- Jonathan > 8, United States
/*Write a query to retrieve the procedure date, procedure description, the pre and post instructions
from the procedure table. Then create a derived column called desc_len that will count the lenght of the procedure description.
*/
SELECT 
	procedure_date,
	procedure_description,
	preoperative_instructions,
	postoperative_instructions,
	LEN(procedure_description) AS desc_len
FROM dbo.[Procedure]

--REPLACE()
/*Write a query to retrieve the insurance provider, insurance policy number and insurance expiry date 
from the insurance table.
Then create a derived column called ins_prov_update that will replace the spaces on the insurance provider
with as dash ("-")
*/
SELECT 
	insurance_provider,
	insurance_policy_number,
	insurance_expiry_date,
	REPLACE(insurance_provider, ' ','-') AS ins_prov_update
FROM dbo.Insurance


-- REPLICATE()
/*Write a query to generate 10 asterisks
*/
SELECT REPLICATE('*', 10)

---SUBSTRING()
/*Write a query to retrieve the insurance provider, insurance policy number from the insurance table.
Then create a derived column called Ins_prov_extract that will extract the first three words from the insurance provider
*/
SELECT 
	insurance_provider,
	insurance_policy_number,
	SUBSTRING(insurance_provider, 1, 3) AS Ins_prov_extract
FROM dbo.Insurance


--CHARINDEX()
/*Write a query to retrieve the street address, city and postal code from the address table.
Then create a dervied column called Pos_space to retrieve the position of the first space on the 
street address
*/
SELECT 
	StreeAddress,
	City,
	PostalCode,
	CHARINDEX(' ', StreeAddress) as Pos_space
FROM dbo.Address


--UPPER() 
/*Write a query to retrieve the diagnosis description, diagnosis code, diagnosis name from the diagnosis table.
Then create a derived column called dia_des_upper that will convert the diagnosis descriptions to an
upper case.
*/
SELECT 
	diagnosis_description, 
	diagnosis_code,
	diagnosis_name,
	UPPER(diagnosis_description) AS dia_des_upper
FROM dbo.Diagnosis


--LOWER()
/*Write a query to retrieve the diagnosis description, diagnosis code, diagnosis name from the diagnosis table.
Then create a derived column called dia_name_lower that will convert the diagnosis name to a
lower case.
*/

SELECT 
	diagnosis_description, 
	diagnosis_code,
	diagnosis_name,
	LOWER(diagnosis_name) AS dia_name_lower
FROM dbo.Diagnosis


------------------------------------------------------
-- Nested Functions
------------------------------------------------------
/*
johndoe@email.com > johndoe
Write a query that will retrive the First name, email address, and emergency contact from the patient table.
Then write a derived column called email_domain that will extract all characters before the @ symbol.
*/ 
SELECT 
	first_name,
	email_address, 
	emergency_contact,
	CHARINDEX('@',email_address) AS postiton_of_space,
	LEFT(email_address,CHARINDEX('@',email_address)-1 ) AS email_domain
FROM dbo.Patient


/*
Using the query from the previous question, add a derived column called contact_first_name,
this column should extract the first word from the emergency contact.
*/
SELECT 
	first_name,
	email_address, 
	emergency_contact,
	LEFT(email_address,CHARINDEX('@',email_address)-1 ) AS email_domain,
	CHARINDEX(' ', emergency_contact) AS Postion_space_emer,
	SUBSTRING(emergency_contact, 1, CHARINDEX(' ', emergency_contact)) AS contact_first_name
FROM dbo.Patient

/*
Using the query from the previous question, add a derived column called email,
this column should extract the word after the @ but before the period "." on the email  address.

johndoe@email.com
*/
SELECT 
	first_name,
	email_address, 
	emergency_contact,
	LEFT(email_address,CHARINDEX('@',email_address)-1 ) AS email_domain,
	SUBSTRING(emergency_contact, 1, CHARINDEX(' ', emergency_contact)) AS contact_first_name,
	--CHARINDEX('@', email_address) AS Position_of_@,
	--SUBSTRING(email_address,CHARINDEX('@', email_address),LEN(email_address) ) AS FirstHalf,
	--CHARINDEX('.', SUBSTRING(email_address,CHARINDEX('@', email_address),LEN(email_address) )) AS Position_of_period,
	SUBSTRING(SUBSTRING(email_address,CHARINDEX('@', email_address),LEN(email_address) ), 2,CHARINDEX('.', SUBSTRING(email_address,CHARINDEX('@', email_address),LEN(email_address) ))-2 ) AS email
FROM dbo.Patient


/*
Using the query from the previous question, add a derived column called email_masked,
this column should masked the email address with asterisks (*) maing the exact number or their
domain. For examplec johndoe@email.com will be *******@email.com, while robertjohnson@email.com will
be *************@email.com
*/
SELECT 
	first_name,
	email_address, 
	emergency_contact,
	LEFT(email_address,CHARINDEX('@',email_address)-1 ) AS email_domain,
	SUBSTRING(emergency_contact, 1, CHARINDEX(' ', emergency_contact)) AS contact_first_name,
	SUBSTRING(SUBSTRING(email_address,CHARINDEX('@', email_address),LEN(email_address) ), 2,CHARINDEX('.', SUBSTRING(email_address,CHARINDEX('@', email_address),LEN(email_address) ))-2 ) AS email,
	--CHARINDEX('@',email_address) AS Position_of_@,
	--SUBSTRING(email_address,1,CHARINDEX('@',email_address)-1),
	--LEN(SUBSTRING(email_address,1,CHARINDEX('@',email_address)-1)),
	--REPLICATE('*',LEN(SUBSTRING(email_address,1,CHARINDEX('@',email_address)-1))),
	--SUBSTRING(email_address,CHARINDEX('@',email_address), LEN(email_address) ),
	CONCAT(REPLICATE('*',LEN(SUBSTRING(email_address,1,CHARINDEX('@',email_address)-1))),SUBSTRING(email_address,CHARINDEX('@',email_address), LEN(email_address) )) AS email_masked
FROM dbo.Patient









