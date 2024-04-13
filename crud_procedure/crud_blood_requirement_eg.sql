-- Test inserting a new blood requirement record
BEGIN
    manage_blood_requirement(
        p_requirement_id => 1,
        p_quantity_required => 10,
        p_blood_group => 'O+',
        p_fullfilled => 'N',
        p_blood_camp_blood_camp_id => 1,
        p_prescription_prescription_id => 1,
        p_action => 'INSERT'
    );
END;
/

-- Check the inserted record
SELECT * FROM blood_requirement;

-- Test updating an existing blood requirement record
BEGIN
    manage_blood_requirement(
        p_requirement_id => 1,
        p_quantity_required => 15, -- Update quantity required
        p_blood_group => 'O-', -- Update blood group
        p_fullfilled => 'Y', -- Mark as fulfilled
        p_blood_camp_blood_camp_id => 2, -- Update blood camp ID
        p_prescription_prescription_id => 2, -- Update prescription ID
        p_action => 'UPDATE'
    );
END;
/

-- Check the updated record
SELECT * FROM blood_requirement;

-- Test deleting an existing blood requirement record
BEGIN
    manage_blood_requirement(
        p_requirement_id => 1,
        p_action => 'DELETE'
    );
END;
/

-- Check if the record is deleted
SELECT * FROM blood_requirement;
