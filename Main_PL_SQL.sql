SET SERVEROUTPUT ON

DECLARE
    v_table_exists      NUMBER;
    v_constraint_exists NUMBER;
BEGIN
    v_table_exists := drop_table('appointment');
    v_table_exists := drop_table('appointment_slot');
    v_table_exists := drop_table('donor_blood_camp_asso');
    v_table_exists := drop_table('blood_requirement');
    v_table_exists := drop_table('blood_camp');
    v_table_exists := drop_table('out_patient');
    v_table_exists := drop_table('health_report');
    v_table_exists := drop_table('in_patient');
    v_table_exists := drop_table('medicine');
    v_table_exists := drop_table('prescription');
    v_table_exists := drop_table('patient');
    v_table_exists := drop_table('donor');
    v_table_exists := drop_table('contact_details');
    v_table_exists := drop_table('shift_nurse');
    v_table_exists := drop_table('nurse');
    v_table_exists := drop_table('doctor');
    v_table_exists := drop_table('department');
    v_table_exists := drop_table('person');
    EXECUTE IMMEDIATE 'CREATE TABLE appointment_slot (
    slot_id    NUMBER NOT NULL,
    start_time DATE NOT NULL,
    CONSTRAINT appointment_slot_pk PRIMARY KEY (slot_id))';
    dbms_output.put_line('Table appointment_slot created.');
    EXECUTE IMMEDIATE 'CREATE TABLE appointment (
        appointment_id        NUMBER NOT NULL,
        appointment_date DATE,
        status                VARCHAR2(50),
        patient_patient_id    NUMBER NOT NULL,
        doctor_doctor_id      NUMBER NOT NULL,
        appointment_type      VARCHAR2(50),
        diagnosis             VARCHAR2(50),
        appointment_slot_slot_id NUMBER NOT NULL,
        CONSTRAINT appointment_pk PRIMARY KEY (appointment_id))';
    dbms_output.put_line('Table appointment created.');
    EXECUTE IMMEDIATE 'CREATE TABLE donor_blood_camp_asso (
    donor_blood_id              NUMBER NOT NULL,
    blood_camp_blood_camp_id NUMBER NOT NULL,
    donor_donor_id           NUMBER NOT NULL,
    donated_date             DATE,
    isbloodconsumed          CHAR(1),
    CONSTRAINT donor_blood_camp_asso_pk PRIMARY KEY (donor_blood_id))';
    dbms_output.put_line('Table donor_blood_camp_asso created.');
    EXECUTE IMMEDIATE 'CREATE TABLE blood_requirement (
    requirement_id               NUMBER NOT NULL,
    quantity_required            NUMBER,
    blood_group                  VARCHAR2(5),
    fullfilled                   CHAR(1),
    blood_camp_blood_camp_id     NUMBER NOT NULL,
    prescription_prescription_id NUMBER NOT NULL,
    CONSTRAINT blood_requirement_pk PRIMARY KEY (requirement_id, blood_camp_blood_camp_id))';
    dbms_output.put_line('Table blood_requirement created.');
    EXECUTE IMMEDIATE 'CREATE TABLE blood_camp (
    blood_camp_id NUMBER NOT NULL,
    address       VARCHAR2(100),
    start_date    DATE,
    end_date      DATE,
    CONSTRAINT blood_camp_pk PRIMARY KEY ( blood_camp_id ))';
    dbms_output.put_line('Table blood_camp created.');
    EXECUTE IMMEDIATE 'CREATE TABLE out_patient (
    visit_date         DATE,
    patient_patient_id NUMBER NOT NULL,
    consultation_fee   NUMBER,
    CONSTRAINT out_patient_pk PRIMARY KEY ( patient_patient_id ))';
    dbms_output.put_line('Table out_patient created.');
    EXECUTE IMMEDIATE 'CREATE TABLE health_report (
    report_id          NUMBER NOT NULL,
    bp                 NUMBER,
    pulse              NUMBER,
    weight             NUMBER,
    height             NUMBER,
    general_condition  VARCHAR2(50),
    patient_patient_id NUMBER NOT NULL,
    CONSTRAINT health_report_pk PRIMARY KEY ( report_id ))';
    dbms_output.put_line('Table health_report created.');
    EXECUTE IMMEDIATE 'CREATE TABLE in_patient (
    admission_date     DATE,
    discharge_date     DATE,
    room_no            NUMBER,
    patient_patient_id NUMBER NOT NULL,
    CONSTRAINT in_patient_pk PRIMARY KEY ( patient_patient_id ))';
    dbms_output.put_line('Table in_patient created.');
    EXECUTE IMMEDIATE 'CREATE TABLE medicine (
    medicine_id                  NUMBER NOT NULL,
    dosage                       VARCHAR2(20),
    quantity                     NUMBER,
    "DOSAGE/DAY"                 VARCHAR2(20) NOT NULL,
    prescription_prescription_id NUMBER NOT NULL,
    CONSTRAINT medicine_pk PRIMARY KEY ( medicine_id ))';
    dbms_output.put_line('Table medicine created.');
    EXECUTE IMMEDIATE 'CREATE TABLE prescription (
    prescription_id    NUMBER NOT NULL,
    patient_patient_id NUMBER NOT NULL,
    CONSTRAINT prescription_pk PRIMARY KEY ( prescription_id ))';
    dbms_output.put_line('Table prescription created.');
    EXECUTE IMMEDIATE 'CREATE TABLE patient (
    patient_id       NUMBER NOT NULL,
    person_person_id NUMBER NOT NULL,
    CONSTRAINT patient_pk PRIMARY KEY ( patient_id ))';
    dbms_output.put_line('Table patient created.');
    EXECUTE IMMEDIATE 'CREATE TABLE donor (
    donor_id          NUMBER NOT NULL,
    registration_date DATE,
    person_person_id  NUMBER NOT NULL,
    CONSTRAINT donor_pk PRIMARY KEY ( donor_id ))';
    dbms_output.put_line('Table donor created.');
    EXECUTE IMMEDIATE 'CREATE UNIQUE INDEX contact_details__idx ON contact_details (
    person_person_id ASC)';
    dbms_output.put_line('Unique Index contact_details__idx created.');
    EXECUTE IMMEDIATE 'CREATE TABLE shift_nurse (
    shift_id       NUMBER NOT NULL,
    nurse_nurse_id NUMBER NOT NULL,
    shift_timing_shift_timing_id NUMBER NOT NULL,
    CONSTRAINT shift_nurse_pk PRIMARY KEY ( shift_id ))';
    dbms_output.put_line('Table shift_nurse created.');  
    EXECUTE IMMEDIATE 'CREATE TABLE nurse (
    nurse_id            NUMBER NOT NULL,
    department_dept_id NUMBER NOT NULL,
    person_person_id    NUMBER NOT NULL,
    is_active                 CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT nurse_pk PRIMARY KEY ( nurse_id ))';
    dbms_output.put_line('Table nurse created.');
    EXECUTE IMMEDIATE 'CREATE TABLE doctor (
    doctor_id           NUMBER NOT NULL,
    specialization      VARCHAR2(50),
    person_person_id    NUMBER NOT NULL,
    joining_exp               DATE NOT NULL,
    is_active                 CHAR(1) NOT NULL,
    department_dept_id NUMBER NOT NULL,
    CONSTRAINT doctor_pk PRIMARY KEY ( doctor_id ))';
    dbms_output.put_line('Table doctor created.');
    EXECUTE IMMEDIATE 'CREATE TABLE department (
    dept_id   NUMBER NOT NULL,
    dept_name VARCHAR2(100),
    hod       VARCHAR2(200),
    CONSTRAINT department_pk PRIMARY KEY ( dept_id ))';
    dbms_output.put_line('Table department created.');
    EXECUTE IMMEDIATE 'CREATE TABLE person (
    person_id   NUMBER NOT NULL,
    first_name  VARCHAR2(50),
    last_name   VARCHAR2(50),
    dob         DATE,
    blood_group VARCHAR2(10),
    gender      VARCHAR2(10),
    email_id     VARCHAR2(200) NOT NULL,
    phone_number NUMBER NOT NULL,
    address      VARCHAR2(200) NOT NULL,
    CONSTRAINT person_pk PRIMARY KEY ( person_id ))';
    dbms_output.put_line('Table person created.');
    
    -- Adding Foreign Key Constraints
    EXECUTE IMMEDIATE 'ALTER TABLE appointment
    ADD CONSTRAINT app_app_slot_fk FOREIGN KEY ( appointment_slot_slot_id )
        REFERENCES appointment_slot ( slot_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE appointment
    ADD CONSTRAINT appointment_doctor_fk FOREIGN KEY ( doctor_doctor_id )
        REFERENCES doctor ( doctor_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE appointment
    ADD CONSTRAINT appointment_patient_fk FOREIGN KEY ( patient_patient_id )
        REFERENCES patient ( patient_id )';
    dbms_output.put_line('FK Constraints for appointment.');
    EXECUTE IMMEDIATE 'ALTER TABLE donor_blood_camp_asso
    ADD CONSTRAINT donor_blood_camp_fk FOREIGN KEY ( blood_camp_blood_camp_id )
        REFERENCES blood_camp ( blood_camp_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE donor_blood_camp_asso
    ADD CONSTRAINT donor_blood_camp_asso_donor_fk FOREIGN KEY ( donor_donor_id )
        REFERENCES donor ( donor_id )';
    dbms_output.put_line('FK Constraints for donor_blood_camp_asso.');
    EXECUTE IMMEDIATE 'ALTER TABLE blood_requirement
    ADD CONSTRAINT blood_req_blood_camp_fk FOREIGN KEY ( blood_camp_blood_camp_id )
        REFERENCES blood_camp ( blood_camp_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE blood_requirement
    ADD CONSTRAINT blood_req_prescription_fk FOREIGN KEY ( prescription_prescription_id )
        REFERENCES prescription ( prescription_id )';
    dbms_output.put_line('FK Constraints for blood_requirement.');
    EXECUTE IMMEDIATE 'ALTER TABLE out_patient
    ADD CONSTRAINT out_patient_patient_fk FOREIGN KEY ( patient_patient_id )
        REFERENCES patient ( patient_id )';
    dbms_output.put_line('FK Constraints for out_patient.');
    EXECUTE IMMEDIATE 'ALTER TABLE health_report
    ADD CONSTRAINT health_report_patient_fk FOREIGN KEY ( patient_patient_id )
        REFERENCES patient ( patient_id )';
    dbms_output.put_line('FK Constraints for health_report.');
    EXECUTE IMMEDIATE 'ALTER TABLE in_patient
    ADD CONSTRAINT in_patient_patient_fk FOREIGN KEY ( patient_patient_id )
        REFERENCES patient ( patient_id )';
    dbms_output.put_line('FK Constraints for in_patient.');
    EXECUTE IMMEDIATE 'ALTER TABLE medicine
    ADD CONSTRAINT medicine_prescription_fk FOREIGN KEY ( prescription_prescription_id )
        REFERENCES prescription ( prescription_id )';
    dbms_output.put_line('FK Constraints for medicine.');
    EXECUTE IMMEDIATE 'ALTER TABLE prescription
    ADD CONSTRAINT prescription_patient_fk FOREIGN KEY ( patient_patient_id )
        REFERENCES patient ( patient_id )';
    dbms_output.put_line('FK Constraints for prescription.');
    EXECUTE IMMEDIATE 'ALTER TABLE patient
    ADD CONSTRAINT patient_person_fk FOREIGN KEY ( person_person_id )
        REFERENCES person ( person_id )';
    dbms_output.put_line('FK Constraints for patient.');
    EXECUTE IMMEDIATE 'ALTER TABLE donor
    ADD CONSTRAINT donor_person_fk FOREIGN KEY ( person_person_id )
        REFERENCES person ( person_id )';
    dbms_output.put_line('FK Constraints for donor.');
    EXECUTE IMMEDIATE 'ALTER TABLE contact_details
    ADD CONSTRAINT contact_details_person_fk FOREIGN KEY ( person_person_id )
        REFERENCES person ( person_id )';
    dbms_output.put_line('FK Constraints for contact_details.');
    EXECUTE IMMEDIATE 'ALTER TABLE shift_nurse
    ADD CONSTRAINT shift_nurse_nurse_fk FOREIGN KEY ( nurse_nurse_id )
        REFERENCES nurse ( nurse_id )';
    dbms_output.put_line('FK Constraints for shift_nurse.');
    EXECUTE IMMEDIATE 'ALTER TABLE nurse
    ADD CONSTRAINT nurse_department_fk FOREIGN KEY ( department_dept_id )
        REFERENCES department ( dept_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE nurse
    ADD CONSTRAINT nurse_person_fk FOREIGN KEY ( person_person_id )
        REFERENCES person ( person_id )';
    dbms_output.put_line('FK Constraints for nurse.');   
    EXECUTE IMMEDIATE 'ALTER TABLE doctor
    ADD CONSTRAINT doctor_department_fk FOREIGN KEY ( department_dept_id )
        REFERENCES department ( dept_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE doctor
    ADD CONSTRAINT doctor_person_fk FOREIGN KEY ( person_person_id )
        REFERENCES person ( person_id )';
    dbms_output.put_line('FK Constraints for doctor.');
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Table data not found');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Table data already exists');
    WHEN PROGRAM_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('PL/SQL has an internal problem');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('EXCEPTION REACHED');
END;