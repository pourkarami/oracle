# Redo, backup and recovery

[Oracle DBA Query Library](../README.md)

Check archive volume, FRA usage and RMAN status independently. A successful backup job does not establish recoverability.

## Online redo groups and members

[online-redo-groups.sql](online-redo-groups.sql) · Read-only diagnostic

Review online redo status, size and member placement by thread. A group can have multiple members and appear on several output rows.

Access to `V$LOG`, `V$LOGFILE`.

## Daily log switch history

[daily-log-switches.sql](daily-log-switches.sql) · Read-only diagnostic

Count redo sequences by day and thread. The control file can retain a limited history and the query is scoped to the current incarnation.

Access to `V$LOG_HISTORY`, `V$DATABASE`.

Bind variables

- `:p_days` `NUMBER` · Positive lookback in days.

```sql
VARIABLE p_days NUMBER
EXEC :p_days := 7
@redo-backup-recovery/daily-log-switches.sql
```

## Daily archived redo volume for one destination

[archived-redo-volume.sql](archived-redo-volume.sql) · Read-only diagnostic

Estimate archive volume by day and thread at one destination. Repeated archive records are grouped by incarnation, thread and log sequence before bytes are summed.

Access to `V$ARCHIVED_LOG`.

Bind variables

- `:p_days` `NUMBER` · Positive lookback in days.
- `:p_dest_id` `NUMBER` · Archive destination ID from your environment.

```sql
VARIABLE p_days NUMBER
EXEC :p_days := 7
VARIABLE p_dest_id NUMBER
EXEC :p_dest_id := 1
@redo-backup-recovery/archived-redo-volume.sql
```

## Fast Recovery Area capacity

[recovery-area-usage.sql](recovery-area-usage.sql) · Read-only diagnostic

Compare the FRA limit, reported used space and reclaimable bytes. Files from previous locations can contribute to reported usage.

Access to `V$RECOVERY_FILE_DEST`.

## FRA usage by file type

[recovery-area-by-file-type.sql](recovery-area-by-file-type.sql) · Read-only diagnostic

See which file types consume FRA quota and which are reclaimable. Pair this report with the FRA capacity query.

Access to `V$RECOVERY_AREA_USAGE`.

## Recent RMAN backup jobs

[rman-backup-job-history.sql](rman-backup-job-history.sql) · Read-only diagnostic

Inspect job status, duration, input type and output size in the target control file. Check the job log for the cause of warnings or failures.

Access to `V$RMAN_BACKUP_JOB_DETAILS`.

Bind variables

- `:p_days` `NUMBER` · Positive lookback in days.

```sql
VARIABLE p_days NUMBER
EXEC :p_days := 7
@redo-backup-recovery/rman-backup-job-history.sql
```

## Recovery progress measurements

[media-recovery-progress.sql](media-recovery-progress.sql) · Read-only diagnostic

Read the recovery measurements currently exposed on this instance. Rows have different units and can include timestamps or operation milestones.

Access to `V$RECOVERY_PROGRESS`.

## Known corrupt blocks

[database-block-corruption.sql](database-block-corruption.sql) · Read-only diagnostic

List known corruption ranges registered in the control file. An empty result means no ranges are currently recorded. Use a validation job to assess physical and logical integrity.

Access to `V$DATABASE_BLOCK_CORRUPTION`.

## References

- [Oracle Database Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [Backup and Recovery User’s Guide](https://docs.oracle.com/en/database/oracle/oracle-database/19/bradv/index.html)
