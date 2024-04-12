CREATE OR REPLACE PROCEDURE create_sequences AS
BEGIN
	 drop_sequence('appointment_id_seq');
	 drop_sequence('donor_blood_id_seq');
	 drop_sequence('requirement_id_seq');
	 drop_sequence('out_patient_seq');
	 drop_sequence('report_id_seq');
	 drop_sequence('in_patient_seq');
	 drop_sequence('medicine_id_seq');
	 drop_sequence('prescription_id_seq');
	 drop_sequence('patient_id_seq');
	 drop_sequence('donor_id_seq');
	 drop_sequence('shift_id_seq');
	 drop_sequence('nurse_id_seq');
	 drop_sequence('doctor_id_seq');
	 drop_sequence('person_id_seq');
	
	EXECUTE IMMEDIATE 'CREATE SEQUENCE appointment_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence appointment_id_seq created.');
    
    EXECUTE IMMEDIATE 'CREATE SEQUENCE donor_blood_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence donor_blood_id_seq created.');

    -- Create requirement_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE requirement_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence requirement_id_seq created.');

    -- Create out_patient_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE out_patient_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence out_patient_seq created.');

    -- Create report_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE report_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence report_id_seq created.');

    -- Create in_patient_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE in_patient_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence in_patient_seq created.');

    -- Create medicine_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE medicine_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence medicine_id_seq created.');

    -- Create prescription_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE prescription_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence prescription_id_seq created.');

    -- Create patient_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE patient_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence patient_id_seq created.');

    -- Create donor_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE donor_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence donor_id_seq created.');

    -- Create shift_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE shift_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence shift_id_seq created.');

    -- Create nurse_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE nurse_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence nurse_id_seq created.');

    -- Create doctor_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE doctor_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence doctor_id_seq created.');

    -- Create person_id_seq sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE person_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE';
    DBMS_OUTPUT.PUT_LINE('Sequence person_id_seq created.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Sequence data not found');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Sequence data already exists');
    WHEN PROGRAM_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('PL/SQL has an internal problem');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('EXCEPTION REACHED');
END;
/
