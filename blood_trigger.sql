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

    IF v_available_blood >= :new.quantity_required THEN
        -- Update isbloodconsumed to 'Y' for the specified blood group and other criteria
        dbms_output.put_line(v_available_blood);
        -- Update isbloodconsumed to 'Y' for the specified blood group and other criteria
        MERGE INTO donor_blood_camp_asso dbca
        USING (
            SELECT
                dbca.rowid AS rid,
                d.donor_id,
                p.person_id
            FROM
                     donor_blood_camp_asso dbca
                JOIN donor  d ON dbca.donor_donor_id = d.donor_id
                JOIN person p ON d.person_person_id = p.person_id
            WHERE
                    dbca.isbloodconsumed = 'N'
                AND dbca.donated_date >= sysdate - 42
                AND ROWNUM <= :new.quantity_required
        ) src ON ( dbca.rowid = src.rid )
        WHEN MATCHED THEN UPDATE
        SET dbca.isbloodconsumed = 'Y';
        dbms_output.put_line(v_available_blood);


    ELSE
        RAISE blood_error;
    END IF;

EXCEPTION
    WHEN blood_error THEN
        dbms_output.put_line('Exception in blood triggers, blood quantity unavailable' || sqlerrm);
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
END;