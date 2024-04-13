SET SERVEROUTPUT ON;

BEGIN
   create_tables;
   create_views;
   create_sequences;
   create_users;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
