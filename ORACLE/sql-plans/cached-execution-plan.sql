SELECT plan_table_output
FROM   TABLE(DBMS_XPLAN.DISPLAY_CURSOR(:p_sql_id, :p_child, 'TYPICAL'));
