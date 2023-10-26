CREATE DATABASE PollynzDataTech
GO

--USE THE JUST CREATED DATABASE
USE PollynzDataTech
GO

--CREATE AddressType TABLE
CREATE TABLE dbo.AddressType
(
	AddressTypeID INT PRIMARY KEY NOT NULL,
	Name VARCHAR(20) NOT NULL
);


--CREATE Address TABLE
CREATE TABLE dbo.Address(
	AddressID INT PRIMARY KEY NOT NULL,
	AddressTypeID INT NOT NULL,
	StreeAddress varchar(60) NOT NULL,
	City varchar(100) NOT NULL,
	PostalCode varchar(15) NOT NULL,
	FOREIGN KEY (AddressTypeID) REFERENCES dbo.AddressType(AddressTypeID)
)


--CREATE PATIENT TABLE
CREATE TABLE dbo.Patient (
    patient_id INT PRIMARY KEY NOT NULL,
	AddressID INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email_address VARCHAR(50) NULL,
	emergency_contact VARCHAR(50),
    insurance_information VARCHAR(100) NOT NULL
	FOREIGN KEY (AddressID) REFERENCES dbo.Address(AddressID)
);


--CREATE Provider  TABLE
CREATE TABLE dbo.Provider (
    provider_id INT PRIMARY KEY NOT NULL,
	AddressID INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email_address VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    medical_license_number VARCHAR(20) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    education_and_qualifications VARCHAR(255) NOT NULL,
    areas_of_expertise VARCHAR(255) NOT NULL,
    languages_spoken VARCHAR(255)  NULL,
    office_hours VARCHAR(255) NOT NULL,
    appointment_scheduling VARCHAR(255) NOT NULL,
    hospital_affiliations VARCHAR(255) NULL
	FOREIGN KEY (AddressID) REFERENCES dbo.Address(AddressID)
);

--CREATE MedicalStaff  TABLE
CREATE TABLE dbo.MedicalStaff (
    StaffID INT PRIMARY KEY NOT NULL,
	AddressID INT NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Contact_Information VARCHAR(50) NOT NULL,
    Medical_License_Number VARCHAR(20) NOT NULL,
    Specialization VARCHAR(50) NOT NULL,
    Employment_History VARCHAR(50) NOT NULL
	FOREIGN KEY (AddressID) REFERENCES dbo.Address(AddressID)
);



--CREATE Appointment  TABLE
CREATE TABLE dbo.Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time VARCHAR(100) NOT NULL,
    appointment_type VARCHAR(50) NOT NULL,
    reason_for_visit VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL,
    notes VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES dbo.Patient(patient_id),
    FOREIGN KEY (provider_id) REFERENCES dbo.Provider(provider_id)
);




--CREATE Diagnosis  TABLE
CREATE TABLE dbo.Diagnosis (
    diagnosis_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    diagnosis_date DATE NOT NULL,
    diagnosis_description VARCHAR(100) NOT NULL,
    diagnosis_code VARCHAR(20) NOT NULL,
    diagnosis_name VARCHAR(100) NOT NULL,
    diagnosis_type VARCHAR(50) NOT NULL,
    severity VARCHAR(20) NOT NULL,
    treatment_plan VARCHAR(100) NOT NULL,
    medications_prescribed VARCHAR(100) NOT NULL,
    procedures_recommended VARCHAR(100) NOT NULL,
    follow_up_instructions VARCHAR(100) NOT NULL,
    notes VARCHAR(100) NOT NULL,
    review_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES dbo.Patient(patient_id),
    FOREIGN KEY (provider_id) REFERENCES dbo.Provider(provider_id)
);



--CREATE Prescription  TABLE
CREATE TABLE dbo.Prescription (
    prescription_id INT PRIMARY KEY NOT NULL,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    prescription_date DATE NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    frequency VARCHAR(50) NOT NULL,
    prescribing_physician INT NOT NULL,
    patient_instructions VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES dbo.Patient(patient_id),
    FOREIGN KEY (provider_id) REFERENCES dbo.Provider(provider_id),
    FOREIGN KEY (prescribing_physician) REFERENCES dbo.Provider(provider_id)
);


--CREATE Procedure  TABLE
CREATE TABLE dbo.[Procedure] (
    procedure_id INT PRIMARY KEY NOT NULL,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    procedure_date DATE NOT NULL,
    procedure_description VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    duration INT NOT NULL,
    associated_provider INT NOT NULL,
    preoperative_instructions VARCHAR(100) NOT NULL,
    postoperative_instructions VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES dbo.Patient(patient_id),
    FOREIGN KEY (provider_id) REFERENCES dbo.Provider(provider_id),
    FOREIGN KEY (associated_provider) REFERENCES dbo.Provider(provider_id)
);

--CHANGE THE duration data type
ALTER TABLE dbo.[Procedure] ALTER COLUMN duration VARCHAR(20)


--CREATE Medical_History  TABLE
CREATE TABLE dbo.MedicalHistory (
    medical_history_id INT PRIMARY KEY NOT NULL,
    patient_id INT NOT NULL,
    diagnosis_id INT NOT NULL,
    prescription_id INT NOT NULL,
    procedure_id INT NOT NULL,
    StaffID INT NOT NULL,
    medical_condition VARCHAR(50) NOT NULL,
    past_medical_history VARCHAR(50) NOT NULL,
    family_medical_history VARCHAR(50) NOT NULL,
    record_date_and_time DATETIME,
    diagnosis VARCHAR(100) NOT NULL,
    treatment_plan VARCHAR(100) NOT NULL,
    medications_prescribed VARCHAR(100) NOT NULL,
    test_results VARCHAR(100) NOT NULL,
    notes VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES dbo.Patient(patient_id),
    FOREIGN KEY (diagnosis_id) REFERENCES dbo.Diagnosis(diagnosis_id),
    FOREIGN KEY (prescription_id) REFERENCES dbo.Prescription(prescription_id),
    FOREIGN KEY (procedure_id) REFERENCES dbo.[Procedure](procedure_id),
    FOREIGN KEY (StaffID) REFERENCES dbo.MedicalStaff(StaffID)
);


--CREATE Billing   TABLE
CREATE TABLE dbo.Billing (
    bill_id INT PRIMARY KEY NOT NULL,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    appointment_id INT NOT NULL,
    diagnosis_id INT NOT NULL,
    prescription_id INT NOT NULL,
    procedure_id INT NOT NULL,
    bill_date DATE NOT NULL,
    bill_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES dbo.Patient(patient_id),
    FOREIGN KEY (provider_id) REFERENCES dbo.Provider(provider_id),
    FOREIGN KEY (appointment_id) REFERENCES dbo.Appointment(appointment_id),
    FOREIGN KEY (diagnosis_id) REFERENCES dbo.Diagnosis(diagnosis_id),
    FOREIGN KEY (prescription_id) REFERENCES dbo.Prescription(prescription_id),
    FOREIGN KEY (procedure_id) REFERENCES dbo.[Procedure](procedure_id)
);


--CREATE Insurance  TABLE
CREATE TABLE dbo.Insurance (
    insurance_id INT PRIMARY KEY NOT NULL,
    patient_id INT NOT NULL,
    insurance_provider VARCHAR(100) NOT NULL,
    insurance_policy_number VARCHAR(50) NOT NULL,
    insurance_expiry_date DATE NOT NULL,
    claim_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES dbo.Patient(patient_id)
);






