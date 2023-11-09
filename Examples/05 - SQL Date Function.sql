USE PollynzDataTech
GO

--------------------------------------------------------------------------------------------------------------
-- Date Function: GETDATE(), DAY(), MONTH(), YEAR(), DATEPART(), DATENAME(), DATEADD(), DATEDIFF(), EOMONTH()
--------------------------------------------------------------------------------------------------------------
/* Write a query to return the current date and time
*/
SELECT GETDATE()

SELECT SYSDATETIME()

/* Write a query to retrieve the Day of birth for all registered patients
                
*/
SELECT date_of_birth, DAY(date_of_birth) AS Day_of_birth
FROM dbo.Patient


/* Write a query to retrieve the MONTH of birth for all registered patients
*/
SELECT date_of_birth, MONTH(date_of_birth) AS Month_Of_Birth
FROM dbo.Patient

SELECT date_of_birth, MONTH(date_of_birth) AS Month_Of_Birth
FROM dbo.Patient
WHERE MONTH(date_of_birth) = 5

/* Write a query to retrieve the YEAR of birth for all registered patients
*/
SELECT date_of_birth, YEAR(date_of_birth) AS Yeah_Of_Birth
FROM dbo.Patient

/* Write a query to retrieve the DAY of all recorded appointments in the system
*/
SELECT 
	appointment_date,
	DATEPART(DAY,appointment_date) AS Appointment_day
FROM dbo.Appointment


/* Write a query to retrieve the YEAR of all recorded appointments in the system

*/
SELECT 
	appointment_date,
	DATEPART(YEAR, appointment_date) AS Appointment_Year
FROM dbo.Appointment

/* write a query to retrieve the string representation of the MONTH of Procedure dates
*/
SELECT 
	procedure_date,
	DATENAME(MONTH, procedure_date) AS Month_String
FROM dbo.[Procedure]

/* write a query to retrieve the string representation of the DAY of Procedure dates
*/
SELECT 
	procedure_date,
	DATENAME(WEEKDAY,procedure_date) AS Day_String
FROM dbo.[Procedure]

/* Write a query to add 2 months to the Procedure dates
*/
SELECT 
	procedure_date,
	DATEADD(MONTH, 2, procedure_date) AS Month_Added
FROM dbo.[Procedure]

/* Write a query to remove 7 days from the Procedure dates
*/
SELECT 
	procedure_date,
	DATEADD(DAY, -7, procedure_date) AS Day_Removed
FROM dbo.[Procedure]
/* Write a query to show the age of all registered patients as of today
*/

SELECT 
	date_of_birth,
	DATEDIFF(YEAR,date_of_birth, GETDATE()) AS Age
FROM dbo.Patient

