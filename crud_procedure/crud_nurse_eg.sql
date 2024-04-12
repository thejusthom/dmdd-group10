INSERT INTO department (dept_id, dept_name, hod)
VALUES (2, 'Neurology Department', 'Dr. Smith');


delete from department;
select * from person;
select * from nurse;
-- Inserting a nurse
EXECUTE manage_nurse('insert', 'nurse1@example.com', 'Emily', 'Johnson', TO_DATE('1990-08-15', 'YYYY-MM-DD'), 'O+', 'Female', SYSDATE, 1234567890, '456 Oak St', 2, TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'Y');

-- Updating a nurse
EXECUTE manage_nurse('update', 'nurse1@example.com', 'Emily', 'Smith', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Deleting a nurse
EXECUTE manage_nurse('delete', 'nurse1@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);