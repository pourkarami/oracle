SELECT i.owner AS index_owner, i.index_name, i.index_type, i.uniqueness,
       i.status, i.visibility, i.partitioned,
       c.column_position, c.column_name, c.descend
FROM   dba_indexes i
LEFT JOIN dba_ind_columns c ON c.index_owner = i.owner
                           AND c.index_name = i.index_name
WHERE  i.table_owner = :p_owner
AND    i.table_name = :p_table
ORDER BY i.index_name, c.column_position;
