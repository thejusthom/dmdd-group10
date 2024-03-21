CREATE OR REPLACE FUNCTION drop_user(p_username VARCHAR) RETURN NUMBER AS
BEGIN
  BEGIN
    EXECUTE IMMEDIATE 'DROP USER ' || p_username || ' CASCADE';
    DBMS_OUTPUT.PUT_LINE('USER ' || p_username || ' dropped.');
    RETURN 1; -- User dropped successfully
  EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('USER ' || p_username || ' DOES NOT EXIST');
        RETURN 0; -- Exception occurred while dropping user
  END;
END drop_user;
/

