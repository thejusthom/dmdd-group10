CREATE OR REPLACE PROCEDURE manage_health_report (
    p_report_id            IN health_report.report_id%TYPE DEFAULT NULL,
    p_bp                   IN health_report.bp%TYPE DEFAULT NULL,
    p_pulse                IN health_report.pulse%TYPE DEFAULT NULL,
    p_weight               IN health_report.weight%TYPE DEFAULT NULL,
    p_height               IN health_report.height%TYPE DEFAULT NULL,
    p_general_condition    IN VARCHAR2 DEFAULT NULL,
    p_patient_id           IN health_report.patient_patient_id%TYPE DEFAULT NULL,
    p_action               IN VARCHAR2
)
IS
    v_row_count NUMBER;
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO health_report (
            report_id,
            bp,
            pulse,
            weight,
            height,
            general_condition,
            patient_patient_id
        ) VALUES (
            report_id_seq.NEXTVAL,
            p_bp,
            p_pulse,
            p_weight,
            p_height,
            p_general_condition,
            p_patient_id
        );
        
        COMMIT;
        dbms_output.put_line('Health report inserted successfully.');
        
    ELSIF p_action = 'UPDATE' THEN
        SELECT COUNT(*)
        INTO v_row_count
        FROM health_report
        WHERE report_id = p_report_id;

        IF v_row_count = 0 THEN
            dbms_output.put_line('No health report found to update.');
            RETURN;
        END IF;

        UPDATE health_report
        SET
            bp = p_bp,
            pulse = p_pulse,
            weight = p_weight,
            height = p_height,
            general_condition = p_general_condition,
            patient_patient_id = p_patient_id
        WHERE
            report_id = p_report_id;
        
        COMMIT;
        dbms_output.put_line('Health report updated successfully.');
        
    ELSIF p_action = 'DELETE' THEN
        SELECT COUNT(*)
        INTO v_row_count
        FROM health_report
        WHERE report_id = p_report_id;

        IF v_row_count = 0 THEN
            dbms_output.put_line('No health report found to delete.');
            RETURN;
        END IF;

        DELETE FROM health_report
        WHERE report_id = p_report_id;
        
        COMMIT;
        dbms_output.put_line('Health report deleted successfully.');
        
    ELSE
        dbms_output.put_line('Invalid action specified.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('Error: ' || SQLERRM);
END manage_health_report;
/
