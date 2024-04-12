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
    p_department_id        IN NUMBER DEFAULT NULL,
    p_joining_exp          IN NUMBER DEFAULT NULL,
    p_is_active            IN CHAR DEFAULT NULL
) AS
    v_person_id     NUMBER;
    v_doctor_id     NUMBER;
BEGIN
    -- Insertion
    IF p_to_do = 'insert' THEN
        -- Get next values from sequences
        SELECT doctor_id_seq.NEXTVAL, person_id_seq.NEXTVAL INTO v_doctor_id, v_person_id FROM DUAL;

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
            v_person_id,
            p_first_name,
            p_last_name,
            p_dob,
            p_blood_group,
            p_gender,
            p_email_id,
            p_phone_number,
            p_address,
            p_created_date
        );

        -- Insert into doctor table
        INSERT INTO doctor (
            doctor_id,
            specialization,
            person_person_id,
            department_dept_id,
            joining_exp,
            is_active
        ) VALUES (
            v_doctor_id,
            p_specialization,
            v_person_id,
            p_department_id,
            p_joining_exp,
            p_is_active
        );
        
        -- Commit the transaction
        COMMIT;

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Doctor inserted successfully!');
    
    -- Updating
    ELSIF p_to_do = 'update' THEN
        -- Check if doctor email ID exists
        SELECT person_id INTO v_person_id
        FROM person
        WHERE email_id = p_email_id;
        
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
            email_id = COALESCE(p_email_id, email_id),
            phone_number = COALESCE(p_phone_number, phone_number),
            address = COALESCE(p_address, address)
        WHERE
            person_id = v_person_id;

        -- Update doctor table
        UPDATE doctor
        SET
            specialization = COALESCE(p_specialization, specialization),
            department_dept_id = COALESCE(p_department_id, department_dept_id),
            joining_exp = COALESCE(p_joining_exp, joining_exp),
            is_active = COALESCE(p_is_active, is_active)
        WHERE
            person_person_id = v_person_id;

        -- Commit the transaction
        COMMIT;
        
        -- Output success message
        DBMS_OUTPUT.PUT_LINE('Doctor updated successfully!');
    
    -- Deletion
    ELSIF p_to_do = 'delete' THEN
        -- Check if doctor email ID exists
        SELECT person_id INTO v_person_id
        FROM person
        WHERE email_id = p_email_id;
        
        -- If person ID does not exist, raise an exception
        IF v_person_id IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'Person ID does not exist.');
        END IF;

        -- Delete from doctor table
        DELETE FROM doctor
        WHERE person_person_id = v_person_id;

        -- Delete from person table
        DELETE FROM person
        WHERE person_id = v_person_id;
        
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
        DBMS_OUTPUT.PUT_LINE('Doctor with email ID ' || p_email_id || ' not found.');
    WHEN OTHERS THEN
        -- Rollback transaction in case of any error
        ROLLBACK;
        -- Raise the exception again to propagate it to the caller
        RAISE;
END manage_doctor;
/



INSERT INTO department (dept_id, dept_name, hod)
VALUES (2, 'Neurology Department', 'Dr. Smith');

EXECUTE manage_doctor('insert', NULL, 'John', 'Doe', TO_DATE('1985-05-20', 'YYYY-MM-DD'), 'O+', 'Male', SYSDATE, 'john@example.com', 1234567890, '123 Main St', 'Neurologist', 2, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Y');

EXECUTE manage_doctor('update', NULL, 'Jane', 'Smith', NULL, NULL, NULL, NULL, 'john@example.com');

EXECUTE manage_doctor('delete', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'john@example.com');


select * from doctor;
select * from person;
delete from department;
delete from doctor;
delete from person;

SELECT person_person_id FROM doctor WHERE doctor_id = 4;

