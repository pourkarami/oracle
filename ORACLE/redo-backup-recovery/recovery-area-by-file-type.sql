SELECT con_id, file_type, percent_space_used,
       percent_space_reclaimable, number_of_files
FROM   v$recovery_area_usage
ORDER BY percent_space_used DESC, file_type;
