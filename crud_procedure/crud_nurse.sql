CREATE OR REPLACE PROCEDURE manage_nurse (
    p_to_do                IN VARCHAR2,
    p_email_id             IN VARCHAR2 DEFAULT NULL,
    p_first_name           IN VARCHAR2 DEFAULT NULL,
    p_last_name            IN VARCHAR2 DEFAULT NULL,
    p_dob                  IN DATE DEFAULT NULL,
    p_blood_group          IN VARCHAR2 DEFAULT NULL,
    p_gender               IN VARCHAR2 DEFAULT NULL,
    p_created_date         IN DATE DEFAULT NULL,
    p_phone_number         IN NUMBER DEFAULT NULL,
    p_address              IN VARCHAR2 DEFAULT NULL,
    p_department_id        IN NUMBER DEFAULT NULL,
    p_joining_exp          IN DATE DEFAULT NULL,
    p_is_active            IN CHAR DEFAULT NULL
) AS
    v_person_id     NUMBER;
    v_nurse_id      NUMBER;
BEGIN
    -- Insertion
    IF p_to_do = 'insert' THEN
        -- Get next values from sequences
        SELECT nurse_id_seq.NEXTVAL, person_id_seq.NEXTVAL INTO v_nurse_id, v_person_id FROM DUAL;

        -- Insert into person table
        INSERT INTO person (
            person_id,
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
            v_person_id,
            p_first_name,
            p_last_name,
            p_dob,
            p_blood_group,
            p_gender,
            p_created_date,
            p_email_id,
            p_phone_number,
            p_address
        );

        -- Insert into nurse table
        INSERT INTO nurse (
            nurse_id,
            department_dept_id,
            person_person_id,
            is_active
        ) VALUES (
            v_nurse_id,
            p_department_id,
            v_person_id,
            p_is_active
        );
        
        -- Commit the transaction
        COMMIT;

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Nurse inserted successfully!');
    
    -- Updating
    ELSIF p_to_do = 'update' THEN
        -- Check if email ID exists
        SELECT person_id INTO v_person_id
        FROM person
        WHERE email_id = p_email_id;
        
        -- If person ID does not exist, raise an exception
        IF v_person_id IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'Email ID does not exist.');
        END IF;

        -- Update person table
        UPDATE person
        SET
            first_name = COALESCE(p_first_name, first_name),
            last_name = COALESCE(p_last_name, last_name),
            dob = COALESCE(p_dob, dob),
            blood_group = COALESCE(p_blood_group, blood_group),
            gender = COALESCE(p_gender, gender),
            phone_number = COALESCE(p_phone_number, phone_number),
            address = COALESCE(p_address, address)
        WHERE
            email_id = p_email_id;

        -- Update nurse table
        UPDATE nurse
        SET
            department_dept_id = COALESCE(p_department_id, department_dept_id),
            is_active = COALESCE(p_is_active, is_active)
        WHERE
            person_person_id = v_person_id;

        -- Commit the transaction
        COMMIT;
        
        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Nurse updated successfully!');
    
    -- Deletion
    ELSIF p_to_do = 'delete' THEN
        -- Check if email ID exists
        SELECT person_id INTO v_person_id
        FROM person
        WHERE email_id = p_email_id;
        
        -- If person ID does not exist, raise an exception
        IF v_person_id IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'Email ID does not exist.');
        END IF;

        -- Delete from nurse table
        DELETE FROM nurse
        WHERE person_person_id = v_person_id;

        -- Delete from person table
        DELETE FROM person
        WHERE email_id = p_email_id;
        
        -- Commit the transaction
        COMMIT;
        
        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Nurse deleted successfully!');
    
    ELSE
        -- If invalid operation specified
        RAISE_APPLICATION_ERROR(-20003, 'Invalid operation specified. Valid operations are: insert, update, delete');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If the email ID does not exist
        DBMS_OUTPUT.PUT_LINE('Nurse with email ID ' || p_email_id || ' not found.');
    WHEN OTHERS THEN
        -- Rollback transaction in case of any error
        ROLLBACK;
        -- Raise the exception again to propagate it to the caller
        RAISE;
END manage_nurse;
/

