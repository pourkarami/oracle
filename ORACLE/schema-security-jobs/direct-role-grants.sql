SELECT grantee, granted_role, admin_option, default_role, common, inherited
FROM   dba_role_privs
WHERE  granted_role = :p_role
ORDER BY grantee;
