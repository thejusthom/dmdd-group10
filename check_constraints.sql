CREATE OR REPLACE FUNCTION check_constraint_exists (
    cons_name VARCHAR
) RETURN NUMBER AS
    v_exists NUMBER;
    v_cname  VARCHAR(100);
BEGIN
    SELECT
        COUNT(*)
    INTO v_exists
    FROM
        user_constraints
    WHERE
        upper(CONSTRAINT_NAME) = upper(cons_name);

    IF v_exists > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
	
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END check_constraint_exists;

