CREATE OR REPLACE FUNCTION drop_table(
tab_name VARCHAR
)RETURN NUMBER AS
v_returns NUMBER;
v_table_exists NUMBER;
v_constraint_exists NUMBER;
BEGIN
    v_table_exists := check_table_exists(tab_name);
    SELECT COUNT(*) INTO v_constraint_exists FROM USER_CONSTRAINTS WHERE TABLE_NAME = tab_name;
    DBMS_OUTPUT.PUT_LINE('Table name is: ' || tab_name);
    DBMS_OUTPUT.PUT_LINE(v_table_exists);
    IF v_table_exists = 1 THEN
        IF (v_constraint_exists != 0) THEN
            FOR c IN (SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME = tab_name) LOOP
                EXECUTE IMMEDIATE 'ALTER TABLE ' || tab_name || ' DROP CONSTRAINT ' || c.CONSTRAINT_NAME;
                DBMS_OUTPUT.PUT_LINE('Constraint ' || c.CONSTRAINT_NAME || ' dropped.');
            END LOOP;
        END IF;
    EXECUTE IMMEDIATE 'DROP TABLE ' || tab_name;
    END IF;
    RETURN 1;
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('EXCEPTION REACHED');
        RETURN 0;
END drop_table;
