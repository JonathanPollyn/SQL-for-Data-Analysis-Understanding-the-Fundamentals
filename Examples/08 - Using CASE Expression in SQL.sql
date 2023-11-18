USE PollynzDataTech
GO


/*
Display the street address, address type and a column to show they type of address.
if the address type name is billing then payment address, if the name is home then residential
if the name is like office then work address main location otherwise
*/
SELECT 
	StreeAddress,
	name,
	CASE name 
		WHEN 'Billing' THEN 'Payment'
		WHEN 'Home' THEN 'Residential'
		WHEN 'Primary' THEN 'Main Location'
		ELSE 'Work Address'
	END AS AddressCat
FROM AddressType AS adtype
JOIN Address AS ad
ON adtype.AddressTypeID = ad.AddressTypeID


/*
Retrieve the first name along with a column indicating whether they have any 
diagonsis. Display 'Yes' if they have a diagnosis recorded and 'No' otherwise.
*/
SELECT 
	PAT.patient_id,
	first_name,
	diagnosis_date,
	diagnosis_id,
	CASE 
		WHEN diagnosis_id IS NULL THEN 'NO'
		ELSE 'Yes'
	END AS HasDiagnosis
FROM dbo.Patient AS pat
LEFT JOIN dbo.Diagnosis AS Dia
ON pat.patient_id = dia.patient_id;



/*
Show the diagnosis names, diagnosis type, severity along with a column categorizing them as 
'Critical' if the diagnosis type is severe, 'Non-Critical' if it is mild and otherwise
if none
*/
SELECT 
	diagnosis_name,
	diagnosis_type,
	severity,
	CASE 
		WHEN severity = 'Severe' THEN 'Critical'
		WHEN severity = 'Mild' THEN 'Non-Critical'
		ELSE 'None'
	END AS DiagonosisCat
FROM dbo.Diagnosis

/*
List the appointments with their IDs and appointment types, reason for a visit, status 
and a column to show if they are upcoming or have already occurred.
If the appointment status is scheduled then it is upcoming, if the appointment status
is completed then it has occurred else it was canceled
*/
SELECT 
	appointment_id,
	appointment_type,
	reason_for_visit,
	status,
	CASE 
		WHEN status = 'Scheduled' THEN 'Upcoming'
		WHEN status = 'Completed' THEN 'Ocurred'
		ELSE 'canceled'
	END AS AppointmentStatus
FROM dbo.Appointment

