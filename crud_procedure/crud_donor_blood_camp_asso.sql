CREATE OR REPLACE PROCEDURE manage_donor_blood_camp_asso (
    p_donor_blood_id       IN donor_blood_camp_asso.donor_blood_id%TYPE,
    p_blood_camp_id        IN donor_blood_camp_asso.blood_camp_blood_camp_id%TYPE DEFAULT NULL,
    p_email_id             IN person.email_id%TYPE,
    p_action               IN VARCHAR2
)
IS
    v_row_count NUMBER;
    v_donor_id donor.donor_id%TYPE;
    v_donated_date DATE;
BEGIN
    -- Get donor_id based on email_id
    SELECT donor_id INTO v_donor_id
    FROM donor
    WHERE person_person_id = (SELECT person_id FROM person WHERE email_id = p_email_id);

    IF p_action = 'INSERT' THEN
        INSERT INTO donor_blood_camp_asso (
            donor_blood_id,
            blood_camp_blood_camp_id,
            donor_donor_id,
            donated_date,
            isbloodconsumed
        ) VALUES (
            donor_blood_id_seq.NEXTVAL,
            p_blood_camp_id,
            v_donor_id,
            SYSDATE,
            'N' -- Always set to 'N'
        );
        
        COMMIT;
        dbms_output.put_line('Data inserted successfully.');
        
    ELSIF p_action = 'UPDATE' THEN
        -- Check if the donated date is within 14 days
        SELECT donated_date INTO v_donated_date
        FROM donor_blood_camp_asso
        WHERE donor_blood_id = p_donor_blood_id;

        IF SYSDATE - v_donated_date <= 14 THEN
            dbms_output.put_line('You cannot donate blood again within 14 days of your last donation.');
        ELSE
            -- Update operation if the donated date is more than 14 days ago
            UPDATE donor_blood_camp_asso
            SET
                blood_camp_blood_camp_id = NVL(p_blood_camp_id, blood_camp_blood_camp_id)
            WHERE
                donor_blood_id = p_donor_blood_id;

            COMMIT;
            dbms_output.put_line('Data updated successfully.');
        END IF;
        
    ELSIF p_action = 'DELETE' THEN
        SELECT COUNT(*)
        INTO v_row_count
        FROM donor_blood_camp_asso
        WHERE donor_blood_id = p_donor_blood_id;

        IF v_row_count = 0 THEN
            dbms_output.put_line('No record found to delete.');
            RETURN;
        END IF;

        DELETE FROM donor_blood_camp_asso
        WHERE donor_blood_id = p_donor_blood_id;
        
        COMMIT;
        dbms_output.put_line('Data deleted successfully.');
        
    ELSE
        dbms_output.put_line('Invalid action specified.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No donor found with email: ' || p_email_id);
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('Error: ' || SQLERRM);
END manage_donor_blood_camp_asso;
/
