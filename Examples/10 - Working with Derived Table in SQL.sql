USE PollynzDataTech
GO

-- Rules of Derived Table
-- 1. All columns in the derived table must have a name
-- 2. All column names must be unique
-- 3. Each derived table is not allowed to have an order by except with top


SELECT 
	first_name,
	last_name,
	StreeAddress,
	City,
	City
FROM dbo.Patient AS pat
INNER JOIN dbo.Address AS ad
ON pat.AddressID = ad.AddressID
ORDER BY first_name

SELECT 
	DrvTablePat.AddressID,
	[First Name],
	last_name,
	StreeAddress,
	City
FROM (
	SELECT 
	AddressID,
	first_name AS [First Name],
	last_name
	FROM dbo.Patient
) AS DrvTablePat
INNER JOIN (
	SELECT 
	AddressID,
	StreeAddress,
	City
FROM dbo.Address
) AS DrvTableAdd
ON DrvTablePat.AddressID = DrvTableAdd.AddressID
ORDER by [First Name]




