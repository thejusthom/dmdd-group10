SET SERVEROUTPUT ON
-- Inserting a new blood camp record
BEGIN manage_blood_camp(
    p_blood_camp_id => blood_camp_id_seq.NEXTVAL,
    p_address => '123 Main Street',
    p_start_date => TO_DATE('2024-05-01', 'YYYY-MM-DD'),
    p_end_date => TO_DATE('2024-05-03', 'YYYY-MM-DD'),
    p_action => 'INSERT'
);
END; 
/

-- Updating an existing blood camp record
BEGIN manage_blood_camp(
    p_blood_camp_id => 8, -- Assuming this is an existing blood camp ID
    p_address => '456 Oak Avenue',
    p_start_date => NULL, -- This field won't be updated
    p_end_date => TO_DATE('2024-05-05', 'YYYY-MM-DD'),
    p_action => 'UPDATE'
);
END;
/

-- Deleting a blood camp record
BEGIN manage_blood_camp(
    p_blood_camp_id => 8,
    p_action => 'DELETE'
);
END;
