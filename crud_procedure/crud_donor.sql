CREATE OR REPLACE PROCEDURE manage_donor (
    p_email_id      IN  person.email_id%TYPE,
    p_first_name    IN  person.first_name%TYPE DEFAULT NULL,
    p_last_name     IN  person.last_name%TYPE DEFAULT NULL,
    p_dob           IN  person.dob%TYPE DEFAULT NULL,
    p_blood_group   IN  person.blood_group%TYPE DEFAULT NULL,
    p_gender        IN  person.gender%TYPE DEFAULT NULL,
    p_phone_number  IN  person.phone_number%TYPE DEFAULT NULL,
    p_address       IN  person.address%TYPE DEFAULT NULL,
    p_action        IN  VARCHAR2
)
IS
v_person_id   person.person_id%TYPE;
BEGIN
   
    IF p_action = 'INSERT' THEN
        -- Insert new person record
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
            p_email_id,  -- Use p_email_id parameter here
            p_phone_number,
            p_address,
            SYSDATE
        );
        
        -- Insert new donor record
        INSERT INTO donor (
            donor_id,
            registration_date,
            person_person_id
        ) VALUES (
            donor_id_seq.NEXTVAL,
            SYSDATE,
            person_id_seq.CURRVAL
        );
        
        COMMIT;
        
        dbms_output.put_line('Data inserted successfully.');
        
    ELSIF p_action = 'UPDATE' THEN
        -- Update existing person record based on email ID
        UPDATE person
        SET 
            first_name = NVL(p_first_name, first_name),
            last_name = NVL(p_last_name, last_name),
            dob = NVL(p_dob, dob),
            blood_group = NVL(p_blood_group, blood_group),
            gender = NVL(p_gender, gender),
            phone_number = NVL(p_phone_number, phone_number),
            address = NVL(p_address, address)
        WHERE email_id = p_email_id;
        
        COMMIT;
        
        dbms_output.put_line('Data updated successfully.');
        
    ELSIF p_action = 'DELETE' THEN
    
    -- Get the person_id based on the email_id
    SELECT person_id INTO v_person_id
    FROM person
    WHERE email_id = p_email_id;
    
    -- Delete existing donor record
        DELETE FROM donor
        WHERE person_person_id = v_person_id;

        -- Delete existing person record based on email ID
        DELETE FROM person
        WHERE email_id = p_email_id;
        
        COMMIT;
        
        dbms_output.put_line('Data deleted successfully.');
        
    ELSE
        dbms_output.put_line('Invalid action specified.');
    END IF;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        -- Handle the unique constraint violation error here
        DBMS_OUTPUT.PUT_LINE('Error: Unique constraint violation. The email address already exists.');
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('Error: ' || SQLERRM);
END manage_donor;
/
