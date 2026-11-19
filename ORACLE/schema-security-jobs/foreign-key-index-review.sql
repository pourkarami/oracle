WITH fk_columns AS (
    SELECT c.owner, c.table_name, c.constraint_name, cc.column_name,
           COUNT(*) OVER (PARTITION BY c.owner, c.constraint_name) AS column_count
    FROM   dba_constraints c
    JOIN   dba_cons_columns cc ON cc.owner = c.owner
                              AND cc.constraint_name = c.constraint_name
    WHERE  c.owner = :p_owner
    AND    c.constraint_type = 'R'
    AND    c.status = 'ENABLED'
),
matching_indexes AS (
    SELECT f.owner, f.constraint_name
    FROM   fk_columns f
    JOIN   dba_indexes i ON i.table_owner = f.owner
                         AND i.table_name = f.table_name
    JOIN   dba_ind_columns ic ON ic.index_owner = i.owner
                             AND ic.index_name = i.index_name
                             AND ic.column_name = f.column_name
                             AND ic.column_position <= f.column_count
    WHERE  i.index_type IN ('NORMAL', 'NORMAL/REV')
    AND    i.visibility = 'VISIBLE'
    AND    i.status IN ('VALID', 'N/A')
    GROUP BY f.owner, f.constraint_name, i.owner, i.index_name
    HAVING COUNT(DISTINCT f.column_name) = MAX(f.column_count)
)
SELECT DISTINCT f.owner, f.table_name, f.constraint_name, f.column_count
FROM   fk_columns f
WHERE  NOT EXISTS (
    SELECT 1
    FROM   matching_indexes mi
    WHERE  mi.owner = f.owner
    AND    mi.constraint_name = f.constraint_name
)
ORDER BY f.table_name, f.constraint_name;
