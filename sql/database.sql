-- Creating tables

CREATE TABLE Person (
    dni VARCHAR (20),
    first_name VARCHAR (40),
    last_name_father VARCHAR (20),
    last_name_mother VARCHAR (20),
    gender VARCHAR (20),
    birth_date DATE,
    email VARCHAR (50),
    address VARCHAR (100)
);

CREATE TABLE Phone (
    number VARCHAR (10),
    dni VARCHAR (20)
);

CREATE TABLE Patient (
    dni VARCHAR (20),
    medical_record_number VARCHAR (15)
);

CREATE TABLE Applicant (
    dni VARCHAR (20)
);

CREATE TABLE Representation (
    id INTEGER,
    applicant_dni VARCHAR (20),
    patient_dni VARCHAR (20)
);

CREATE TABLE Claim (
    id INTEGER,
    year INTEGER,
    representation_id INTEGER,
    reason_id INTEGER,
    result_id INTEGER,
    communication_type_id INTEGER
);

CREATE TABLE Traceability (
    id INTEGER,
    claim_id INTEGER,
    year INTEGER,
    start_date DATE,
    end_date DATE,
    status VARCHAR (50)
);

CREATE TABLE Communication_Type (
    id INTEGER,
    description VARCHAR (50)
);

CREATE TABLE Reason (
    id INTEGER,
    description VARCHAR (50)
);

CREATE TABLE Result (
    id INTEGER,
    description VARCHAR (50)
);

CREATE TABLE Action (
    id INTEGER,
    claim_id INTEGER,
    year INTEGER
);

CREATE TABLE Participation (
    claim_id INTEGER,
    year INTEGER,
    service_id INTEGER
);

CREATE TABLE Service (
    id INTEGER,
    center_id INTEGER,
    description VARCHAR (50)
);

CREATE TABLE Center (
    id INTEGER,
    location_id INTEGER,
    description VARCHAR (50)
);

CREATE TABLE Location (
    id INTEGER,
    description VARCHAR (50)
);
