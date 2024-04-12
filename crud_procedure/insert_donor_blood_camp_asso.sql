CREATE OR REPLACE PROCEDURE insert_donor_blood_camp_asso (
    p_donor_blood_id        IN NUMBER,
    p_blood_camp_id         IN NUMBER,
    p_donor_id              IN NUMBER,
    p_donated_date          IN DATE,
    p_expiry_date           IN DATE,
    p_is_blood_consumed     IN CHAR
)
IS
BEGIN
    INSERT INTO donor_blood_camp_asso (
        donor_blood_id,
        blood_camp_blood_camp_id,
        donor_donor_id,
        donated_date,
        expiry_date,
        isbloodconsumed
    ) VALUES (
        p_donor_blood_id,
        p_blood_camp_id,
        p_donor_id,
        p_donated_date,
        p_expiry_date,
        p_is_blood_consumed
    );
    
    COMMIT;
    
    dbms_output.put_line('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('Error inserting data: ' || SQLERRM);
END;
/
