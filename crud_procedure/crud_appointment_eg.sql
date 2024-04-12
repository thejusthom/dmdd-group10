-- Test inserting a new appointment record

-- create patient, doctor, appointment slot

BEGIN
    manage_appointment('INSERT', 1, TO_DATE('2024-04-12', 'YYYY-MM-DD'), 'Scheduled', 1, 1, 'Consultation', 'Fever', 1);
END;
/

select * from appointment; /

-- Test updating an existing appointment record
BEGIN
    manage_appointment_slot('UPDATE', 1, TO_DATE('2024-04-13 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
END;
/

-- Test deleting an existing appointment record

-- make sure appointment_slot is not used

BEGIN
    manage_appointment_slot('DELETE', 1, NULL);
END;
/

