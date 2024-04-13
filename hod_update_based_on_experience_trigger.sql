CREATE OR REPLACE TRIGGER UPDATE_HOD_TRIGGER
BEFORE UPDATE OF hod ON department
FOR EACH ROW
DECLARE
    v_tenure_years NUMBER;
    v_department_id department.dept_id%TYPE;
    INSUFFICIENT_EXPERIENCE_ERROR EXCEPTION;
BEGIN
    -- Fetch the tenure of the new HOD
    IF :NEW.hod IS NOT NULL THEN
        SELECT EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM p.created_date) + joining_exp
        INTO v_tenure_years
        FROM doctor d
        inner join person p on p.person_id = d.person_person_id     
        WHERE doctor_id = :NEW.hod;

        -- Update HOD if tenure exceeds 10 years
        IF v_tenure_years > 10 THEN
            v_department_id := :NEW.dept_id; -- Store the department ID
        ELSE
            RAISE INSUFFICIENT_EXPERIENCE_ERROR;
        END IF;
    END IF;
EXCEPTION
    WHEN INSUFFICIENT_EXPERIENCE_ERROR THEN  
     dbms_output.put_line('The newly assigned HOD does not have tenure exceeding 10 years.');
    :new.hod := :old.hod;
    WHEN NO_DATA_FOUND THEN
     dbms_output.put_line('Doctor not found for the newly assigned HOD.');
    :new.hod := :old.hod;
    WHEN OTHERS THEN
     dbms_output.put_line('Error updating HOD for department: ' || SQLERRM);
END;
/