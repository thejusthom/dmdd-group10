CREATE OR REPLACE PROCEDURE manage_donor_blood_camp_asso (
    p_donor_blood_id       IN donor_blood_camp_asso.donor_blood_id%TYPE,
    p_blood_camp_id        IN donor_blood_camp_asso.blood_camp_blood_camp_id%TYPE DEFAULT NULL,
    p_donor_id             IN donor_blood_camp_asso.donor_donor_id%TYPE DEFAULT NULL,
    p_action               IN VARCHAR2
)
IS
    v_row_count NUMBER;
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO donor_blood_camp_asso (
            donor_blood_id,
            blood_camp_blood_camp_id,
            donor_donor_id,
            donated_date,
            isbloodconsumed
        ) VALUES (
            donor_blood_id_seq.nextval,
            p_blood_camp_id,
            p_donor_id,
            SYSDATE,
            'N' -- Always set to 'N'
        );
        
        COMMIT;
        dbms_output.put_line('Data inserted successfully.');
        
    ELSIF p_action = 'UPDATE' THEN
        SELECT COUNT(*)
        INTO v_row_count
        FROM donor_blood_camp_asso
        WHERE donor_blood_id = p_donor_blood_id;

        IF v_row_count = 0 THEN
            dbms_output.put_line('No record found to update.');
            RETURN;
        END IF;

        UPDATE donor_blood_camp_asso
        SET
            blood_camp_blood_camp_id = NVL(p_blood_camp_id, blood_camp_blood_camp_id),
            donor_donor_id = NVL(p_donor_id, donor_donor_id)
        WHERE
            donor_blood_id = p_donor_blood_id;
        
        COMMIT;
        dbms_output.put_line('Data updated successfully.');
        
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
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('Error: ' || SQLERRM);
END manage_donor_blood_camp_asso;
/
