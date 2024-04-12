CREATE OR REPLACE PROCEDURE manage_blood_camp (
    p_blood_camp_id IN blood_camp.blood_camp_id%TYPE,
    p_address IN blood_camp.address%TYPE DEFAULT NULL,
    p_start_date IN blood_camp.start_date%TYPE DEFAULT NULL,
    p_end_date IN blood_camp.end_date%TYPE DEFAULT NULL,
    p_action IN VARCHAR2 DEFAULT NULL
)
IS
    v_count NUMBER;
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO blood_camp (
            blood_camp_id,
            address,
            start_date,
            end_date
        ) VALUES (
            blood_camp_id_seq.nextval,
            p_address,
            p_start_date,
            p_end_date
        );
        
        COMMIT;
        
        dbms_output.put_line('Data inserted successfully.');
        
    ELSIF p_action = 'UPDATE' THEN
    
        IF p_blood_camp_id IS NULL THEN
                RAISE_APPLICATION_ERROR(-20001, 'Blood camp ID cannot be NULL for update operation');
        END IF;
    
    SELECT COUNT(*)
    INTO v_count
    FROM blood_camp
    WHERE blood_camp_id = p_blood_camp_id;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No blood camp found with the provided ID');
    END IF;
        UPDATE blood_camp
        SET 
            address = NVL(p_address, address),
            start_date = NVL(p_start_date, start_date),
            end_date = NVL(p_end_date, end_date)
        WHERE
            blood_camp_id = p_blood_camp_id;
        
        COMMIT;
        
        dbms_output.put_line('Data updated successfully.');
        
    ELSIF p_action = 'DELETE' THEN
        IF p_blood_camp_id IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'No blood camp found with the provided ID');
        END IF;
        
        SELECT COUNT(*)
        INTO v_count
        FROM blood_camp
        WHERE blood_camp_id = p_blood_camp_id;
        
        IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No blood camp found with the provided ID');
        END IF;

        DELETE FROM blood_camp
        WHERE blood_camp_id = p_blood_camp_id;
        
        COMMIT;
        
        dbms_output.put_line('Data deleted successfully.');
        
    ELSE
        dbms_output.put_line('Invalid action specified.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
    IF SQLCODE = -20001 THEN
            DBMS_OUTPUT.PUT_LINE('No blood camp found with the provided ID');
    ELSE
        ROLLBACK;
        dbms_output.put_line('Error: ' || SQLERRM);
    END IF;
END manage_blood_camp;
/
