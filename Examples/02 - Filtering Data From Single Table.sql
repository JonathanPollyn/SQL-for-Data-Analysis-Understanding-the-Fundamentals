USE PollynzDataTech
GO

SELECT *
FROM dataName 

SELECT col1, col2, col3
FROM dataName
WHERE col3 = 'Male'

/* Write a query to retrieve list of appointments
from the appointments table that have status as "scheduled"
*/
SELECT *
FROM dbo.Appointment  -- 82 rows
WHERE status = 'Scheduled'  -- 72 rows



/* Write a query to retrieve the diagnosis date, diagnosis code, dignosis name and medication prescribed
that shows that the diagonoses severity is "mild" from the diagnosis table

*/
SELECT 
	diagnosis_date, diagnosis_code, diagnosis_name, medications_prescribed
FROM dbo.Diagnosis  -- 45 rows
WHERE severity = 'Mild'  -- 17 rows


/* Write a query to retrieve the medical condition, family medical history, treatment plan and test results
from the MedicalHistory table that have test results of "Normal" and "Schedule surgery"
*/
SELECT 
	medical_condition, family_medical_history, treatment_plan, test_results
FROM dbo.MedicalHistory  -- 60 rows
WHERE test_results IN ('Normal', 'Schedule Surgery')  -- 26 rows


/* Write a query to retrieve the first name, last name and gender of of medical staffs that have specializations in "Cardiology", "Neurology",
Oncology" and "Pediatrics" from the MedicalStaff table.
*/
SELECT 
	First_Name, Last_Name, Gender
FROM dbo.MedicalStaff   -- 70 ROWS
WHERE Specialization IN  ('Oncology', 'Pediatrics')  -- 20 rows


/* Write a query to retrieve procedure date,  procedure description, cost and post operative instruction.
Limit the result to only return where the cost is grater than 3000 and the post operative instructions is
"Resume normal activities" from the procedure table.
*/
SELECT 
	procedure_date, procedure_description, cost, postoperative_instructions
FROM dbo.[Procedure]  -- 40 ROWS
WHERE cost > 3000  -- 11 rows
AND postoperative_instructions = 'Resume Normal Activities'  -- 0 rows



/* Write a query to retrieve procedure description, cost and duration from the Procedure table but limit your
record to only return those that have pre operative instruction of "fasting", or post operative instruction as
 "Rest and hydrate" and cost is less than or equal to 2500

*/
SELECT 
	procedure_description, cost, duration
FROM dbo.[Procedure]  -- 40 rows
WHERE preoperative_instructions LIKE '%Fasting%'  -- 22 rows
--Jonathan
columnName LIKE 'Jonathan%'  -- Starts with Jonathan
columnName LIKE '%Jonathan'  -- Ends with Jonathan
columnName LIKE '%Jonathan%'  --Contains Jonathan


select *
from dbo.[Procedure] 


/*Write a query to retrieve that list appointments that fall within the '2023-09-15' to '2023-10-01
*/
SELECT *
FROM dbo.Appointment
WHERE appointment_date BETWEEN '2023-09-15' AND '2023-10-01'





