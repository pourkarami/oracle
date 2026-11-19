# RAC, Data Guard and ASM

[Oracle DBA Query Library](../README.md)

Confirm the database role and instance before interpreting lag, archive gaps or disk-group capacity.

## RAC instance status and startup

[rac-instance-status.sql](rac-instance-status.sql) · Read-only diagnostic

Check which instances are visible and see their startup times, database state and logins state. Compare these with the expected cluster configuration.

Access to `GV$INSTANCE`.

## Database role and protection state

[data-guard-database-role.sql](data-guard-database-role.sql) · Read-only diagnostic

Run on each database to confirm its role, open mode, protection settings and switchover status before interpreting Data Guard diagnostics.

Access to `V$DATABASE`.

## Data Guard transport and apply lag

[standby-transport-apply-lag.sql](standby-transport-apply-lag.sql) · Read-only diagnostic

Run on a standby. Inspect both lag and `datum_time`; a timestamp that stops advancing can indicate that the standby is no longer receiving fresh source data.

Access to `V$DATAGUARD_STATS`.

## Current standby archive gap

[standby-archive-gap.sql](standby-archive-gap.sql) · Read-only diagnostic

Run on a physical standby to locate the current gap blocking recovery by thread. Query again after resolving a gap to detect any subsequent one.

Access to `V$ARCHIVE_GAP`.

## ASM disk group capacity

[asm-diskgroup-capacity.sql](asm-diskgroup-capacity.sql) · Read-only diagnostic

Review raw free MB and `usable_file_mb` together. The latter accounts for redundancy and the capacity reserved to restore it where the value applies.

Access to `V$ASM_DISKGROUP_STAT`.

## PDB open and restricted modes

[pdb-open-modes.sql](pdb-open-modes.sql) · Read-only diagnostic

Run in the CDB root to see PDB open modes by RAC instance. A restricted PDB limits who can connect.

Access to `GV$PDBS`.

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [Data Guard views](https://docs.oracle.com/en/database/oracle/oracle-database/19/sbydb/oracle-data-guard-in-oracle-database-views.html)
- [Automatic Storage Management Administrator’s Guide](https://docs.oracle.com/en/database/oracle/oracle-database/19/ostmg/index.html)
