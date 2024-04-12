CREATE OR REPLACE PROCEDURE complete_appointment (
    p_appointment_id IN NUMBER,
    p_email_id IN VARCHAR2(200),
) AS
    v_patient_id         NUMBER;
BEGIN
    -- Check if the appointment_id exists
    SELECT COUNT(*)
    INTO v_count
    FROM appointment
    WHERE appointment_id = p_appointment_id;

    IF v_count = 0 THEN
       RAISE appointment_id_error;
    END IF;

    SELECT patient_id
    INTO v_patient_id
    FROM patient
    WHERE person_person_id = (SELECT person_id FROM person WHERE email_id = p_email_id);

    IF v_patient_id IS NULL THEN
        RAISE patient_email_error;
    END IF;

    COMMIT;
EXCEPTION
    WHEN appointment_id_error THEN
        DBMS_OUTPUT.PUT_LINE('Appointment id is wrong');
        RETURN 0;
    WHEN patient_email_error THEN
        DBMS_OUTPUT.PUT_LINE('Patient email is wrong');
        RETURN 0;
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END complete_appointment;
