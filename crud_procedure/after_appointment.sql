CREATE OR REPLACE PROCEDURE complete_appointment (
    p_appointment_id IN appointment.appointment_id%TYPE,
    p_bp IN health_report.bp%TYPE,
    p_pulse IN health_report.pulse%TYPE,
    p_weight IN health_report.weight%TYPE,
    p_height IN health_report.height%TYPE,
    p_general_condition IN health_report.general_condition%TYPE,
    p_fee IN appointment.fee%TYPE,
    p_prescription_date IN prescription.prescription_date%TYPE,
    p_medicine_duration IN medicine.duration%TYPE,
    p_medicine_dosage_per_day IN medicine.dosage_per_day%TYPE,
    p_medicine_quantity IN medicine.quantity%TYPE,
    p_email_id IN person.email_id%TYPE,
    p_blood_group IN blood_requirement.blood_group%TYPE,
    p_blood_quantity IN blood_requirement.quantity_required%TYPE,
    p_blood_camp_id IN blood_camp.blood_camp_id%TYPE
) AS
    v_health_report_id   health_report.report_id%TYPE;
    v_prescription_id    prescription.prescription_id%TYPE;
    v_medicine_id        medicine.medicine_id%TYPE;
    v_blood_requirement_id blood_requirement.requirement_id%TYPE;
    v_patient_id         patient.patient_id%TYPE;
    v_count              NUMBER;
    blood_camp_error     EXCEPTION;
    patient_email_error  EXCEPTION;
    appointment_id_error EXCEPTION;

BEGIN
    -- Check if the appointment_id exists
    SELECT COUNT(*)
    INTO v_count
    FROM appointment
    WHERE appointment_id = p_appointment_id;
   

    IF v_count = 0 THEN
       RAISE appointment_id_error;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Appointment id is correct');
    SELECT patient_id
    INTO v_patient_id
    FROM patient
    WHERE person_person_id = (SELECT person_id FROM person WHERE email_id = p_email_id);

    IF v_patient_id IS NULL THEN
        RAISE patient_email_error;
    END IF;
     DBMS_OUTPUT.PUT_LINE('Patient id is correct');

    IF p_blood_camp_id IS NOT NULL THEN
        -- Check if the blood_camp_id is valid
        SELECT COUNT(*)
        INTO v_count
        FROM blood_camp
        WHERE blood_camp_id = p_blood_camp_id;

        IF v_count = 0 THEN
            RAISE blood_camp_error;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Blood camp id is correct');
    END IF;

    -- Update appointment status to 'completed'
    UPDATE appointment
    SET status = 'completed', fee = p_fee
    WHERE appointment_id = p_appointment_id;
    DBMS_OUTPUT.PUT_LINE('Appointment updated');

    -- Insert health report
    INSERT INTO health_report (report_id, bp, pulse, weight, height, general_condition, patient_patient_id)
    VALUES (report_id_seq.NEXTVAL, p_bp, p_pulse, p_weight, p_height, p_general_condition, v_patient_id)
    RETURNING report_id INTO v_health_report_id;
    DBMS_OUTPUT.PUT_LINE('Health report updated');

    -- Insert prescription
    INSERT INTO prescription (prescription_id, patient_patient_id, prescription_date)
    VALUES (prescription_id_seq.NEXTVAL, v_patient_id, p_prescription_date)
    RETURNING prescription_id INTO v_prescription_id;
    DBMS_OUTPUT.PUT_LINE('Prescription updated');

    -- Insert medicine
    INSERT INTO medicine (medicine_id, duration, dosage_per_day, quantity, prescription_prescription_id)
    VALUES (medicine_id_seq.NEXTVAL, p_medicine_duration, p_medicine_dosage_per_day, p_medicine_quantity, v_prescription_id)
    RETURNING medicine_id INTO v_medicine_id;
    DBMS_OUTPUT.PUT_LINE('Medicine updated');

    -- Insert blood requirement if applicable
    IF p_blood_camp_id IS NOT NULL THEN
        INSERT INTO blood_requirement (requirement_id, quantity_required, blood_group, fullfilled, blood_camp_blood_camp_id, prescription_prescription_id)
        VALUES (requirement_id_seq.NEXTVAL, p_blood_quantity, p_blood_group, 'N', p_blood_camp_id, v_prescription_id);
    END IF;

    COMMIT;
EXCEPTION
    WHEN appointment_id_error THEN
        DBMS_OUTPUT.PUT_LINE('Appointment id is wrong');
        ROLLBACK;
    WHEN patient_email_error THEN
        DBMS_OUTPUT.PUT_LINE('Patient email is wrong');
        ROLLBACK;
    WHEN blood_camp_error THEN
        DBMS_OUTPUT.PUT_LINE('Blood camp id is wrong');
        ROLLBACK;
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END complete_appointment;
