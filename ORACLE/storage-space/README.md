# Storage and space

[Oracle DBA Query Library](../README.md)

Distinguish allocated bytes, current free space, and the growth limit. Read per-PDB dictionary views in the intended container.

## Tablespace usage and effective capacity

[tablespace-usage.sql](tablespace-usage.sql) · Read-only diagnostic

Read used bytes and maximum effective capacity by tablespace. Autoextend, underlying storage and container limits can influence the capacity in the metrics view.

Access to `DBA_TABLESPACE_USAGE_METRICS`, `DBA_TABLESPACES`.

## Allocated and free datafile space

[datafile-free-space.sql](datafile-free-space.sql) · Read-only diagnostic

Compare current allocation, free extents and autoextend ceilings. Offline files can lack extent visibility and report unknown free space here.

Access to `DBA_DATA_FILES`, `DBA_FREE_SPACE`.

## Highest allocated extent in a datafile

[datafile-end-extents.sql](datafile-end-extents.sql) · Read-only diagnostic

Review the last extent seen in an online file before planning a resize. File headers, offline files and concurrent allocations require separate assessment.

Access to `DBA_DATA_FILES`, `DBA_TABLESPACES`, `DBA_EXTENTS`.

Bind variables

- `:p_file_id` `NUMBER` · Datafile ID in the intended container.

```sql
VARIABLE p_file_id NUMBER
EXEC :p_file_id := 7
@storage-space/datafile-end-extents.sql
```

## Current temporary segments by session

[temp-usage-by-session.sql](temp-usage-by-session.sql) · Read-only diagnostic

Find active TEMP consumers by session and segment type. The result reports blocks and keeps instances and containers separate.

Access to `GV$TEMPSEG_USAGE`, `GV$SESSION`.

## Tempfile space header totals

[tempfile-space.sql](tempfile-space.sql) · Read-only diagnostic

Check per-file temporary space and free bytes from the space headers. Use the session query to identify live allocation owners.

Access to `V$TEMP_SPACE_HEADER`.

## Largest allocated segments by schema

[largest-schema-segments.sql](largest-schema-segments.sql) · Read-only diagnostic

Identify the segments that account for allocated bytes. Table, index, LOB and partition segments can appear on separate rows.

Access to `DBA_SEGMENTS`.

Bind variables

- `:p_owner` `VARCHAR2(128)` · Schema name as stored in the dictionary.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
@storage-space/largest-schema-segments.sql
```

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [Database Administrator’s Guide](https://docs.oracle.com/en/database/oracle/oracle-database/19/admin/index.html)
