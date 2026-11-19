# Operations reference

[Oracle DBA Query Library](../README.md)

Use the notes to locate the applicable runbook and identify settings or actions that require change approval.

## Blocking incident

Record the waiting and blocking identities with the RAC-aware query. Check whether the blocker is in an active transaction and consult the application owner before changing session state. Track rollback after any approved intervention.

- [Current blocking sessions across instances](../sessions-locks/blocking-sessions-rac.sql)
- [Active transactions ranked by undo](../undo-transactions/active-transactions.sql)
- [Fast-start rollback progress](../undo-transactions/fast-start-rollback-progress.sql)

## Performance incident

Capture two wait and time-model samples. Inspect cached SQL and child plans once the dominant wait or CPU pattern is clear. Use ASH or AWR for historical attribution when entitled.

- [Instance-wide wait totals](../waits-performance/instance-wait-totals.sql)
- [Database time and CPU totals](../waits-performance/instance-time-model.sql)
- [Plan of a cached child cursor](../sql-plans/cached-execution-plan.sql)

## Capacity or FRA alert

Confirm which container or destination is affected. Check allocation and free extents, or FRA quota and files by type. Review backup retention and standby apply state before approving maintenance.

- [Tablespace usage and effective capacity](../storage-space/tablespace-usage.sql)
- [Allocated and free datafile space](../storage-space/datafile-free-space.sql)
- [Fast Recovery Area capacity](../redo-backup-recovery/recovery-area-usage.sql)
- [FRA usage by file type](../redo-backup-recovery/recovery-area-by-file-type.sql)

## Standby lag or archive gap

Confirm the role, inspect lag and its source timestamp, and check the current archive gap. Record thread and sequence before using an environment-specific recovery procedure.

- [Database role and protection state](../rac-data-guard-asm/data-guard-database-role.sql)
- [Data Guard transport and apply lag](../rac-data-guard-asm/standby-transport-apply-lag.sql)
- [Current standby archive gap](../rac-data-guard-asm/standby-archive-gap.sql)

## Schema deployment

Capture invalid objects, object definitions, index inventory and relevant Scheduler runs before and after the change.

- [Invalid objects in one schema](../schema-security-jobs/invalid-objects-by-owner.sql)
- [Extract DDL for one object](../schema-security-jobs/object-ddl.sql)
- [Index inventory for one table](../schema-security-jobs/table-index-inventory.sql)
- [Recent Scheduler job runs](../schema-security-jobs/scheduler-job-run-history.sql)
