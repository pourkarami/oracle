SELECT c.owner, c.table_name, c.constraint_name, c.constraint_type,
       cc.position, cc.column_name, c.status, c.validated,
       c.r_owner, c.r_constraint_name, c.delete_rule
FROM   dba_constraints c
LEFT JOIN dba_cons_columns cc ON cc.owner = c.owner
                            AND cc.constraint_name = c.constraint_name
WHERE  c.owner = :p_owner
AND    c.table_name = :p_table
ORDER BY c.constraint_type, c.constraint_name, cc.position;
