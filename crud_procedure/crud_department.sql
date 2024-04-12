CREATE OR REPLACE PROCEDURE manage_department (
    p_operation  IN VARCHAR2, -- 'INSERT', 'UPDATE', or 'DELETE'
    p_dept_id    IN department.dept_id%TYPE,
    p_dept_name  IN department.dept_name%TYPE,
    p_hod        IN department.hod%TYPE
)
IS
BEGIN
    IF p_operation = 'INSERT' THEN
        INSERT INTO department (dept_id, dept_name, hod)
        VALUES (dept_id_seq.nextval, p_dept_name, p_hod);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Department inserted successfully.');
        
    ELSIF p_operation = 'UPDATE' THEN
        UPDATE department
        SET dept_name = COALESCE(p_dept_name, dept_name),
            hod = COALESCE(p_hod, hod)
        WHERE dept_id = p_dept_id;
        COMMIT;
        -- DBMS_OUTPUT.PUT_LINE('Department updated successfully.');
        
    ELSIF p_operation = 'DELETE' THEN
        DELETE FROM department
        WHERE dept_id = p_dept_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Department deleted successfully.');
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid operation. Please specify INSERT, UPDATE, or DELETE.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END manage_department;
/
