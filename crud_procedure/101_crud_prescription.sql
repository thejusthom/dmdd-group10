-- Create the manage_prescription procedure
CREATE OR REPLACE PROCEDURE manage_prescription (
    p_prescription_id       IN prescription.prescription_id%TYPE DEFAULT NULL,
    p_patient_patient_id    IN prescription.patient_patient_id%TYPE DEFAULT NULL,
    p_prescription_date     IN prescription.prescription_date%TYPE DEFAULT NULL,
    p_action                IN VARCHAR2
)
IS
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO prescription (
            prescription_id,
            patient_patient_id,
            prescription_date
        ) VALUES (
            prescription_id_seq.NEXTVAL,
            p_patient_patient_id,
            SYSDATE
        );

        COMMIT;
        dbms_output.put_line('Prescription inserted successfully.');
        
    ELSIF p_action = 'UPDATE' THEN
        UPDATE prescription
        SET
            patient_patient_id = NVL(p_patient_patient_id,patient_patient_id),
            prescription_date = NVL(p_prescription_date,prescription_date)
        WHERE
            prescription_id = p_prescription_id;
        
        COMMIT;
        dbms_output.put_line('Prescription updated successfully.');
        
    ELSIF p_action = 'DELETE' THEN
        DELETE FROM prescription
        WHERE prescription_id = p_prescription_id;
        
        COMMIT;
        dbms_output.put_line('Prescription deleted successfully.');
        
    ELSE
        dbms_output.put_line('Invalid action specified.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('Error: ' || SQLERRM);
END manage_prescription;
/