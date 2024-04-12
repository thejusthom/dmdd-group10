CREATE OR REPLACE TRIGGER blood_requirement_update AFTER
    INSERT ON blood_requirement
    FOR EACH ROW
DECLARE
    v_available_blood NUMBER;
    v_expiry_date     DATE;
    blood_error EXCEPTION;
    pragma autonomous_transaction;
BEGIN



EXCEPTION
    WHEN blood_error THEN
        dbms_output.put_line('Exception in blood triggers, blood quantity unavailable' || sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
END;