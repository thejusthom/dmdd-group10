DECLARE
    v_error_code NUMBER;
    v_error_msg VARCHAR2(4000);
BEGIN
    -- Sample data for the 'person' table
    INSERT INTO person (person_id, first_name, last_name, dob, blood_group, gender)
    VALUES (1, 'John', 'Doe', TO_DATE('1980-01-15', 'YYYY-MM-DD'), 'O+', 'Male');
    
    INSERT INTO person (person_id, first_name, last_name, dob, blood_group, gender)
    VALUES (2, 'Alice', 'Smith', TO_DATE('1990-05-20', 'YYYY-MM-DD'), 'B-', 'Female');
    
    INSERT INTO person (person_id, first_name, last_name, dob, blood_group, gender)
    VALUES (3, 'Michael', 'Johnson', TO_DATE('1985-09-10', 'YYYY-MM-DD'), 'AB+', 'Male');
    
    INSERT INTO person (person_id, first_name, last_name, dob, blood_group, gender)
    VALUES (4, 'Emily', 'Brown', TO_DATE('1978-03-15', 'YYYY-MM-DD'), 'O-', 'Female');
    
    INSERT INTO person (person_id, first_name, last_name, dob, blood_group, gender)
    VALUES (5, 'David', 'Wilson', TO_DATE('1995-11-28', 'YYYY-MM-DD'), 'A+', 'Male');
    
    INSERT INTO person (person_id, first_name, last_name, dob, blood_group, gender)
    VALUES (6, 'Sophia', 'Miller', TO_DATE('1982-07-12', 'YYYY-MM-DD'), 'B+', 'Female');
    
    -- Sample data for the 'department' table
    INSERT INTO department (dept_id, dept_name, hod)
    VALUES (1, 'Cardiology', 'Dr. Smith');
    
    INSERT INTO department (dept_id, dept_name, hod)
    VALUES (2, 'Orthopedics', 'Dr. Johnson');
    
    INSERT INTO department (dept_id, dept_name, hod)
    VALUES (3, 'Pediatrics', 'Dr. Brown');
    
    INSERT INTO department (dept_id, dept_name, hod)
    VALUES (4, 'Neurology', 'Dr. Wilson');
    
    INSERT INTO department (dept_id, dept_name, hod)
    VALUES (5, 'Oncology', 'Dr. Miller');
    
    INSERT INTO department (dept_id, dept_name, hod)
    VALUES (6, 'Gynecology', 'Dr. Garcia');
    
    -- Sample data for the 'doctor' table
    INSERT INTO doctor (doctor_id, specialization, person_person_id, department_dept_id)
    VALUES (1, 'Cardiologist', 1, 1);
    
    INSERT INTO doctor (doctor_id, specialization, person_person_id, department_dept_id)
    VALUES (2, 'Orthopedic Surgeon', 2, 2);
    
    INSERT INTO doctor (doctor_id, specialization, person_person_id, department_dept_id)
    VALUES (3, 'Pediatrician', 3, 3);
    
    INSERT INTO doctor (doctor_id, specialization, person_person_id, department_dept_id)
    VALUES (4, 'Neurologist', 4, 4);
    
    INSERT INTO doctor (doctor_id, specialization, person_person_id, department_dept_id)
    VALUES (5, 'Oncologist', 5, 5);
    
    INSERT INTO doctor (doctor_id, specialization, person_person_id, department_dept_id)
    VALUES (6, 'Gynecologist', 6, 6);
    
    -- Sample data for the 'patient' table
    INSERT INTO patient (patient_id, person_person_id)
    VALUES (1, 1);
    
    INSERT INTO patient (patient_id, person_person_id)
    VALUES (2, 2);
    
    INSERT INTO patient (patient_id, person_person_id)
    VALUES (3, 3);
    
    INSERT INTO patient (patient_id, person_person_id)
    VALUES (4, 4);
    
    INSERT INTO patient (patient_id, person_person_id)
    VALUES (5, 5);
    
    INSERT INTO patient (patient_id, person_person_id)
    VALUES (6, 6);
    
    -- Sample data for the 'appointment' table
    INSERT INTO appointment (appointment_id, appointment_date_time, status, patient_patient_id, doctor_doctor_id, appointment_type, diagnosis)
    VALUES (1, TO_DATE('2024-03-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Scheduled', 1, 1, 'Out-Patient', 'Hypertension');
    
    INSERT INTO appointment (appointment_id, appointment_date_time, status, patient_patient_id, doctor_doctor_id, appointment_type, diagnosis)
    VALUES (2, TO_DATE('2024-03-21 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Scheduled', 2, 2, 'Out-Patient', 'Fracture');
    
    INSERT INTO appointment (appointment_id, appointment_date_time, status, patient_patient_id, doctor_doctor_id, appointment_type, diagnosis)
    VALUES (3, TO_DATE('2024-03-22 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Cancelled', 3, 3, 'In-Patient', NULL);
    
    INSERT INTO appointment (appointment_id, appointment_date_time, status, patient_patient_id, doctor_doctor_id, appointment_type, diagnosis)
    VALUES (4, TO_DATE('2024-03-23 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Completed', 4, 4, 'Out-Patient', 'Headache');
    
    INSERT INTO appointment (appointment_id, appointment_date_time, status, patient_patient_id, doctor_doctor_id, appointment_type, diagnosis)
    VALUES (5, TO_DATE('2024-03-24 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Scheduled', 5, 5, 'In-Patient', NULL);
    
    INSERT INTO appointment (appointment_id, appointment_date_time, status, patient_patient_id, doctor_doctor_id, appointment_type, diagnosis)
    VALUES (6, TO_DATE('2024-03-25 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Scheduled', 6, 6, 'Out-Patient', 'Checkup');
    
    -- Sample data for the 'blood_camp' table
    INSERT INTO blood_camp (blood_camp_id, address, start_date, end_date)
    VALUES (1, '123 Main St', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'));
    
    INSERT INTO blood_camp (blood_camp_id, address, start_date, end_date)
    VALUES (2, '123 Elm Street', TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-03', 'YYYY-MM-DD'));
    
    INSERT INTO blood_camp (blood_camp_id, address, start_date, end_date)
    VALUES (3, '456 Oak Avenue', TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'));
    
    INSERT INTO blood_camp (blood_camp_id, address, start_date, end_date)
    VALUES (4, '789 Maple Road', TO_DATE('2024-04-20', 'YYYY-MM-DD'), TO_DATE('2024-04-22', 'YYYY-MM-DD'));
    
    INSERT INTO blood_camp (blood_camp_id, address, start_date, end_date)
    VALUES (5, '101 Pine Lane', TO_DATE('2024-04-25', 'YYYY-MM-DD'), TO_DATE('2024-04-27', 'YYYY-MM-DD'));
    
    INSERT INTO blood_camp (blood_camp_id, address, start_date, end_date)
    VALUES (6, '202 Cedar Court', TO_DATE('2024-05-05', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'));
    
    
    --add pres here
    
    -- Sample data for the 'prescription' table
    INSERT INTO prescription (prescription_id, patient_patient_id)
    VALUES (1, 1);
    INSERT INTO prescription (prescription_id, patient_patient_id)
    VALUES (2, 2);
    
    INSERT INTO prescription (prescription_id, patient_patient_id)
    VALUES (3, 3);
    
    INSERT INTO prescription (prescription_id, patient_patient_id)
    VALUES (4, 4);
    
    INSERT INTO prescription (prescription_id, patient_patient_id)
    VALUES (5, 5);
    
    INSERT INTO prescription (prescription_id, patient_patient_id)
    VALUES (6, 6);
    
    -- Sample data for the 'blood_requirement' table
    INSERT INTO blood_requirement (requirement_id, quantity_required, blood_group, fullfilled, blood_camp_blood_camp_id, prescription_prescription_id)
    VALUES (1, 10, 'A+', 'N', 1, 1);
    
    INSERT INTO blood_requirement (requirement_id, quantity_required, blood_group, fullfilled, blood_camp_blood_camp_id, prescription_prescription_id)
    VALUES (2, 10, 'A+', 'N', 2, 2);
    
    INSERT INTO blood_requirement (requirement_id, quantity_required, blood_group, fullfilled, blood_camp_blood_camp_id, prescription_prescription_id)
    VALUES (3, 15, 'B-', 'N', 3, 3);
    
    INSERT INTO blood_requirement (requirement_id, quantity_required, blood_group, fullfilled, blood_camp_blood_camp_id, prescription_prescription_id)
    VALUES (4, 20, 'O-', 'Y', 4, 4);
    
    INSERT INTO blood_requirement (requirement_id, quantity_required, blood_group, fullfilled, blood_camp_blood_camp_id, prescription_prescription_id)
    VALUES (5, 25, 'AB+', 'N', 5, 5);
    
    INSERT INTO blood_requirement (requirement_id, quantity_required, blood_group, fullfilled, blood_camp_blood_camp_id, prescription_prescription_id)
    VALUES (6, 30, 'A-', 'N', 6, 6);
    
    -- Sample data for the 'contact_details' table
    INSERT INTO contact_details (phone_number, email_id, address, person_person_id)
    VALUES (1234567890, 'john.doe@example.com', '456 Elm St', 1);
    
    INSERT INTO contact_details (phone_number, email_id, address, person_person_id)
    VALUES (1234567890, 'alice@example.com', '123 Elm Street', 2);
    
    INSERT INTO contact_details (phone_number, email_id, address, person_person_id)
    VALUES (2345678901, 'michael@example.com', '456 Oak Avenue', 3);
    
    INSERT INTO contact_details (phone_number, email_id, address, person_person_id)
    VALUES (3456789012, 'emily@example.com', '789 Maple Road', 4);
    
    INSERT INTO contact_details (phone_number, email_id, address, person_person_id)
    VALUES (4567890123, 'david@example.com', '101 Pine Lane', 5);
    
    INSERT INTO contact_details (phone_number, email_id, address, person_person_id)
    VALUES (5678901234, 'sophia@example.com', '202 Cedar Court', 6);
    
    -- Sample data for the 'donor' table
    INSERT INTO donor (donor_id, registration_date, person_person_id)
    VALUES (1, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 1);
    
    INSERT INTO donor (donor_id, registration_date, person_person_id)
    VALUES (2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 2);
    
    INSERT INTO donor (donor_id, registration_date, person_person_id)
    VALUES (3, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 3);
    
    INSERT INTO donor (donor_id, registration_date, person_person_id)
    VALUES (4, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 4);
    
    INSERT INTO donor (donor_id, registration_date, person_person_id)
    VALUES (5, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 5);
    
    INSERT INTO donor (donor_id, registration_date, person_person_id)
    VALUES (6, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 6);
    
    -- Sample data for the 'donor_blood_camp_asso' table
    INSERT INTO donor_blood_camp_asso (donor_blood_id, blood_camp_blood_camp_id, donor_donor_id, donated_date, expiry_date, isbloodconsumed)
    VALUES (1, 1, 1, TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2025-03-25', 'YYYY-MM-DD'), 'Y');
    
    INSERT INTO donor_blood_camp_asso (donor_blood_id, blood_camp_blood_camp_id, donor_donor_id, donated_date, expiry_date, isbloodconsumed)
    VALUES (100, 2, 2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-03', 'YYYY-MM-DD'), 'Y');
    
    INSERT INTO donor_blood_camp_asso (donor_blood_id, blood_camp_blood_camp_id, donor_donor_id, donated_date, expiry_date, isbloodconsumed)
    VALUES (200, 3, 3, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-07', 'YYYY-MM-DD'), 'N');
    
    INSERT INTO donor_blood_camp_asso (donor_blood_id, blood_camp_blood_camp_id, donor_donor_id, donated_date, expiry_date, isbloodconsumed)
    VALUES (300, 4, 4, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'), 'Y');
    
    INSERT INTO donor_blood_camp_asso (donor_blood_id, blood_camp_blood_camp_id, donor_donor_id, donated_date, expiry_date, isbloodconsumed)
    VALUES (400, 5, 5, TO_DATE('2024-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-17', 'YYYY-MM-DD'), 'N');
    
    INSERT INTO donor_blood_camp_asso (donor_blood_id, blood_camp_blood_camp_id, donor_donor_id, donated_date, expiry_date, isbloodconsumed)
    VALUES (500, 6, 6, TO_DATE('2024-04-20', 'YYYY-MM-DD'), TO_DATE('2024-04-22', 'YYYY-MM-DD'), 'Y');
    
    -- Sample data for the 'health_report' table
    INSERT INTO health_report (report_id, bp, pulse, weight, height, general_condition, patient_patient_id)
    VALUES (1, 120/80, 70, 70, 175, 'Stable', 1);
    
    INSERT INTO health_report (report_id, bp, pulse, weight, height, general_condition, patient_patient_id)
    VALUES (2, 120, 80, 70, 175, 'Stable', 2);
    
    INSERT INTO health_report (report_id, bp, pulse, weight, height, general_condition, patient_patient_id)
    VALUES (3, 130, 70, 65, 160, 'Normal', 3);
    
    INSERT INTO health_report (report_id, bp, pulse, weight, height, general_condition, patient_patient_id)
    VALUES (4, 125, 75, 80, 180, 'Improving', 4);
    
    INSERT INTO health_report (report_id, bp, pulse, weight, height, general_condition, patient_patient_id)
    VALUES (5, 140, 85, 75, 170, 'Stable', 5);
    
    INSERT INTO health_report (report_id, bp, pulse, weight, height, general_condition, patient_patient_id)
    VALUES (6, 110, 90, 72, 168, 'Normal', 6);
    
    -- Sample data for the 'in_patient' table
    INSERT INTO in_patient (admission_date, discharge_date, room_no, patient_patient_id)
    VALUES (TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-28', 'YYYY-MM-DD'), 101, 1);
    
    INSERT INTO in_patient (admission_date, discharge_date, room_no, patient_patient_id)
    VALUES (TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 101, 2);
    
    INSERT INTO in_patient (admission_date, discharge_date, room_no, patient_patient_id)
    VALUES (TO_DATE('2024-04-06', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), 102, 3);
    
    INSERT INTO in_patient (admission_date, discharge_date, room_no, patient_patient_id)
    VALUES (TO_DATE('2024-04-11', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 103, 4);
    
    INSERT INTO in_patient (admission_date, discharge_date, room_no, patient_patient_id)
    VALUES (TO_DATE('2024-04-16', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 104, 5);
    
    INSERT INTO in_patient (admission_date, discharge_date, room_no, patient_patient_id)
    VALUES (TO_DATE('2024-04-21', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'), 105, 6);
    
    -- Sample data for the 'medicine' table
    INSERT INTO medicine (medicine_id, dosage, quantity, prescription_prescription_id)
    VALUES (1, '10mg', 30, 1);
    
    INSERT INTO medicine (medicine_id, dosage, quantity, prescription_prescription_id)
    VALUES (2, '10 mg', 20, 2);
    
    INSERT INTO medicine (medicine_id, dosage, quantity, prescription_prescription_id)
    VALUES (3, '20 mg', 15, 3);
    
    INSERT INTO medicine (medicine_id, dosage, quantity, prescription_prescription_id)
    VALUES (4, '15 mg', 25, 4);
    
    INSERT INTO medicine (medicine_id, dosage, quantity, prescription_prescription_id)
    VALUES (5, '25 mg', 30, 5);
    
    INSERT INTO medicine (medicine_id, dosage, quantity, prescription_prescription_id)
    VALUES (6, '30 mg', 10, 6);
    
    --pause
    -- Sample data for the 'nurse' table
    INSERT INTO nurse (nurse_id, department_dept_id, person_person_id)
    VALUES (1, 1, 2);
    
    INSERT INTO nurse (nurse_id, department_dept_id, person_person_id)
    VALUES (2, 2, 2);
    
    INSERT INTO nurse (nurse_id, department_dept_id, person_person_id)
    VALUES (3, 3, 3);
    
    INSERT INTO nurse (nurse_id, department_dept_id, person_person_id)
    VALUES (4, 4, 4);
    
    INSERT INTO nurse (nurse_id, department_dept_id, person_person_id)
    VALUES (5, 5, 5);
    
    INSERT INTO nurse (nurse_id, department_dept_id, person_person_id)
    VALUES (6, 6, 6);
    
    -- Sample data for the 'out_patient' table
    INSERT INTO out_patient (visit_date, patient_patient_id, consultation_fee)
    VALUES (TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, 50);
    
    INSERT INTO out_patient (visit_date, patient_patient_id, consultation_fee)
    VALUES (TO_DATE('2024-04-01', 'YYYY-MM-DD'), 2, 50);
    
    INSERT INTO out_patient (visit_date, patient_patient_id, consultation_fee)
    VALUES (TO_DATE('2024-04-05', 'YYYY-MM-DD'), 3, 40);
    
    INSERT INTO out_patient (visit_date, patient_patient_id, consultation_fee)
    VALUES (TO_DATE('2024-04-10', 'YYYY-MM-DD'), 4, 60);
    
    INSERT INTO out_patient (visit_date, patient_patient_id, consultation_fee)
    VALUES (TO_DATE('2024-04-15', 'YYYY-MM-DD'), 5, 70);
    
    INSERT INTO out_patient (visit_date, patient_patient_id, consultation_fee)
    VALUES (TO_DATE('2024-04-20', 'YYYY-MM-DD'), 6, 45);
    
    -- Sample data for the 'shift_nurse' table
    INSERT INTO shift_nurse (shift_id, nurse_nurse_id, start_time, end_time)
    VALUES (1, 1, TO_DATE('2024-03-20 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-20 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    
    INSERT INTO shift_nurse (shift_id, nurse_nurse_id, start_time, end_time)
    VALUES (2, 2, TO_DATE('2024-04-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    
    INSERT INTO shift_nurse (shift_id, nurse_nurse_id, start_time, end_time)
    VALUES (3, 3, TO_DATE('2024-04-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-02 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    
    INSERT INTO shift_nurse (shift_id, nurse_nurse_id, start_time, end_time)
    VALUES (4, 4, TO_DATE('2024-04-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-03 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    
    INSERT INTO shift_nurse (shift_id, nurse_nurse_id, start_time, end_time)
    VALUES (5, 5, TO_DATE('2024-04-04 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    
    INSERT INTO shift_nurse (shift_id, nurse_nurse_id, start_time, end_time)
    VALUES (6, 6, TO_DATE('2024-04-05 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        v_error_code := SQLCODE;
        v_error_msg := SUBSTR(SQLERRM, 1, 4000);
        DBMS_OUTPUT.PUT_LINE('Error Code: ' || v_error_code || ', Error Message: ' || v_error_msg);
        ROLLBACK;
END;
