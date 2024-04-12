-- Test inserting a new appointment_slot record
BEGIN
    manage_appointment_slot('INSERT', 1, TO_DATE('2024-04-12 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
END;
/

select * from appointment_slot; /

-- Test updating an existing appointment_slot record
BEGIN
    manage_appointment('UPDATE', 1, NULL, 'Cancelled', NULL, NULL, NULL, NULL, NULL);
END;
/

-- Test deleting an existing appointment_slot record
BEGIN
    manage_appointment('DELETE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
END;
/

