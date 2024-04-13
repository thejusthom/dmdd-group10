--RUN ALL CRUD OPERATIONS IN ORDER BEFORE THIS
--TO BE RUN BY ADMIN
SET SERVEROUTPUT ON;
BEGIN
 --- Adding 5 dept records
    manage_department('INSERT', NULL, 'Cardiology', 1);
    manage_department('INSERT', NULL, 'Neurology', 2);
    manage_department('INSERT', NULL, 'Oncology', 3);
    manage_department('INSERT', NULL, 'Orthopedics', 4);
    manage_department('INSERT', NULL, 'Pediatrics', 5);
    DBMS_OUTPUT.PUT_LINE('Inserted department');

    -- Adding 5 doctor records
    manage_doctor('insert', NULL, 'Michael', 'Smith', TO_DATE('1980-05-15', 'YYYY-MM-DD'), 'AB+', 'Male', SYSDATE, 'michael@example.com', 1234567890, '456 Oak St', 'Cardiologist', 1, 4, 'Y');
    manage_doctor('insert', NULL, 'Jennifer', 'Brown', TO_DATE('1975-08-20', 'YYYY-MM-DD'), 'A-', 'Female', SYSDATE, 'jennifer@example.com', 1234567891, '789 Elm St', 'Neurologist', 2, 5, 'Y');
    manage_doctor('insert', NULL, 'Christopher', 'Lee', TO_DATE('1982-03-10', 'YYYY-MM-DD'), 'O+', 'Male', SYSDATE, 'christopher@example.com', 1234567892, '101 Pine St', 'Orthopedic Surgeon', 4, 6, 'Y');
    manage_doctor('insert', NULL, 'Sarah', 'Clark', TO_DATE('1978-11-25', 'YYYY-MM-DD'), 'B+', 'Female', SYSDATE, 'sarah@example.com', 1234567893, '222 Maple St', 'Pediatrician', 5, 11, 'Y');
    manage_doctor('insert', NULL, 'Daniel', 'Taylor', TO_DATE('1985-07-30', 'YYYY-MM-DD'), 'AB-', 'Male', SYSDATE, 'daniel@example.com', 1234567894, '333 Cedar St', 'Oncologist', 3, 12, 'Y');
    DBMS_OUTPUT.PUT_LINE('Inserted doctor');

     -- Adding 5 nurse records
    manage_nurse('insert', 'nurse1@example.com', 'Emily', 'Johnson', TO_DATE('1990-08-15', 'YYYY-MM-DD'), 'O+', 'Female', SYSDATE, 1234567890, '456 Oak St', 2, 'Y');
    manage_nurse('insert', 'nurse2@example.com', 'Sarah', 'Smith', TO_DATE('1985-04-20', 'YYYY-MM-DD'), 'A-', 'Female', SYSDATE, 9876543210, '789 Elm St', 3, 'Y');
    manage_nurse('insert', 'nurse3@example.com', 'Michael', 'Brown', TO_DATE('1988-11-10', 'YYYY-MM-DD'), 'B+', 'Male', SYSDATE, 5551234567, '101 Pine St', 4, 'Y');
    manage_nurse('insert', 'nurse4@example.com', 'Jessica', 'Wilson', TO_DATE('1992-02-05', 'YYYY-MM-DD'), 'AB-', 'Female', SYSDATE, 1112223333, '321 Cedar St', 5, 'Y');
    manage_nurse('insert', 'nurse5@example.com', 'David', 'Lee', TO_DATE('1983-06-30', 'YYYY-MM-DD'), 'O-', 'Male', SYSDATE, 9998887777, '654 Maple St', 1, 'Y');

    DBMS_OUTPUT.PUT_LINE('Inserted nurse');
    
     -- Inserting records for in-patient
    manage_in_patient('insert', 'p1@example.com', 'John', 'Doe', TO_DATE('1980-01-01', 'YYYY-MM-DD'), 'O+', 'Male', '123 Main St', 1234567890, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 101);
    manage_in_patient('insert', 'p2@example.com', 'Emma', 'Smith', TO_DATE('1975-05-20', 'YYYY-MM-DD'), 'A-', 'Female', '456 Elm St', 9876543210, TO_DATE('2024-04-12', 'YYYY-MM-DD'), TO_DATE('2024-04-18', 'YYYY-MM-DD'), 102);
    manage_in_patient('insert', 'p3@example.com', 'Sam', 'Johnson', TO_DATE('1990-08-10', 'YYYY-MM-DD'), 'B+', 'Male', '789 Oak St', 5551234567, TO_DATE('2024-04-14', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 103);
    manage_in_patient('insert', 'p4@example.com', 'Lisa', 'Wilson', TO_DATE('1988-02-15', 'YYYY-MM-DD'), 'AB-', 'Female', '101 Pine St', 1112223333, TO_DATE('2024-04-18', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'), 104);
    manage_in_patient('insert', 'p5@example.com', 'Mike', 'Brown', TO_DATE('1985-11-30', 'YYYY-MM-DD'), 'O-', 'Male', '321 Cedar St', 9998887777, TO_DATE('2024-04-22', 'YYYY-MM-DD'), TO_DATE('2024-04-28', 'YYYY-MM-DD'), 105);
    DBMS_OUTPUT.PUT_LINE('Inserted in-patient');
    
    -- Inserting records for out-patient
    manage_out_patient('insert', 'p6@example.com', 'Jane', 'Doe', TO_DATE('1976-04-05', 'YYYY-MM-DD'), 'AB+', 'Female', '234 Maple St', 3334445555, TO_DATE('2024-04-10', 'YYYY-MM-DD'));
    manage_out_patient('insert', 'p7@example.com', 'Ryan', 'Smith', TO_DATE('1983-09-15', 'YYYY-MM-DD'), 'B-', 'Male', '567 Elm St', 7778889999, TO_DATE('2024-04-12', 'YYYY-MM-DD'));
    manage_out_patient('insert', 'p8@example.com', 'Sara', 'Johnson', TO_DATE('1992-07-20', 'YYYY-MM-DD'), 'A+', 'Female', '890 Oak St', 4445556666, TO_DATE('2024-04-14', 'YYYY-MM-DD'));
    manage_out_patient('insert', 'p9@example.com', 'Alex', 'Wilson', TO_DATE('1980-11-10', 'YYYY-MM-DD'), 'O-', 'Male', '678 Pine St', 2223334444, TO_DATE('2024-04-18', 'YYYY-MM-DD'));
    manage_out_patient('insert', 'p10@example.com', 'Emily', 'Brown', TO_DATE('1989-01-25', 'YYYY-MM-DD'), 'AB+', 'Female', '987 Cedar St', 6667778888, TO_DATE('2024-04-22', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Inserted out-patient');

     -- Inserting records for appointment slot
    manage_appointment_slot('INSERT', 1, TO_DATE('2024-04-12 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    manage_appointment_slot('INSERT', 2, TO_DATE('2024-04-13 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    manage_appointment_slot('INSERT', 3, TO_DATE('2024-04-14 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    manage_appointment_slot('INSERT', 4, TO_DATE('2024-04-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    manage_appointment_slot('INSERT', 5, TO_DATE('2024-04-16 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
    
    
    -- Inserting records for donor
    manage_donor('john@example.com', 'John', 'Doe', TO_DATE('1980-01-01', 'YYYY-MM-DD'), 'O+', 'Male', 1234567890, '123 Main St', 'INSERT');
    manage_donor('jane@example.com', 'Emma', 'Smith', TO_DATE('1975-05-20', 'YYYY-MM-DD'), 'A-', 'Female', 9876543210, '456 Elm St', 'INSERT');
    manage_donor('sara@example.com', 'Sam', 'Johnson', TO_DATE('1990-08-10', 'YYYY-MM-DD'), 'B+', 'Male', 5551234567, '789 Oak St', 'INSERT');
    manage_donor('emily@example.com', 'Lisa', 'Wilson', TO_DATE('1988-02-15', 'YYYY-MM-DD'), 'AB-', 'Female', 1112223333, '101 Pine St', 'INSERT');
    manage_donor('alex@example.com', 'Mike', 'Brown', TO_DATE('1985-11-30', 'YYYY-MM-DD'), 'O-', 'Male', 9998887777, '321 Cedar St', 'INSERT');
    
      -- Inserting records for blood camp
    manage_blood_camp(1, '123 Main Street', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), 'INSERT');
    manage_blood_camp(2, '456 Elm Street', TO_DATE('2024-05-05', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'), 'INSERT');
    manage_blood_camp(3, '789 Oak Street', TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-12', 'YYYY-MM-DD'), 'INSERT');
    manage_blood_camp(4, '101 Pine Street', TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-17', 'YYYY-MM-DD'), 'INSERT');
    manage_blood_camp(5, '202 Maple Street', TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 'INSERT');
    
    -- Inserting records for donor blood camp association
   manage_donor_blood_camp_asso(NULL, 1, 'john@example.com', 'INSERT');
   manage_donor_blood_camp_asso(NULL, 2, 'jane@example.com', 'INSERT');
   manage_donor_blood_camp_asso(NULL, 3, 'sara@example.com', 'INSERT');
   manage_donor_blood_camp_asso(NULL, 4, 'emily@example.com', 'INSERT');
   manage_donor_blood_camp_asso(NULL, 5, 'alex@example.com', 'INSERT');
    

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;    