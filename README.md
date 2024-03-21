### Hospital Management System

This Hospital Management System (HMS) facilitates the management of various aspects within a hospital environment, including appointments, patient records, blood donations, and staff management. Below are the steps to set up and use the system:

#### Setup Steps:

1. **Execute drop_role.sql**: Creates a function that drops any existing roles related to the HMS system.

2. **Execute drop_user.sql**: Creates a function that drops any existing users related to the HMS system.

3. **Execute User_Creation_Scripts_Project3.sql**: This script creates the necessary roles and users for the HMS system.

4. **Login as Admin_User**:
   - **Username**: ADMIN_USER
   - **Password**: passAdmin2024#
   Logging in as the admin user provides administrative privileges for further setup and management.

5. **Execute check_table.sql**: Creates a function that checks if the required tables exist in the database.

6. **Execute drop_table.sql**: Creates a function that drops any existing tables related to the HMS system.

7. **Execute Main_PL_SQL.sql**: This script contains the main PL/SQL code for the HMS system, including procedures.

8. **Execute views.sql**: This script creates views for easier data retrieval and analysis.

9. **Execute sample_data.sql**: This script populates the tables with sample data for testing and demonstration purposes.

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

The Hospital Management System is now set up and ready for use.
