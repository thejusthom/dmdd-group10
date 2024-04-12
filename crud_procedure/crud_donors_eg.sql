-- Test inserting a new donor record
BEGIN
    manage_donor(
        p_email_id => 'john@example.com',
        p_first_name => 'John',
        p_last_name => 'Doe',
        p_dob => TO_DATE('1990-01-01', 'YYYY-MM-DD'),
        p_blood_group => 'O+',
        p_gender => 'Male',
        p_phone_number => '1234567890',
        p_address => '123 Main St',
        p_action => 'INSERT'
    );
END;
/

select * from person; /
select * from donor; /

-- Test updating an existing donor record
BEGIN
    manage_donor(
        p_email_id => 'john@example.com',
        p_phone_number => '555555', -- Update phone number
        p_action => 'UPDATE'
    );
END;
/

-- Test deleting an existing donor record
BEGIN
    manage_donor(
        p_email_i
        d => 'john@example.com',
        p_action => 'DELETE'
    );
END;
/
