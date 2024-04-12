CREATE OR REPLACE PROCEDURE manage_appointment_slot (
    p_operation   IN VARCHAR2, -- 'INSERT', 'UPDATE', or 'DELETE'
    p_slot_id     IN appointment_slot.slot_id%TYPE,
    p_start_time  IN appointment_slot.start_time%TYPE
)
IS
BEGIN
    IF p_operation = 'INSERT' THEN
        INSERT INTO appointment_slot (slot_id, start_time)
        VALUES (p_slot_id, p_start_time);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Appointment Slot inserted successfully.');
        
    ELSIF p_operation = 'UPDATE' THEN
        UPDATE appointment_slot
        SET start_time = p_start_time
        WHERE slot_id = p_slot_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Appointment Slot updated successfully.');
        
    ELSIF p_operation = 'DELETE' THEN
        DELETE FROM appointment_slot
        WHERE slot_id = p_slot_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Appointment Slot deleted successfully.');
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('Invalid operation. Please specify INSERT, UPDATE, or DELETE.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END manage_appointment_slot;
/