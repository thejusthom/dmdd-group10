-- Test inserting a new department record
BEGIN
    manage_department('INSERT', NULL, 'Cardiology', 1);
END;
/

select * from department; /

-- Test updating an existing department record
BEGIN
    manage_department('UPDATE', 1, 'General Medicine', NULL);
END;
/

-- Test deleting an existing department record
BEGIN
    manage_department('DELETE', 1, NULL, NULL);
END;
/
