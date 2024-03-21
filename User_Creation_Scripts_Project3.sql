-- Create roles
CREATE ROLE doctor_role;
CREATE ROLE nurse_role;
CREATE ROLE patient_role;
CREATE ROLE donor_role;
CREATE ROLE admin_role;

-- Create users
CREATE USER doctor_user IDENTIFIED BY passDoctor2024#;
CREATE USER nurse_user IDENTIFIED BY passNurse2024#;
CREATE USER patient_user IDENTIFIED BY passPatient2024#;
CREATE USER donor_user IDENTIFIED BY passDonor2024#;
CREATE USER admin_user IDENTIFIED BY passAdmin2024#;

-- Grant table permissions
-- Doctor permissions
GRANT SELECT ON health_report TO doctor_role;
GRANT SELECT ON appointment TO doctor_role;
GRANT SELECT ON donor_blood_camp_asso TO doctor_role;

-- Nurse permissions
GRANT SELECT, UPDATE (weight, bp, pulse) ON health_report TO nurse_role;
GRANT SELECT ON appointment TO nurse_role;

-- Patient permissions
GRANT SELECT ON health_report TO patient_role;
GRANT SELECT ON patient TO patient_role;

-- Donor permissions
GRANT SELECT ON donor_blood_camp_asso TO donor_role;

-- Admin permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON appointment TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON blood_camp TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON blood_requirement TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON contact_details TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON deptartment TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON doctor TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON donor TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON donor_blood_camp_asso TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON health_report TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON in_patient TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON medicine TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON nurse TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON out_patient TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON patient TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON person TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON prescription TO admin_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_nurse TO admin_role;

-- Assign permissions to roles
GRANT doctor_role TO doctor_user;
GRANT nurse_role TO nurse_user;
GRANT patient_role TO patient_user;
GRANT donor_role TO donor_user;
GRANT admin_role TO admin_user;
