SELECT thread#, low_sequence#, high_sequence#
FROM   v$archive_gap
ORDER BY thread#, low_sequence#;
