SET SERVEROUTPUT ON

DECLARE
  -- Function to drop user and return 1 if dropped successfully or 0 if an exception occurs
  v_user_exists NUMBER;
BEGIN
  -- Drop users if they already exist
  v_user_exists := drop_user('APP_ADMIN');
  -- Create users
  EXECUTE IMMEDIATE 'CREATE USER APP_ADMIN IDENTIFIED BY passAdmin2024#';
  EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO APP_ADMIN';
  EXECUTE IMMEDIATE 'GRANT CREATE VIEW TO APP_ADMIN';
  EXECUTE IMMEDIATE 'ALTER USER APP_ADMIN QUOTA 50M ON DATA';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Exception Reached');
END;