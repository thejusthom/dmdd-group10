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
END;