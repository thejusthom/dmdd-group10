CREATE OR REPLACE TRIGGER blood_requirement_update AFTER
    INSERT ON blood_requirement
    FOR EACH ROW
DECLARE
    v_available_blood NUMBER;
    v_expiry_date     DATE;
    blood_error EXCEPTION;
    pragma autonomous_transaction;
BEGIN

    -- Check available blood for the specified blood group and not consumed
    SELECT
        COUNT(donor_donor_id)
    INTO v_available_blood
    FROM
             donor_blood_camp_asso dbca
        JOIN donor  d ON dbca.donor_donor_id = d.donor_id
        JOIN person p ON d.person_person_id = p.person_id
    WHERE
            p.blood_group = :new.blood_group
        AND dbca.donated_date >= sysdate - 42
        AND dbca.isbloodconsumed = 'N';

EXCEPTION
    WHEN blood_error THEN
        dbms_output.put_line('Exception in blood triggers, blood quantity unavailable' || sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
END;