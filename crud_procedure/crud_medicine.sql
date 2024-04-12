-- Create the manage_medicine procedure
CREATE OR REPLACE PROCEDURE manage_medicine (
    p_medicine_id              IN medicine.medicine_id%TYPE DEFAULT NULL,
    p_quantity                 IN medicine.quantity%TYPE DEFAULT NULL,
    p_duration                 IN medicine.duration%TYPE DEFAULT NULL,
    p_dosage_per_day           IN medicine.dosage_per_day%TYPE DEFAULT NULL,
    p_prescription_prescription_id IN medicine.prescription_prescription_id%TYPE,
    p_action                   IN VARCHAR2
)
IS
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO medicine (
            medicine_id,
            quantity,
            duration,
            dosage_per_day,
            prescription_prescription_id
        ) VALUES (
            medicine_id_seq.nextval,
            p_quantity,
            p_duration,
            p_dosage_per_day,
            p_prescription_prescription_id
        );

        COMMIT;
        dbms_output.put_line('Medicine inserted successfully.');
        
    ELSIF p_action = 'UPDATE' THEN
        UPDATE medicine
        SET
            quantity = p_quantity,
            duration = p_duration,
            dosage_per_day = p_dosage_per_day,
            prescription_prescription_id = p_prescription_prescription_id
        WHERE
            medicine_id = p_medicine_id;
        
        COMMIT;
        dbms_output.put_line('Medicine updated successfully.');
        
    ELSIF p_action = 'DELETE' THEN
        DELETE FROM medicine
        WHERE medicine_id = p_medicine_id;
        
        COMMIT;
        dbms_output.put_line('Medicine deleted successfully.');
        
    ELSE
        dbms_output.put_line('Invalid action specified.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('Error: ' || SQLERRM);
END manage_medicine;
/

-- Test inserting a new medicine record
BEGIN
    manage_medicine(
        p_medicine_id => medicine_id_seq.nextval,
        p_quantity => 50,
        p_duration => 7,
        p_dosage_per_day => '2 tablets',
        p_prescription_prescription_id => 1,
        p_action => 'INSERT'
    );
END;
/