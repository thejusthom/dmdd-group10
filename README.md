### Hospital Management System

This Hospital Management System (HMS) facilitates the management of various aspects within a hospital environment, including appointments, patient records, blood donations, and staff management. Below are the steps to set up and use the system:

#### Setup Steps:

1. **Execute create_app_admin.sql**: This script creates the admin user and assign permissions.

2. **Login as Admin_User**:
   Logging in as the admin user provides administrative privileges for further setup and management.
   
3. **Execute drop_role.sql**: Creates a function that drops any existing roles related to the HMS system.

4. **Execute drop_user.sql**: Creates a function that drops any existing users related to the HMS system.

5. **Execute check_table.sql**: Creates a function that checks if the required tables exist in the database.

6. **Execute drop_table.sql**: Creates a function that drops any existing tables related to the HMS system.

7. **Execute Main_PL_SQL.sql**: This script contains the main PL/SQL code for the HMS system, including procedures.

8. **Execute views.sql**: This script creates views for easier data retrieval and analysis.

9. **Execute User_Creation_Scripts_Project3.sql**: This script creates the necessary roles and users for the HMS system.

10. **Execute sample_data.sql**: This script populates the tables with sample data for testing and demonstration purposes.

#### Available Tables:

1. **appointment**: Stores information about appointments made by patients.
2. **donor_blood_camp_asso**: Manages the association between blood donors and blood donation camps.
3. **blood_requirement**: Tracks blood requirements within the hospital.
4. **blood_camp**: Records details of blood donation camps.
5. **out_patient**: Stores data related to outpatient visits.
6. **health_report**: Manages health reports of patients.
7. **in_patient**: Records information about inpatient admissions.
8. **medicine**: Stores details of prescribed medicines.
9. **prescription**: Manages prescriptions issued to patients.
10. **patient**: Stores patient information.
11. **donor**: Records details of blood donors.
12. **contact_details**: Manages contact details of individuals.
13. **shift_nurse**: Tracks the shifts of nurses.
14. **nurse**: Stores information about nurses.
15. **doctor**: Records details of doctors.
16. **department**: Manages hospital departments.
17. **person**: Stores basic information about individuals.

#### Sample Data Queries:

You can use the following queries to view sample data from each table:

```sql
SELECT * FROM appointment;
SELECT * FROM donor_blood_camp_asso;
SELECT * FROM blood_requirement;
SELECT * FROM blood_camp;
SELECT * FROM out_patient;
SELECT * FROM health_report;
SELECT * FROM in_patient;
SELECT * FROM medicine;
SELECT * FROM prescription;
SELECT * FROM patient;
SELECT * FROM donor;
SELECT * FROM contact_details;
SELECT * FROM shift_nurse;
SELECT * FROM nurse;
SELECT * FROM doctor;
SELECT * FROM department;
SELECT * FROM person;
```

These queries will provide insights into the sample data populated in each table.

### Views

The Hospital Management System (HMS) utilizes various views to simplify data retrieval and analysis. Below are the views created in the system:

#### 1. Doctor Information View
- **Name**: `doctor_information_view`
- **Purpose**: Provides comprehensive information about doctors including their specialization, department, personal details such as name, date of birth, blood group, and gender.
- **Tables Involved**: `doctor`, `department`, `person`
- **Columns**: doctor_id, specialization, dept_name, first_name, last_name, dob, blood_group, gender

#### 2. Patient Information View
- **Name**: `patient_information_view`
- **Purpose**: Presents essential details about patients such as their ID, name, date of birth, blood group, and gender.
- **Tables Involved**: `patient`, `person`
- **Columns**: patient_id, first_name, last_name, date_of_birth, blood_group, gender

#### 3. Appointment Information View
- **Name**: `appointment_information_view`
- **Purpose**: Offers insights into appointments by displaying appointment IDs, dates, types, and the corresponding doctor and patient IDs.
- **Tables Involved**: `appointment`, `doctor`, `patient`
- **Columns**: appointment_id, appointment_date, appointment_type, doctor_id, patient_id

#### 4. Blood Inventory View
- **Name**: `blood_inventory_view`
- **Purpose**: Provides a count of available blood units for each blood group, considering factors such as expiry date and usage status.
- **Tables Involved**: `donor_blood_camp_asso`, `donor`, `person`
- **Columns**: blood_count, blood_group

#### 5. Doctor Appointment View
- **Name**: `doctor_appointment_view`
- **Purpose**: Lists appointments scheduled for the current date, along with details of the patient, doctor, and appointment.
- **Tables Involved**: `appointment`, `doctor`, `patient`, `person`
- **Columns**: appointment_id, appointment_date, appointment_type, patient_id, first_name, last_name, doctor_id

#### 6. Top Blood Donors View
- **Name**: `top_blood_donors_view`
- **Purpose**: Identifies the top blood donors based on the count of donations made, displaying their IDs, names, and donation counts.
- **Tables Involved**: `donor`, `donor_blood_camp_asso`, `person`
- **Columns**: donor_id, first_name, last_name, donation_count

The Hospital Management System is now set up and ready for use.
