CREATE OR REPLACE PROCEDURE manage_in_patient (
    p_to_do                 IN VARCHAR2,
    p_email_id              IN VARCHAR2 DEFAULT NULL,
    p_first_name            IN VARCHAR2 DEFAULT NULL,
    p_last_name             IN VARCHAR2 DEFAULT NULL,
    p_dob                   IN DATE DEFAULT NULL,
    p_blood_group           IN VARCHAR2 DEFAULT NULL,
    p_gender                IN VARCHAR2 DEFAULT NULL,
    p_address               IN VARCHAR2 DEFAULT NULL,
    p_phone_number          IN NUMBER DEFAULT NULL,
    p_admission_date        IN DATE DEFAULT NULL,
    p_discharge_date        IN DATE DEFAULT NULL,
    p_room_no               IN NUMBER DEFAULT NULL
) AS
    v_person_id             NUMBER;
    v_patient_id            NUMBER;
BEGIN
    -- Insertion
    IF p_to_do = 'insert' THEN
        -- Insert into person table
        INSERT INTO person (
            person_id,
            first_name,
            last_name,
            dob,
            blood_group,
            gender,
            email_id,
            phone_number,
            address,
            created_date
        ) VALUES (
            person_id_seq.NEXTVAL,
            p_first_name,
            p_last_name,
            p_dob,
            p_blood_group,
            p_gender,
            p_email_id,
            p_phone_number,
            p_address,
            SYSDATE
        ) RETURNING person_id INTO v_person_id;

        -- Insert into patient table
        INSERT INTO patient (
            patient_id,
            person_person_id
        ) VALUES (
            patient_id_seq.NEXTVAL,
            v_person_id
        ) RETURNING patient_id INTO v_patient_id;

        -- Insert into in_patient table
        INSERT INTO in_patient (
            admission_date,
            discharge_date,
            room_no,
            patient_patient_id
        ) VALUES (
            p_admission_date,
            p_discharge_date,
            p_room_no,
            v_patient_id
        );

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('In-Patient inserted successfully!');
    
    -- Updating
    ELSIF p_to_do = 'update' THEN
        -- Get the person_id of the patient
        SELECT person_id INTO v_person_id
        FROM person
        WHERE email_id = p_email_id;

        -- Get the patient_id of the patient
        SELECT patient_id INTO v_patient_id
        FROM patient
        WHERE person_person_id = v_person_id;

        -- Update person table
        UPDATE person
        SET
            first_name = COALESCE(p_first_name, first_name),
            last_name = COALESCE(p_last_name, last_name),
            dob = COALESCE(p_dob, dob),
            blood_group = COALESCE(p_blood_group, blood_group),
            gender = COALESCE(p_gender, gender),
            address = COALESCE(p_address, address),
            phone_number = COALESCE(p_phone_number, phone_number)
        WHERE
            person_id = v_person_id;

        -- Update patient table
        -- No update needed for patient table in this scenario

        -- Update in_patient table
        UPDATE in_patient
        SET
            admission_date = COALESCE(p_admission_date, admission_date),
            discharge_date = COALESCE(p_discharge_date, discharge_date),
            room_no = COALESCE(p_room_no, room_no)
        WHERE
            patient_patient_id = v_patient_id;

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('In-Patient updated successfully!');
    
    -- Deletion
    ELSIF p_to_do = 'delete' THEN
        -- Get the person_id of the patient
        SELECT person_id INTO v_person_id
        FROM person
        WHERE email_id = p_email_id;

        -- Get the patient_id of the patient
        SELECT patient_id INTO v_patient_id
        FROM patient
        WHERE person_person_id = v_person_id;

        -- Delete from in_patient table
        DELETE FROM in_patient
        WHERE patient_patient_id = v_patient_id;

        -- Delete from patient table
        DELETE FROM patient
        WHERE patient_id = v_patient_id;

        -- Delete from person table
        DELETE FROM person
        WHERE person_id = v_person_id;

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('In-Patient deleted successfully!');
    
    ELSE
        -- If invalid operation specified
        RAISE_APPLICATION_ERROR(-20003, 'Invalid operation specified. Valid operations are: insert, update, delete');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If the email_id does not exist
        DBMS_OUTPUT.PUT_LINE('Patient with email ' || p_email_id || ' not found.');
    WHEN OTHERS THEN
        -- Raise the exception again to propagate it to the caller
        RAISE;
END manage_in_patient;
/


BEGIN
    manage_in_patient(
        'insert',                           -- Operation: insert
        'john@example.com',                -- Email ID
        'John',                             -- First name
        'Doe',                              -- Last name
        TO_DATE('1980-01-01', 'YYYY-MM-DD'),-- Date of Birth
        'O+',                               -- Blood group
        'Male',                             -- Gender
        '123 Main St',                      -- Address
        1234567890,                         -- Phone number
        TO_DATE('2024-04-10', 'YYYY-MM-DD'),-- Admission date
        TO_DATE('2024-04-15', 'YYYY-MM-DD'),-- Discharge date
        101                                 -- Room number
    );
END;
/

--select * from person;
--select * from patient;
--select * from in_patient;
--
--delete from person;
--delete from patient;
--delete from in_patient;
--
---- Execute the procedure to update an in-patient
--BEGIN
--    manage_in_patient(
--        'update',                           -- Operation: update
--        'john@example.com',                -- Email ID
--        NULL,                               -- First name (set to NULL if not updating)
--        'UpdatedLastName',                  -- Last name
--        NULL,                               -- Date of Birth (set to NULL if not updating)
--        NULL,                               -- Blood group (set to NULL if not updating)
--        'Female',                           -- Gender
--        NULL,                               -- Address (set to NULL if not updating)
--        NULL,                               -- Phone number (set to NULL if not updating)
--        TO_DATE('2024-04-10', 'YYYY-MM-DD'),-- Admission date
--        TO_DATE('2024-04-18', 'YYYY-MM-DD'),-- Discharge date
--        102                                 -- Room number
--    );
--END;
--/
--
--
---- Execute the procedure to delete an in-patient
--BEGIN
-- manage_in_patient(
--    'delete',                           -- Operation: delete
--    'john@example.com'                 -- Email ID
--);
--END;

