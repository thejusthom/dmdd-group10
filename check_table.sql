create or replace FUNCTION check_table_exists (
    tab_name VARCHAR
) RETURN NUMBER AS
    v_exists NUMBER;
    v_tname  VARCHAR(100);
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
        RETURN 0;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END check_table_exists;
