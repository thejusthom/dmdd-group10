SET SERVEROUTPUT ON;
BEGIN
--to be run by patient
-- Inserting records for appointment
     -- Inserting records for appointment
    manage_appointment('INSERT', 1, TO_DATE('2024-04-12', 'YYYY-MM-DD'), 'Scheduled', 1, 1, 'Consultation', 'Fever', 1);
    manage_appointment('INSERT', 2, TO_DATE('2024-04-13', 'YYYY-MM-DD'), 'Scheduled', 2, 2, 'Follow-up', 'Headache', 2);
    manage_appointment('INSERT', 3, TO_DATE('2024-04-14', 'YYYY-MM-DD'), 'Scheduled', 3, 3, 'Check-up', 'Stomachache', 3);
    manage_appointment('INSERT', 4, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Scheduled', 4, 4, 'Consultation', 'Back pain', 4);
    manage_appointment('INSERT', 5, TO_DATE('2024-04-16', 'YYYY-MM-DD'), 'Scheduled', 5, 5, 'Follow-up', 'Cough', 5);

-- to be run by doctor  
    -- Inserting records for after appointment
    complete_appointment(p_appointment_id => 1, p_bp => 120, p_pulse => 80, p_weight => 70, p_height => 170, p_general_condition => 'Stable', p_fee => 100, p_prescription_date => TO_DATE('2024-04-12', 'YYYY-MM-DD'), p_medicine_duration => 7, p_medicine_dosage_per_day => 'Morning and Evening', p_medicine_quantity => 14, p_email_id => 'john@example.com', p_blood_group => 'A+', p_blood_quantity => 2, p_blood_camp_id => 1);
    complete_appointment(p_appointment_id => 2, p_bp => 130, p_pulse => 75, p_weight => 65, p_height => 165, p_general_condition => 'Stable', p_fee => 150, p_prescription_date => TO_DATE('2024-04-13', 'YYYY-MM-DD'), p_medicine_duration => 5, p_medicine_dosage_per_day => 'Once a day', p_medicine_quantity => 5, p_email_id => 'jane@example.com', p_blood_group => 'B-', p_blood_quantity => 3, p_blood_camp_id => 2);
    complete_appointment(p_appointment_id => 3, p_bp => 110, p_pulse => 70, p_weight => 75, p_height => 175, p_general_condition => 'Stable', p_fee => 120, p_prescription_date => TO_DATE('2024-04-14', 'YYYY-MM-DD'), p_medicine_duration => 10, p_medicine_dosage_per_day => 'Twice a day', p_medicine_quantity => 20, p_email_id => 'ryan@example.com', p_blood_group => 'AB+', p_blood_quantity => 4, p_blood_camp_id => 3);
    complete_appointment(p_appointment_id => 4, p_bp => 115, p_pulse => 78, p_weight => 72, p_height => 172, p_general_condition => 'Stable', p_fee => 130, p_prescription_date => TO_DATE('2024-04-15', 'YYYY-MM-DD'), p_medicine_duration => 3, p_medicine_dosage_per_day => 'After meals', p_medicine_quantity => 9, p_email_id => 'sara@example.com', p_blood_group => 'O-', p_blood_quantity => 6, p_blood_camp_id => 4);
    complete_appointment(p_appointment_id => 5, p_bp => 125, p_pulse => 72, p_weight => 68, p_height => 168, p_general_condition => 'Stable', p_fee => 110, p_prescription_date => TO_DATE('2024-04-16', 'YYYY-MM-DD'), p_medicine_duration => 14, p_medicine_dosage_per_day => 'Morning', p_medicine_quantity => 28, p_email_id => 'alex@example.com', p_blood_group => 'A-', p_blood_quantity => 8, p_blood_camp_id => 5);

  -- Inserting records for blood requirements
--    manage_blood_requirement(NULL, 10, 'A+', 'N', 1, 101, 'INSERT');
--    manage_blood_requirement(NULL, 8, 'O-', 'N', 2, 102, 'INSERT');
--    manage_blood_requirement(NULL, 15, 'AB-', 'N', 3, 103, 'INSERT');
--    manage_blood_requirement(NULL, 20, 'B+', 'N', 4, 104, 'INSERT');
--    manage_blood_requirement(NULL, 12, 'A-', 'N', 5, 105, 'INSERT');


EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;    