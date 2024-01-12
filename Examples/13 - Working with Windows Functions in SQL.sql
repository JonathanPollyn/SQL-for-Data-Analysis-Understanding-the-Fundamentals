USE PollynzDataTech
GO

-- Regular Aggregate Function
SELECT 
	patient_id,
	bill_date,
	bill_amount,
	SUM(bill_amount) AS TotalBill
FROM dbo.Billing
GROUP BY patient_id, bill_date, bill_amount
-- Windows Function
SELECT 
	patient_id,
	bill_date,
	bill_amount,
	SUM(bill_amount) OVER() AS TotalBill
FROM dbo.Billing

-- Adding a Partition By
SELECT 
	patient_id,
	bill_date,
	bill_amount,
	SUM(bill_amount) OVER(partition by patient_id ORDER BY bill_date) AS TotalBill
FROM dbo.Billing

--=============== Ranking Windows Function
SELECT 
	patient_id,
	bill_date,
	bill_amount,
	ROW_NUMBER() OVER(partition by Patient_id ORDER by bill_date) AS rownumber,
	RANK() OVER(ORDER BY bill_amount DESC) AS rank
FROM dbo.Billing
ORDER BY patient_id

-- OFFSET Windows Function
SELECT 
	patient_id,
	bill_date,
	bill_amount,
	provider_id,
	LAG(bill_amount) OVER(Partition by Patient_id ORDER BY bill_date, provider_id) AS PreviousValue,
	LEAD(bill_amount) OVER(Partition by Patient_id ORDER BY bill_date, provider_id) AS nextValue
FROM dbo.Billing
ORDER BY patient_id


-- First_value and Last_value

SELECT 
	patient_id,
	bill_date,
	bill_amount,
	provider_id,
	FIRST_VALUE(bill_amount) OVER(Partition by Patient_id ORDER BY bill_date, provider_id) AS firstValue,
	LAST_VALUE(bill_amount) OVER(Partition by Patient_id ORDER BY bill_date, provider_id) AS lastValue
FROM dbo.Billing
ORDER BY patient_id


