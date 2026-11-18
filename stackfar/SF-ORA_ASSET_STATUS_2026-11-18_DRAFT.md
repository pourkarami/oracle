# StackOra (SF-ORA) — Public-safe Asset Status Index

**Record date:** 2026-11-18
**Document:** metadata-only navigation draft — not a publication, installation certification, or source-code release.

This file intentionally contains no private Google Drive / OneNote / Notion links, customer data, environment names, production commands, trace logs, passwords, or unpublished media.

## Topic status

| Area | Material | Gate |
|---|---|---|
| Oracle 19c on Linux | Compatibility matrix and patch-aware installation visuals | Source/platform and visual QA are distinct from a publication sign-off |
| Oracle 19c Installation | Complete Linux installation runbook, FA/EN text and seven-panel carousel per locale | Editorial-owner-approved package dated 2026-11-11; operational validation and distribution are separate |
| Oracle High Availability | Failure domains, RTO/RPO, RAC and Data Guard architecture decision roadmap, FA/EN visual package | Editorial-owner-approved package dated 2026-11-11; no real failover test is asserted |
| Oracle 19c Error Clinic | Five episodes: ORA-00257, ORA-01653, ORA-01555, ORA-04031, ORA-00600 | Editorial/media approval is not proof of technical test, production diagnosis or release |
| Oracle 19c / 26ai Hands-on Labs | Eleven proposed exercises for Developer, Sysadmin and DBA | QA_HOLD: no lab execution evidence, no owner acceptance, no code to be published |
| Oracle Concepts 26ai | Versioned curriculum mapped to official chapters and objectives | Track-specific source and independent bilingual deliverable gates apply |

## Boundaries

- Production commands, untested DDL/DML, credentials, protected Oracle environments and customer identifiers must not be committed.
- QA_HOLD means no claim of technical validation, Done, approved public download or scheduled release.
- 15 bilingual output classes per official objective are separate artifacts; neither the presence of this index nor an editorial package satisfies that gate.
- Oracle 19c and Oracle 26ai require independent release/OS/patch applicability verification before technical procedures are approved.
- Canonical versioned media, private work-in-progress and evidence stay in access-controlled project systems; this public GitHub repository is not their backup or mirror.
- The project owner must approve the exact version and sanitized source before any release branch is merged or distribution is scheduled.

## Official vendor documentation

- [Oracle Database 19c Books](https://docs.oracle.com/en/database/oracle/oracle-database/19/index.html)
- [Oracle AI Database documentation](https://docs.oracle.com/en/database/oracle/oracle-database/index.html)
- [Oracle Database 19c Installation and Upgrade](https://docs.oracle.com/en/database/oracle/oracle-database/19/install-and-upgrade.html)

**Status of this change:** draft navigation for review; no lab scripts, binary media or production artifacts included.

## Structural reconciliation addendum — 2026-11-18

- The canonical StackOra curriculum has 15 domain containers with separate Oracle 19c and Oracle 26ai study sections. A section/folder is a **scope container**, not proof of a completed bilingual objective or tested lab.
- A bounded OneNote inventory observed 19c RAC, 26ai RAC, 19c ASM, 26ai ASM, 26ai Data Guard and other direct sections without teaching pages. These are observations from the scan, **not** an exhaustive inventory or a claim that no material exists elsewhere.
- One existing English Error Clinic entry for ORA-00600 appears more than once under the same title. Both source identities must be reconciled before any rename, deletion or future mirror; no deletion was performed.
- The scan encountered a temporary Microsoft API rate limit. Therefore its unscanned and rate-limited portions remain `AUDIT_INCOMPLETE`, not `EMPTY`.
- Source-discovery prompts for the Data Guard and Backup/Recovery domains are `SCOPE_ONLY`, which does not authorize new official objective IDs or mark any 15×2 educational deliverable as completed.
- Private manifests, media, RTO/RPO evidence and any lab scripts stay in the controlled project systems. This public review branch contains metadata only.

Official starting references: [Oracle 19c HA library](https://docs.oracle.com/en/database/oracle/oracle-database/19/high-availability.html), [19c Data Guard](https://docs.oracle.com/en/database/oracle/oracle-database/19/sbydb/index.html), [19c licensing](https://docs.oracle.com/en/database/oracle/oracle-database/19/dblic/Licensing-Information.html).

**Current boundary:** `DRAFT / QA_HOLD / NOT_MERGED / NOT_PUBLISHED`. This addendum documents detected continuity gaps; it does not approve a release or executable procedure.

### Completed direct-section inventory (2026-11-18)

All 15 Oracle domain sections were enumerated for both 19c and 26ai. Direct page totals by domain (19c/26ai): Concepts 1/44; Database Reference 0/0; Administration 0/0; Multitenant 0/0; RAC 0/0; Data Guard 2/0; ASM 0/0; Clusterware 0/0; Backup and Recovery 1/1; Security 0/0; Performance Tuning 0/0; Install and Upgrade 2/0; Sharding 0/0; New Features 0/0; Errors and Troubleshooting 11/0. Each read had no further pagination. These are OneNote direct-page counts, **not** completed lesson counts.

Two 19c ORA-00600 English pages have **identical visible text** across all 30 blocks, but distinct resource IDs and creation times. Review media and page history before deciding whether to consolidate; preserve both in the meantime. One 19c Backup and Recovery page has an empty title; preserve for evidence reconciliation. QA_HOLD remains unchanged.
