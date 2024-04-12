CREATE OR REPLACE PROCEDURE manage_out_patient (
    p_to_do                 IN VARCHAR2,
    p_email_id              IN VARCHAR2 DEFAULT NULL,
    p_first_name            IN VARCHAR2 DEFAULT NULL,
    p_last_name             IN VARCHAR2 DEFAULT NULL,
    p_dob                   IN DATE DEFAULT NULL,
    p_blood_group           IN VARCHAR2 DEFAULT NULL,
    p_gender                IN VARCHAR2 DEFAULT NULL,
    p_address               IN VARCHAR2 DEFAULT NULL,
    p_phone_number          IN NUMBER DEFAULT NULL,
    p_visit_date            IN DATE DEFAULT NULL
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

        -- Insert into out_patient table
        INSERT INTO out_patient (
            visit_date,
            patient_patient_id
        ) VALUES (
            p_visit_date,
            v_patient_id
        );

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Out-Patient inserted successfully!');
    
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

        -- Update out_patient table
        UPDATE out_patient
        SET
            visit_date = COALESCE(p_visit_date, visit_date)
        WHERE
            patient_patient_id = v_patient_id;

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Out-Patient updated successfully!');
    
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

        -- Delete from out_patient table
        DELETE FROM out_patient
        WHERE patient_patient_id = v_patient_id;

        -- Delete from patient table
        DELETE FROM patient
        WHERE patient_id = v_patient_id;

        -- Delete from person table
        DELETE FROM person
        WHERE person_id = v_person_id;

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Out-Patient deleted successfully!');
    
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
END manage_out_patient;
/

