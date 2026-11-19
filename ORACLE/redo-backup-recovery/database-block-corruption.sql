SELECT con_id, file#, block#, blocks, corruption_change#, corruption_type
FROM   v$database_block_corruption
ORDER BY con_id, file#, block#;
