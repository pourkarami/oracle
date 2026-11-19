SELECT owner, object_type, object_name, subobject_name, status, last_ddl_time
FROM   dba_objects
WHERE  owner = :p_owner
AND    status = 'INVALID'
ORDER BY object_type, object_name, subobject_name;
