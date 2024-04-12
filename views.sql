SET SERVEROUTPUT ON 

BEGIN
    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW doctor_information_view AS
        SELECT d.doctor_id, d.specialization, dept.dept_name, p.first_name, p.last_name, p.dob, p.blood_group, p.gender
        FROM doctor d
        JOIN department dept ON d.department_dept_id = dept.dept_id
        JOIN person p ON d.person_person_id = p.person_id';

    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW patient_information_view AS
        SELECT patient.patient_id, person.first_name, person.last_name,
        person.dob AS date_of_birth, person.blood_group, person.gender
        FROM patient
        JOIN person ON patient.person_person_id = person.person_id';

    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW appointment_information_view AS
        SELECT appointment.appointment_id, appointment.appointment_date,
        appointment.appointment_type, doctor.doctor_id, patient.patient_id
        FROM appointment
        JOIN doctor ON appointment.doctor_doctor_id = doctor.doctor_id
        JOIN patient ON appointment.patient_patient_id = patient.patient_id';

    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW blood_inventory_view AS
        SELECT COUNT(*) AS blood_count, person.blood_group
        FROM donor_blood_camp_asso asso
        JOIN donor ON asso.donor_donor_id = donor.donor_id
        JOIN person ON donor.person_person_id = person.person_id
        WHERE asso.expiry_date > SYSDATE
        AND asso.isbloodconsumed = ''N''
        GROUP BY person.blood_group';

    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW doctor_appointment_view AS
        SELECT appointment.appointment_id, appointment.appointment_date,
        appointment.appointment_type, patient.patient_id, person.first_name, person.last_name,
        doctor.doctor_id 
        FROM appointment
        JOIN doctor ON appointment.doctor_doctor_id = doctor.doctor_id
        JOIN patient ON appointment.patient_patient_id = patient.patient_id
        JOIN person ON patient.person_person_id = person.person_id
        WHERE trunc(appointment.appointment_date) = TRUNC(SYSDATE)';

    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW top_blood_donors_view AS
        SELECT donor.donor_id, person.first_name, person.last_name,
        COUNT(*) AS donation_count
        FROM donor
        JOIN person ON donor.person_person_id = person.person_id
        JOIN donor_blood_camp_asso ON donor.donor_id = donor_blood_camp_asso.donor_donor_id
        GROUP BY donor.donor_id, person.first_name, person.last_name
        ORDER BY donation_count DESC';
EXCEPTION
     WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No Rows Returned for SELECT INTO Statement');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('EXCEPTION REACHED');
END;
