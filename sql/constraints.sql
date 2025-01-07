-- Adding constraints

ALTER TABLE Person ADD CONSTRAINT person_dni_pk PRIMARY KEY (dni);
ALTER TABLE Person ADD CONSTRAINT chk_validate_dni CHECK (LENGTH(dni) = 8);
ALTER TABLE Person ADD CONSTRAINT person_email_unique UNIQUE (email);

ALTER TABLE Phone ADD CONSTRAINT phone_pk PRIMARY KEY (number);
ALTER TABLE Phone ADD CONSTRAINT phone_person_fk FOREIGN KEY (dni) REFERENCES Person (dni);
ALTER TABLE Phone ADD CONSTRAINT chk_validate_number CHECK (LEFT(number, 1) = '9' AND LENGTH(number) = 9);
ALTER TABLE Phone ADD CONSTRAINT chk_validate_dni CHECK (LENGTH(dni) = 8);

ALTER TABLE Patient ADD CONSTRAINT patient_dni_pk PRIMARY KEY (dni);
ALTER TABLE Patient ADD CONSTRAINT patient_dni_fk FOREIGN KEY (dni) REFERENCES Person (dni);
ALTER TABLE Patient ADD CONSTRAINT patient_mrn_unique UNIQUE (medical_record_number);
ALTER TABLE Patient ADD CONSTRAINT chk_validate_mrn CHECK (LENGTH(medical_record_number) = 7);
ALTER TABLE Patient ADD CONSTRAINT chk_validate_dni CHECK (LENGTH(dni) = 8);

ALTER TABLE Applicant ADD CONSTRAINT applicant_dni_pk PRIMARY KEY (dni);
ALTER TABLE Applicant ADD CONSTRAINT applicant_dni_fk FOREIGN KEY (dni) REFERENCES Person (dni);
ALTER TABLE Applicant ADD CONSTRAINT chk_validate_dni CHECK (LENGTH(dni) = 8);

ALTER TABLE Representation ADD CONSTRAINT representation_id_pk PRIMARY KEY (id);
ALTER TABLE Representation ADD CONSTRAINT representation_applicant_fk FOREIGN KEY (applicant_dni) REFERENCES Person (dni);
ALTER TABLE Representation ADD CONSTRAINT representation_patient_fk FOREIGN KEY (patient_dni) REFERENCES Person (dni);
ALTER TABLE Representation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE Representation ADD CONSTRAINT chk_validate_applicant_dni CHECK (LENGTH(applicant_dni) = 8);
ALTER TABLE Representation ADD CONSTRAINT chk_validate_patient_dni CHECK (LENGTH(patient_dni) = 8);

ALTER TABLE Communication_Type ADD CONSTRAINT communication_type_id_pk PRIMARY KEY (id);
ALTER TABLE Reason ADD CONSTRAINT reason_id_pk PRIMARY KEY (id);
ALTER TABLE Result ADD CONSTRAINT result_id_pk PRIMARY KEY (id);
ALTER TABLE Location ADD CONSTRAINT location_id_pk PRIMARY KEY (id);

ALTER TABLE Center ADD CONSTRAINT center_id_pk PRIMARY KEY (id);
ALTER TABLE Center ADD CONSTRAINT center_location_fk FOREIGN KEY (location_id) REFERENCES Location (id);

ALTER TABLE Service ADD CONSTRAINT service_id_pk PRIMARY KEY (id);
ALTER TABLE Service ADD CONSTRAINT service_center_fk FOREIGN KEY (center_id) REFERENCES Center (id);

ALTER TABLE Claim ADD CONSTRAINT claim_pk PRIMARY KEY (id, year);
ALTER TABLE Claim ADD CONSTRAINT claim_representation_fk FOREIGN KEY (representation_id) REFERENCES Representation (id);
ALTER TABLE Claim ADD CONSTRAINT claim_reason_fk FOREIGN KEY (reason_id) REFERENCES Reason (id);
ALTER TABLE Claim ADD CONSTRAINT claim_result_fk FOREIGN KEY (result_id) REFERENCES Result (id);
ALTER TABLE Claim ADD CONSTRAINT claim_communication_type_fk FOREIGN KEY (communication_type_id) REFERENCES Communication_Type (id);
ALTER TABLE Claim ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE Claim ALTER COLUMN representation_id SET NOT NULL;
ALTER TABLE Claim ADD CONSTRAINT claim_representation_unique UNIQUE (representation_id);

ALTER TABLE Traceability ADD CONSTRAINT traceability_id_pk PRIMARY KEY (id);
ALTER TABLE Traceability ADD CONSTRAINT traceability_claim_fk FOREIGN KEY (claim_id, year) REFERENCES Claim (id, year);
ALTER TABLE Traceability ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE Traceability ADD CONSTRAINT chk_validate_dates CHECK (start_date <= end_date);
ALTER TABLE Traceability ADD CONSTRAINT traceability_unique UNIQUE (claim_id, year, status);

ALTER TABLE Action ADD CONSTRAINT action_id_pk PRIMARY KEY (id);
ALTER TABLE Action ADD CONSTRAINT action_claim_fk FOREIGN KEY (claim_id, year) REFERENCES Claim (id, year);
ALTER TABLE Action ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE Participation ADD CONSTRAINT participation_pk PRIMARY KEY (claim_id, year, service_id);
ALTER TABLE Participation ADD CONSTRAINT participation_claim_fk FOREIGN KEY (claim_id, year) REFERENCES Claim (id, year);
ALTER TABLE Participation ADD CONSTRAINT participation_service_fk FOREIGN KEY (service_id) REFERENCES Service (id);
