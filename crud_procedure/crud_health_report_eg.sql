-- Test inserting a new health report record
BEGIN
    manage_health_report(
        p_bp => 120,
        p_pulse => 80,
        p_weight => 70,
        p_height => 175,
        p_general_condition => 'Normal',
        p_patient_id => 1,
        p_action => 'INSERT'
    );
END;
/

-- Check the inserted record
SELECT * FROM health_report;

-- Test updating an existing health report record
BEGIN
    manage_health_report(
        p_report_id => 1,
        p_bp => 130, -- Update blood pressure
        p_pulse => 75, -- Update pulse
        p_weight => 72, -- Update weight
        p_height => 176, -- Update height
        p_general_condition => 'Stable', -- Update general condition
        p_patient_id => 1, -- Update patient ID
        p_action => 'UPDATE'
    );
END;
/

-- Check the updated record
SELECT * FROM health_report;

-- Test deleting an existing health report record
BEGIN
    manage_health_report(
        p_report_id => 1,
        p_action => 'DELETE'
    );
END;
/

-- Check if the record is deleted
SELECT * FROM health_report;
