SELECT con_id, owner, object_name, subobject_name, object_type,
       statistic_name, value
FROM   v$segment_statistics
WHERE  owner = :p_owner
AND    statistic_name = :p_statistic
AND    value > 0
ORDER BY value DESC, object_name, subobject_name
FETCH FIRST 50 ROWS ONLY;
