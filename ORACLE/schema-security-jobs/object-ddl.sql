SELECT DBMS_METADATA.GET_DDL(:p_object_type, :p_object, :p_owner) AS object_ddl
FROM   dual;
