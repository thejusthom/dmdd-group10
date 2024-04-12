create or replace FUNCTION check_table_exists (
    tab_name VARCHAR
) RETURN NUMBER AS
    v_exists NUMBER;
    v_tname  VARCHAR(100);
    table_not_found EXCEPTION;
BEGIN
    SELECT
        COUNT(*)
    INTO v_exists
    FROM
        user_tables
    WHERE
        upper(table_name) = upper(tab_name);

    IF v_exists > 0 THEN
        RETURN 1;
    ELSE
        RAISE table_not_found;
    END IF;
EXCEPTION
     WHEN table_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Table does not exist');
        RETURN 0;
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No Rows Returned for SELECT INTO Statement');
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Global Exception');
        RETURN 0;
END check_table_exists;
