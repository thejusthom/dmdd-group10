CREATE OR REPLACE PROCEDURE drop_sequence(sequence_name IN VARCHAR2) AS
    sequence_exists NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO sequence_exists
    FROM user_sequences
    WHERE sequence_name = UPPER(sequence_name);
        
    IF sequence_exists > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || sequence_name;
        DBMS_OUTPUT.PUT_LINE('Sequence ' || sequence_name || ' dropped');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Sequence ' || sequence_name || ' does not exist!');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Exception occurred in check_sequence');
END;
