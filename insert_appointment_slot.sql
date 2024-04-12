CREATE OR REPLACE PROCEDURE insert_appointment_slot (
    p_slot_id    IN appointment_slot.slot_id%TYPE,
    p_start_time IN appointment_slot.start_time%TYPE
)
IS
BEGIN
    INSERT INTO appointment_slot (slot_id, start_time)
    VALUES (p_slot_id, p_start_time);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Appointment Slot values inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting values into appointment slot: ' || SQLERRM);
END insert_appointment_slot;
/