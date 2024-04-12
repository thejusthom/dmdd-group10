CREATE OR REPLACE PROCEDURE insert_department (
    p_dept_id   IN department.dept_id%TYPE,
    p_dept_name IN department.dept_name%TYPE,
    p_hod       IN department.hod%TYPE
)
IS
BEGIN
    INSERT INTO department (dept_id, dept_name, hod)
    VALUES (p_dept_id, p_dept_name, p_hod);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Values inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END insert_department;
/