CREATE OR REPLACE TRIGGER blood_requirement_update BEFORE
    INSERT ON blood_requirement
    FOR EACH ROW
DECLARE
    v_available_blood NUMBER;
    v_expiry_date     DATE;
    blood_error EXCEPTION;
BEGIN
    -- Check available blood for the specified blood group and not consumed
    DBMS_OUTPUT.PUT_LINE('Blood requirement triggered');
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
    DBMS_OUTPUT.PUT_LINE('Number of counts available: ' || v_available_blood);

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
        DBMS_OUTPUT.PUT_LINE('Updated the isbloodConsumed as Y');
        :new.fullfilled := 'Y';     
        DBMS_OUTPUT.PUT_LINE('Updated the fulfilled as Y');

    ELSE
        RAISE blood_error;
    END IF;

EXCEPTION
    WHEN blood_error THEN
        dbms_output.put_line('Exception in blood triggers, blood quantity unavailable');
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
END;