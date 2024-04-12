CREATE OR REPLACE PROCEDURE manage_doctor (
    p_to_do                IN VARCHAR2,
    p_doctor_id            IN NUMBER DEFAULT NULL,
    p_first_name           IN VARCHAR2 DEFAULT NULL,
    p_last_name            IN VARCHAR2 DEFAULT NULL,
    p_dob                  IN DATE DEFAULT NULL,
    p_blood_group          IN VARCHAR2 DEFAULT NULL,
    p_gender               IN VARCHAR2 DEFAULT NULL,
    p_created_date         IN DATE DEFAULT NULL,
    p_email_id             IN VARCHAR2 DEFAULT NULL,
    p_phone_number         IN NUMBER DEFAULT NULL,
    p_address              IN VARCHAR2 DEFAULT NULL,
    p_specialization       IN VARCHAR2 DEFAULT NULL,
    p_deptartment_id       IN NUMBER DEFAULT NULL,
    p_joining_exp          IN DATE DEFAULT NULL,
    p_is_active            IN CHAR DEFAULT NULL
) AS
    v_person_id     NUMBER;
BEGIN
    -- Insertion
    IF p_to_do = 'insert' THEN
        -- Insert into person table
        INSERT INTO person (
            first_name,
            last_name,
            dob,
            blood_group,
            gender,
            created_date,
            email_id,
            phone_number,
            address
        ) VALUES (
            p_first_name,
            p_last_name,
            p_dob,
            p_blood_group,
            p_gender,
            p_created_date,
            p_email_id,
            p_phone_number,
            p_address
        )
        RETURNING person_id INTO v_person_id;

        -- Insert into doctor table
        INSERT INTO doctor (
            doctor_id,
            specialization,
            person_person_id,
            deptartment_department_id,
            joining_exp,
            is_active
        ) VALUES (
            NULL, -- Assuming doctor_id is auto-generated
            p_specialization,
            v_person_id,
            p_deptartment_id,
            p_joining_exp,
            p_is_active
        );
        
        -- Commit the transaction
        COMMIT;

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Doctor inserted successfully!');
    
    -- Updating
    ELSIF p_to_do = 'update' THEN
        -- Check if doctor ID exists
        SELECT person_person_id INTO v_person_id
        FROM doctor
        WHERE doctor_id = p_doctor_id;
        
        -- If person ID does not exist, raise an exception
        IF v_person_id IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'Person ID does not exist.');
        END IF;

        -- Update person table
        UPDATE person
        SET
            first_name = COALESCE(p_first_name, first_name),
            last_name = COALESCE(p_last_name, last_name),
            dob = COALESCE(p_dob, dob),
            blood_group = COALESCE(p_blood_group, blood_group),
            gender = COALESCE(p_gender, gender),
            created_date = COALESCE(p_created_date, created_date),
            email_id = COALESCE(p_email_id, email_id),
            phone_number = COALESCE(p_phone_number, phone_number),
            address = COALESCE(p_address, address)
        WHERE
            person_id = v_person_id;

        -- Update doctor table
        UPDATE doctor
        SET
            specialization = COALESCE(p_specialization, specialization),
            deptartment_department_id = COALESCE(p_deptartment_id, deptartment_department_id),
            joining_exp = COALESCE(p_joining_exp, joining_exp),
            is_active = COALESCE(p_is_active, is_active)
        WHERE
            doctor_id = p_doctor_id;

        -- Commit the transaction
        COMMIT;
        
        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Doctor updated successfully!');
    
    -- Deletion
    ELSIF p_to_do = 'delete' THEN
        -- Delete from doctor table
        DELETE FROM doctor
        WHERE doctor_id = p_doctor_id;

        -- Delete from person table
        DELETE FROM person
        WHERE person_id = (SELECT person_person_id FROM doctor WHERE doctor_id = p_doctor_id);
        
        -- Commit the transaction
        COMMIT;
        
        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Doctor deleted successfully!');
    
    ELSE
        -- If invalid operation specified
        RAISE_APPLICATION_ERROR(-20003, 'Invalid operation specified. Valid operations are: insert, update, delete');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If the doctor_id does not exist
        DBMS_OUTPUT.PUT_LINE('Doctor with ID ' || p_doctor_id || ' not found.');
    WHEN OTHERS THEN
        -- Rollback transaction in case of any error
        ROLLBACK;
        -- Raise the exception again to propagate it to the caller
        RAISE;
END manage_doctor;
/
