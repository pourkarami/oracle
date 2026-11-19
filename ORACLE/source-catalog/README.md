# Source catalog

[Oracle DBA Query Library](../README.md)

Use the source links to find legacy variants, private runbooks, third-party tools and Microsoft SQL Server references.

Start with the category guides when investigating an incident. The private source index in OneNote maps archived files and original pages to these topics. Legacy materials can depend on old Oracle releases, client settings or local schemas.

## Tanel Poder’s Troubleshooting Tools for Oracle

The source archive includes the upstream TPT snapshot at the commit below. Use its original directory structure for SQL*Plus dependencies. Its toolbox combines measurements and lab-oriented or administrative files. Check each tool's scope and privileges before running it.

- [Pinned upstream revision](https://github.com/tanelpoder/tpt-oracle/tree/2de19865e4fb3f8503f720bc18a3e4d7d9539de7)
- [Apache License 2.0](https://github.com/tanelpoder/tpt-oracle/blob/2de19865e4fb3f8503f720bc18a3e4d7d9539de7/LICENSE.txt)

| Upstream area | Purpose |
| --- | --- |
| Root scripts | Quick SQL*Plus measurements, cursor and object lookup |
| `ash/`, `awr/` | Sampled activity and historical workload. Check pack entitlement |
| `exadata/`, `im/`, `ppx/` | Platform, In-Memory and parallel-execution tools |
| `statspack/`, `tools/` | Auxiliary reporting and collectors with separate prerequisites |
| `setup/` and lab folders | Optional setup and demonstration materials for isolated environments |
