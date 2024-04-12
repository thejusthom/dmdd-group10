select * from person;
select * from patient;
select * from in_patient;

delete from person;
delete from patient;
delete from in_patient;

-- Execute the procedure to update an in-patient
BEGIN
   manage_in_patient(
       'update',                           -- Operation: update
       'john@example.com',                -- Email ID
       NULL,                               -- First name (set to NULL if not updating)
       'UpdatedLastName',                  -- Last name
       NULL,                               -- Date of Birth (set to NULL if not updating)
       NULL,                               -- Blood group (set to NULL if not updating)
       'Female',                           -- Gender
       NULL,                               -- Address (set to NULL if not updating)
       NULL,                               -- Phone number (set to NULL if not updating)
       TO_DATE('2024-04-10', 'YYYY-MM-DD'),-- Admission date
       TO_DATE('2024-04-18', 'YYYY-MM-DD'),-- Discharge date
       102                                 -- Room number
   );
END;
/


-- Execute the procedure to delete an in-patient
BEGIN
manage_in_patient(
   'delete',                           -- Operation: delete
   'john@example.com'                 -- Email ID
);
END;