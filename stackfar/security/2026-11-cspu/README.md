# SF-ORA / StackOra — Oracle Database 19c and Oracle AI Database 26ai
## November 2026 Critical Security Patch Update | Review candidate

**Status: DOCUMENTATION DRAFT / QA HOLD — not a public release or approved lab procedure.**  
Research cut-off: 2026-11-22. Advisory publication: 2026-11-17 (Oracle Rev 1).  
Source: [Oracle November 2026 CSPU](https://www.oracle.com/security-alerts/cspunov2026.html) and [Oracle Database Server Risk Matrix](https://www.oracle.com/security-alerts/cspunov2026verbose.html).

This public-safe source mapping is original StackOra editorial work based on Oracle's published risk matrix. It does **not** disclose any private workspace references, assets, customer data, incident evidence, SQL scripts, passwords, network topology, or unreviewed binary media.

### Scope, not marketing shortcuts

Oracle's November 2026 CSPU reports **20** new patches across the wider *Oracle Database Products* family, including **7** new security fixes in the **Oracle Database Server** matrix. Of those seven, Oracle states **3** may be remotely exploitable *without authentication*. The maximum CVSS v3.1 score in the Database Server risk matrix is **9.9**. These figures must not be conflated with confirmed exploitable Oracle Homes in a given environment.

| CVE | Component | CVSS 3.1 | Oracle-listed prerequisites / impact | Affected ranges shown in the Oracle matrix |
| --- | --- | --- | --- | --- |
| CVE-2026-114819 | Oracle Text | 9.9 | CREATE SESSION + Oracle Net; potential Oracle Text takeover, **not pre-auth** | 19.3–19.32; 21.3–21.24; 23.4.0–23.26.3 |
| CVE-2026-114848 | Oracle Text | 9.9 | CREATE SESSION + Oracle Net; potential Oracle Text takeover, **not pre-auth** | 19.3–19.33; 21.3–21.24; 23.4.0–23.26.3 |
| CVE-2026-114822 | RDBMS | 9.9 | CREATE SESSION + Oracle Net; potential RDBMS takeover, **not pre-auth** | 23.4.0–23.26.4 |
| CVE-2026-72897 | RDBMS / OpenSSL | 7.5 | No privileges, TLS, unauthenticated; denial of service / crash or hang | 19.32–19.33; 23.4.0–23.26.4 |
| CVE-2026-115557 | RDBMS / Python | 7.4 | Unauthenticated, higher attack complexity, multiple protocols; confidentiality/integrity | 21.3–21.24; 23.4.0–23.26.3 |
| CVE-2026-89425 | Fleet Patching and Provisioning / jackson-core | 6.5 | HTTP, low privilege; denial of service | 19.3–19.33; 21.3–21.24; 23.4.0–23.26.4 |
| CVE-2026-64607 | RDBMS / Apache HttpClient | 4.3 | HTTP, pre-auth **with user interaction**; partial denial of service | 19.3–19.33; 21.3–21.24; 23.4.0–23.26.4 |

> **Careful:** “CVSS 9.9” and “unauthenticated” are independent properties. The three 9.9 rows above all list CREATE SESSION. The Oracle document, not a generalized threat slogan, must determine the prerequisites, impact and patch mapping for each issue.

### Release update ≠ November CSPU

The October 2026 Database RUs include **19c RU 19.33** and **26ai RU 23.26.4** (the 26ai marketing name coexists with 23.26.x RU numbers). Oracle's November risk matrix continues to list vulnerabilities affecting versions through those RU levels. The exact corresponding CSPU and one-off patch requirements must therefore be confirmed through the relevant Oracle Patch Availability Document / My Oracle Support documentation rather than assumed from the October RU number.

A patch inventory should cover the applicable **Database Server Oracle Homes**, corresponding **Grid Infrastructure**, clients and auxiliary components. `DBA_REGISTRY_SQLPATCH` alone is not complete binary-level inventory; OPatch/Oracle Home evidence and the vendor patch applicability document are still required.

### Safe operational checklist

1. Inventory and classify Production, standby, RAC, Development, Test, Oracle Homes and applicable Oracle components.
2. Evaluate each CVE's actual protocol, privilege, affected component, patch availability, exposure and service criticality.
3. Confirm whether an October RU **and** any applicable November CSPU/one-off fixes have been installed in each environment.
4. Reassess least privilege, network boundaries, TLS/TDE, Unified Auditing, privileged accounts and backup/recovery controls.
5. On 26ai, validate SQL Firewall policy and **licensing** before use: [Oracle SQL Firewall Licensing](https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlfw/licensing-oracle-sql-firewall.html).
6. Test in a representative isolated lab, validate restore/rollback and RAC/Data Guard procedures, obtain change approval, then capture post-patch proof.

### Source references

- [Oracle November 2026 CSPU](https://www.oracle.com/security-alerts/cspunov2026.html)
- [Verbose November 2026 Risk Matrix](https://www.oracle.com/security-alerts/cspunov2026verbose.html)
- [October 2026 CPU](https://www.oracle.com/security-alerts/cpuoct2026.html)
- [19c Patch Maintenance](https://docs.oracle.com/en/database/oracle/oracle-database/19/dbptc/)
- [26ai Patch Maintenance](https://docs.oracle.com/en/database/oracle/oracle-database/26/dbptc/)
- [26ai SQL Firewall License](https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlfw/licensing-oracle-sql-firewall.html)

**Review gate:** independent technical QA, version/licensing verification, owner approval and presentation/media QA. A GitHub Draft PR is a review surface only; it is not permission to merge or schedule publication.
