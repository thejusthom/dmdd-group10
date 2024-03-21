SET SERVEROUTPUT ON 

DECLARE
    v_table_exists NUMBER;
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
END;