CREATE OR REPLACE PROCEDURE insert_appointment (
    p_status                IN appointment.status%TYPE,
    p_patient_patient_id    IN appointment.patient_patient_id%TYPE,
    p_doctor_doctor_id      IN appointment.doctor_doctor_id%TYPE,
    p_diagnosis             IN appointment.diagnosis%TYPE,
    p_appointment_slot_slot_id IN appointment.appointment_slot_slot_id%TYPE
)
IS
BEGIN
    INSERT INTO appointment (status, patient_patient_id, doctor_doctor_id, diagnosis, appointment_slot_slot_id)
    VALUES (p_status, p_patient_patient_id, p_doctor_doctor_id, p_diagnosis, p_appointment_slot_slot_id);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Appointment values inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting into appointment table: ' || SQLERRM);
END insert_appointment;
/