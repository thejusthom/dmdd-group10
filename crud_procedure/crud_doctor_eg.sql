INSERT INTO department (dept_id, dept_name, hod)
VALUES (2, 'Neurology Department', 'Dr. Smith');

EXECUTE manage_doctor('insert', NULL, 'John', 'Doe', TO_DATE('1985-05-20', 'YYYY-MM-DD'), 'O+', 'Male', SYSDATE, 'john@example.com', 1234567890, '123 Main St', 'Neurologist', 2, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Y');

EXECUTE manage_doctor('update', NULL, 'Jane', 'Smith', NULL, NULL, NULL, NULL, 'john@example.com');

EXECUTE manage_doctor('delete', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'john@example.com');


select * from doctor;
select * from person;
delete from department;
delete from doctor;
delete from person;

SELECT person_person_id FROM doctor WHERE doctor_id = 4;