CREATE OR REPLACE PROCEDURE manage_appointment (
    p_operation                IN VARCHAR2, -- 'INSERT', 'UPDATE', or 'DELETE'
    p_appointment_id           IN APP_ADMIN.appointment.appointment_id%TYPE DEFAULT NULL,
    p_appointment_date         IN APP_ADMIN.appointment.appointment_date%TYPE DEFAULT NULL,
    p_status                   IN APP_ADMIN.appointment.status%TYPE DEFAULT NULL,
    p_patient_patient_id       IN APP_ADMIN.appointment.patient_patient_id%TYPE DEFAULT NULL,
    p_doctor_doctor_id         IN APP_ADMIN.appointment.doctor_doctor_id%TYPE DEFAULT NULL,
    p_appointment_type         IN APP_ADMIN.appointment.appointment_type%TYPE DEFAULT NULL,
    p_diagnosis                IN APP_ADMIN.appointment.diagnosis%TYPE DEFAULT NULL,
    p_appointment_slot_slot_id IN APP_ADMIN.appointment.appointment_slot_slot_id%TYPE DEFAULT NULL
)
IS
BEGIN
    IF p_operation = 'INSERT' THEN
        INSERT INTO APP_ADMIN.appointment (appointment_id, appointment_date, status, patient_patient_id, doctor_doctor_id, appointment_type, diagnosis, appointment_slot_slot_id)
        VALUES (APP_ADMIN.appointment_id_seq.NEXTVAL, p_appointment_date, p_status, p_patient_patient_id, p_doctor_doctor_id, p_appointment_type, p_diagnosis, p_appointment_slot_slot_id);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('APP_ADMIN.appointment inserted successfully.');
        
    ELSIF p_operation = 'UPDATE' THEN
        UPDATE APP_ADMIN.appointment
        SET appointment_date = COALESCE(p_appointment_date, appointment_date),
            status = COALESCE(p_status, status),
            patient_patient_id = COALESCE(p_patient_patient_id, patient_patient_id),
            doctor_doctor_id = COALESCE(p_doctor_doctor_id, doctor_doctor_id),
            appointment_type = COALESCE(p_appointment_type, appointment_type),
            diagnosis = COALESCE(p_diagnosis, diagnosis),
            appointment_slot_slot_id = COALESCE(p_appointment_slot_slot_id, appointment_slot_slot_id)
        WHERE appointment_id = p_appointment_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('APP_ADMIN.appointment updated successfully.');
        
    ELSIF p_operation = 'DELETE' THEN
        DELETE FROM APP_ADMIN.appointment
        WHERE appointment_id = p_appointment_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('APP_ADMIN.appointment deleted successfully.');
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid operation. Please specify INSERT, UPDATE, or DELETE.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END manage_appointment;
/