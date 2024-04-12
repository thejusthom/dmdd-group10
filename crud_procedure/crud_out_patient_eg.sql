BEGIN
   manage_out_patient(
       'insert',                           -- Operation: insert
       'john@example.com',                -- Email ID
       'John',                             -- First name
       'Doe',                              -- Last name
       TO_DATE('1980-01-01', 'YYYY-MM-DD'),-- Date of Birth
       'O+',                               -- Blood group
       'Male',                             -- Gender
       '123 Main St',                      -- Address
       1234567890,                         -- Phone number
       SYSDATE                             -- Visit date
   );
END;
/

select * from person;
select * from patient;
select * from out_patient;

delete from person;
delete from patient;
delete from out_patient;

BEGIN
   manage_out_patient(
       'update',                           -- Operation: update
       'john@example.com',                -- Email ID
       'Johnny',                           -- Updated first name
       NULL,                               -- Updated last name (no change)
       NULL,                               -- Updated date of birth (no change)
       NULL,                               -- Updated blood group (no change)
       NULL,                               -- Updated gender (no change)
       NULL,                               -- Updated address (no change)
       NULL,                               -- Updated phone number (no change)
       TO_DATE('2024-04-15', 'YYYY-MM-DD') -- Updated visit date
   );
END;
/

BEGIN
   manage_out_patient(
       'delete',                           -- Operation: delete
       'john@example.com'                 -- Email ID
   );
END;
/