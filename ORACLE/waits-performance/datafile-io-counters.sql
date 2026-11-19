SELECT fs.con_id, fs.file#, df.name AS file_name,
       fs.phyrds AS read_requests, fs.phywrts AS write_requests,
       fs.phyblkrd AS blocks_read, fs.phyblkwrt AS blocks_written
FROM   v$filestat fs
JOIN   v$datafile df ON df.file# = fs.file#
                     AND df.con_id = fs.con_id
ORDER BY fs.phyrds + fs.phywrts DESC NULLS LAST, fs.con_id, fs.file#;
