CREATE OR REPLACE FUNCTION drop_role(p_role_name VARCHAR) RETURN NUMBER AS
BEGIN
  BEGIN
    EXECUTE IMMEDIATE 'DROP ROLE ' || p_role_name;
    DBMS_OUTPUT.PUT_LINE('ROLE ' || p_role_name || ' dropped.');
    RETURN 1; -- Role dropped successfully
  EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ROLE ' || p_role_name || ' DOES NOT EXIST');   
        RETURN 0; -- Exception occurred while dropping role
  END;
END drop_role;
/