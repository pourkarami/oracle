SELECT group_number, name, state, type AS redundancy, total_mb, free_mb,
       required_mirror_free_mb, usable_file_mb, offline_disks
FROM   v$asm_diskgroup_stat
ORDER BY name;
