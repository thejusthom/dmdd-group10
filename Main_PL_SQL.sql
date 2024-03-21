SET SERVEROUTPUT ON

DECLARE
    v_table_exists      NUMBER;
    v_constraint_exists NUMBER;
BEGIN
    v_table_exists := drop_table('appointment');
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
    EXECUTE IMMEDIATE 'CREATE TABLE appointment (
        appointment_id        NUMBER NOT NULL,
        appointment_date_time DATE,
        status                VARCHAR2(50),
        patient_patient_id    NUMBER NOT NULL,
        doctor_doctor_id      NUMBER NOT NULL,
        appointment_type      VARCHAR2(50),
        diagnosis             VARCHAR2(50),
        CONSTRAINT appointment_pk PRIMARY KEY (appointment_id))';
    dbms_output.put_line('Table appointment created.');
    EXECUTE IMMEDIATE 'CREATE TABLE donor_blood_camp_asso (
    donor_blood              NUMBER NOT NULL,
    blood_camp_blood_camp_id NUMBER NOT NULL,
    donor_donor_id           NUMBER NOT NULL,
    donated_date             DATE,
    expiry_date              DATE,
    isbloodconsumed          CHAR(1),
    CONSTRAINT donor_blood_camp_asso_pk PRIMARY KEY (donor_donor_id, donor_blood))';
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
END;