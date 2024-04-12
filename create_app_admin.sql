SET SERVEROUTPUT ON

DECLARE
    v_user_exists NUMBER;
BEGIN
    -- Check if user exists
    SELECT COUNT(*)
    INTO v_user_exists
    FROM
        dba_users
    WHERE
        username = 'APP_ADMIN';
    -- Drop user only if it exists
    IF v_user_exists > 0 THEN
        BEGIN
            EXECUTE IMMEDIATE 'DROP USER APP_ADMIN CASCADE';
            DBMS_OUTPUT.PUT_LINE('User Dropped');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error dropping user: ' || SQLERRM);
        END;
    END IF;
    -- Create users
    BEGIN
        EXECUTE IMMEDIATE 'CREATE USER APP_ADMIN IDENTIFIED BY passAdmin2024#';
        EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO APP_ADMIN WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CREATE VIEW TO APP_ADMIN';
        EXECUTE IMMEDIATE 'ALTER USER APP_ADMIN QUOTA 50M ON DATA';
        EXECUTE IMMEDIATE 'GRANT CREATE USER TO APP_ADMIN';
        EXECUTE IMMEDIATE 'GRANT DROP USER TO APP_ADMIN';
        EXECUTE IMMEDIATE 'GRANT CREATE ROLE TO APP_ADMIN';
        EXECUTE IMMEDIATE 'GRANT DROP ANY ROLE TO APP_ADMIN';
        DBMS_OUTPUT.PUT_LINE('User Created');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error creating user: APP_ADMIN');
    END;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Exception Reached');
END;