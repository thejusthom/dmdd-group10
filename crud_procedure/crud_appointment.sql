CREATE OR REPLACE PROCEDURE manage_appointment (
    p_operation                IN VARCHAR2, -- 'INSERT', 'UPDATE', or 'DELETE'
    p_appointment_id           IN appointment.appointment_id%TYPE,
    p_appointment_date         IN appointment.appointment_date%TYPE DEFAULT NULL,
    p_status                   IN appointment.status%TYPE DEFAULT NULL,
    p_patient_patient_id       IN appointment.patient_patient_id%TYPE DEFAULT NULL,
    p_doctor_doctor_id         IN appointment.doctor_doctor_id%TYPE DEFAULT NULL,
    p_appointment_type         IN appointment.appointment_type%TYPE DEFAULT NULL,
    p_diagnosis                IN appointment.diagnosis%TYPE DEFAULT NULL,
    p_appointment_slot_slot_id IN appointment.appointment_slot_slot_id%TYPE DEFAULT NULL
)
IS
BEGIN
    IF p_operation = 'INSERT' THEN
        INSERT INTO appointment (appointment_id, appointment_date, status, patient_patient_id, doctor_doctor_id, appointment_type, diagnosis, appointment_slot_slot_id)
        VALUES (p_appointment_id, p_appointment_date, p_status, p_patient_patient_id, p_doctor_doctor_id, p_appointment_type, p_diagnosis, p_appointment_slot_slot_id);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Appointment inserted successfully.');
        
    ELSIF p_operation = 'UPDATE' THEN
        UPDATE appointment
        SET appointment_date = COALESCE(p_appointment_date, appointment_date),
            status = COALESCE(p_status, status),
            patient_patient_id = COALESCE(p_patient_patient_id, patient_patient_id),
            doctor_doctor_id = COALESCE(p_doctor_doctor_id, doctor_doctor_id),
            appointment_type = COALESCE(p_appointment_type, appointment_type),
            diagnosis = COALESCE(p_diagnosis, diagnosis),
            appointment_slot_slot_id = COALESCE(p_appointment_slot_slot_id, appointment_slot_slot_id)
        WHERE appointment_id = p_appointment_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Appointment updated successfully.');
        
    ELSIF p_operation = 'DELETE' THEN
        DELETE FROM appointment
        WHERE appointment_id = p_appointment_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Appointment deleted successfully.');
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid operation. Please specify INSERT, UPDATE, or DELETE.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END manage_appointment;
/