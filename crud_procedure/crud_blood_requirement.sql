CREATE OR REPLACE PROCEDURE manage_blood_requirement (
    p_requirement_id             IN blood_requirement.requirement_id%TYPE DEFAULT NULL,
    p_quantity_required          IN blood_requirement.quantity_required%TYPE DEFAULT NULL,
    p_blood_group                IN blood_requirement.blood_group%TYPE DEFAULT NULL,
    p_fullfilled                 IN blood_requirement.fullfilled%TYPE DEFAULT NULL,
    p_blood_camp_blood_camp_id   IN blood_requirement.blood_camp_blood_camp_id%TYPE DEFAULT NULL,
    p_prescription_prescription_id IN blood_requirement.prescription_prescription_id%TYPE DEFAULT NULL,
    p_action                     IN VARCHAR2
)
IS
    v_row_count NUMBER;
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO blood_requirement (
            requirement_id,
            quantity_required,
            blood_group,
            fullfilled,
            blood_camp_blood_camp_id,
            prescription_prescription_id
        ) VALUES (
            requirement_id_seq.NEXTVAL,
            p_quantity_required,
            p_blood_group,
            p_fullfilled,
            p_blood_camp_blood_camp_id,
            p_prescription_prescription_id
        );
        
        COMMIT;
        dbms_output.put_line('Data inserted successfully.');
        
    ELSIF p_action = 'UPDATE' THEN
        SELECT COUNT(*)
        INTO v_row_count
        FROM blood_requirement
        WHERE requirement_id = p_requirement_id;

        IF v_row_count = 0 THEN
            dbms_output.put_line('No record found to update.');
            RETURN;
        END IF;

        UPDATE blood_requirement
        SET
            quantity_required = NVL(p_quantity_required, quantity_required),
            blood_group = NVL(p_blood_group, blood_group),
            fullfilled = NVL(p_fullfilled, fullfilled),
            blood_camp_blood_camp_id = NVL(p_blood_camp_blood_camp_id, blood_camp_blood_camp_id),
            prescription_prescription_id = NVL(p_prescription_prescription_id, prescription_prescription_id)
        WHERE
            requirement_id = p_requirement_id;
        
        COMMIT;
        dbms_output.put_line('Data updated successfully.');
        
    ELSIF p_action = 'DELETE' THEN
        SELECT COUNT(*)
        INTO v_row_count
        FROM blood_requirement
        WHERE requirement_id = p_requirement_id;

        IF v_row_count = 0 THEN
            dbms_output.put_line('No record found to delete.');
            RETURN;
        END IF;

        DELETE FROM blood_requirement
        WHERE requirement_id = p_requirement_id;
        
        COMMIT;
        dbms_output.put_line('Data deleted successfully.');
        
    ELSE
        dbms_output.put_line('Invalid action specified.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('Error: ' || SQLERRM);
END manage_blood_requirement;
/
