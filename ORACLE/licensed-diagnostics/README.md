# ASH، AWR و SQL Monitoring

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

پیش از دسترسی به ویوها و پکیج‌های اختصاصی، مجوز نسخه و سرویس نصب‌شده را کنترل کنید.

برای ASH و AWR مجوز Oracle Diagnostics Pack را مطابق Edition و سرویس بررسی کنید. در محیط‌هایی که مجوزها جداگانه‌اند، Real-Time SQL Monitoring به Tuning Pack و پیش‌نیاز آن Diagnostics Pack نیاز دارد. Snapshot دستی AWR در مخزن AWR می‌نویسد. سایر اسکریپت‌ها خواندنی و تشخیصی‌اند. [اطلاعات مجوز Oracle](https://docs.oracle.com/en/database/oracle/oracle-database/19/dblic/Licensing-Information.html)

برای تاریخچهٔ AWR، DBID مخزن و کانتینر داده را مشخص کنید. هنگام بررسی چند PDB، مقادیر `CON_ID` و `CON_DBID` را ببینید. ASH نمونه‌برداری می‌شود و آمار AWR مربوط به SQLهای ثبت‌شده است، پس گزارش‌ها را برای مقایسهٔ بار مشاهده‌شده استفاده کنید.

## نمونه‌های اخیر ASH برای یک نشست

[ash-samples-for-session.sql](ash-samples-for-session.sql) · تشخیص فقط‌خواندنی · Diagnostics Pack

با Diagnostics Pack فعالیت نمونه‌برداری‌شدهٔ نشست را در RAC بررسی کنید. فاصله در نمونه‌ها می‌تواند ناشی از غیرفعال بودن یا محدودیت نگهداری باشد.

دسترسی به `GV$ACTIVE_SESSION_HISTORY`.

متغیرهای Bind

- `:p_instance` `NUMBER` · شمارهٔ نمونه یا نمونهٔ هماهنگ‌کنندهٔ مانیتور.
- `:p_sid` `NUMBER` · SID از نمونهٔ مقصد.
- `:p_serial` `NUMBER` · مقدار SERIAL# متناظر با SID.
- `:p_minutes` `NUMBER` · بازهٔ زمانی مثبت بر حسب دقیقه.

```sql
VARIABLE p_instance NUMBER
EXEC :p_instance := 1
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
VARIABLE p_serial NUMBER
EXEC :p_serial := 3189
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 15
@licensed-diagnostics/ash-samples-for-session.sql
```

## فعالیت ASH به تفکیک SQL و وضعیت انتظار

[ash-activity-by-sql-and-wait.sql](ash-activity-by-sql-and-wait.sql) · تشخیص فقط‌خواندنی · Diagnostics Pack

ردیف‌های نمونه‌برداری‌شده از کاربران فعال را در یک بازه بشمارید. این تعداد سهم نسبی فعالیت هر گروه را نشان می‌دهد و با تعداد اجرا فرق دارد.

دسترسی به `GV$ACTIVE_SESSION_HISTORY`.

متغیرهای Bind

- `:p_minutes` `NUMBER` · بازهٔ زمانی مثبت بر حسب دقیقه.

```sql
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 15
@licensed-diagnostics/ash-activity-by-sql-and-wait.sql
```

## آمار SQL در هر Snapshot از AWR

[awr-sql-execution-deltas.sql](awr-sql-execution-deltas.sql) · تشخیص فقط‌خواندنی · Diagnostics Pack

با Diagnostics Pack تفاضل اجرا و مصرف منابع را بر اساس Snapshot، نمونه و پلن مقایسه کنید. ابتدا DBID و کانتینر را مشخص کنید.

دسترسی به `DBA_HIST_SQLSTAT`، `DBA_HIST_SNAPSHOT`.

متغیرهای Bind

- `:p_dbid` `NUMBER` · DBID مخزن از Snapshotهای AWR موردنظر.
- `:p_con_dbid` `NUMBER` · DBID کانتینر مقصد. مقدار NULL فیلتر کانتینر را برمی‌دارد، پس ستون‌های کانتینر خروجی را بررسی کنید.
- `:p_sql_id` `VARCHAR2(13)` · SQL ID از نشست یا کش خودتان.
- `:p_days` `NUMBER` · بازهٔ مرور مثبت بر حسب روز.

```sql
VARIABLE p_dbid NUMBER
EXEC :p_dbid := 1000000001
VARIABLE p_con_dbid NUMBER
EXEC :p_con_dbid := 1000000001
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
VARIABLE p_days NUMBER
EXEC :p_days := 7
@licensed-diagnostics/awr-sql-execution-deltas.sql
```

## پلن‌های ثبت‌شده در AWR برای یک SQL ID

[awr-captured-sql-plans.sql](awr-captured-sql-plans.sql) · تشخیص فقط‌خواندنی · Diagnostics Pack

Plan Hashهای ثبت‌شده برای SQL ID و کانتینر مشخص را ببینید. زمان اجرا را از آمار SQL در Snapshotها بررسی کنید.

دسترسی به `DBA_HIST_SQL_PLAN`.

متغیرهای Bind

- `:p_dbid` `NUMBER` · DBID مخزن از Snapshotهای AWR موردنظر.
- `:p_con_dbid` `NUMBER` · DBID کانتینر مقصد. مقدار NULL فیلتر کانتینر را برمی‌دارد، پس ستون‌های کانتینر خروجی را بررسی کنید.
- `:p_sql_id` `VARCHAR2(13)` · SQL ID از نشست یا کش خودتان.

```sql
VARIABLE p_dbid NUMBER
EXEC :p_dbid := 1000000001
VARIABLE p_con_dbid NUMBER
EXEC :p_con_dbid := 1000000001
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
@licensed-diagnostics/awr-captured-sql-plans.sql
```

## رشد Tablespace در AWR بر حسب بلاک

[awr-tablespace-growth.sql](awr-tablespace-growth.sql) · تشخیص فقط‌خواندنی · Diagnostics Pack

Snapshotهای AWR را برای یک Tablespace در یک کانتینر مقایسه کنید. خروجی بر حسب بلاک می‌ماند تا اندازه‌های متفاوت بلاک قابل تفسیر باشند.

دسترسی به `DBA_HIST_TBSPC_SPACE_USAGE`، `DBA_HIST_SNAPSHOT`.

متغیرهای Bind

- `:p_dbid` `NUMBER` · DBID مخزن از Snapshotهای AWR موردنظر.
- `:p_con_dbid` `NUMBER` · DBID کانتینر مقصد. مقدار NULL فیلتر کانتینر را برمی‌دارد، پس ستون‌های کانتینر خروجی را بررسی کنید.
- `:p_ts_id` `NUMBER` · شمارهٔ Tablespace در کانتینر انتخابی.
- `:p_days` `NUMBER` · بازهٔ مرور مثبت بر حسب روز.

```sql
VARIABLE p_dbid NUMBER
EXEC :p_dbid := 1000000001
VARIABLE p_con_dbid NUMBER
EXEC :p_con_dbid := 1000000001
VARIABLE p_ts_id NUMBER
EXEC :p_ts_id := 7
VARIABLE p_days NUMBER
EXEC :p_days := 7
@licensed-diagnostics/awr-tablespace-growth.sql
```

## اجراهای قابل‌مشاهده در Real-Time SQL Monitoring

[sql-monitor-executions.sql](sql-monitor-executions.sql) · تشخیص فقط‌خواندنی · Tuning Pack + Diagnostics Pack

از Tuning Pack همراه با پیش‌نیاز Diagnostics Pack استفاده کنید. شمارهٔ نمونهٔ هماهنگ‌کننده، SQL ID، شناسه و زمان شروع اجرا را برای گزارش ثبت کنید.

دسترسی به `GV$SQL_MONITOR`.

متغیرهای Bind

- `:p_sql_id` `VARCHAR2(13)` · SQL ID از نشست یا کش خودتان.

```sql
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
@licensed-diagnostics/sql-monitor-executions.sql
```

## گزارش متنی یک اجرای SQL مانیتورشده

[sql-monitor-text-report.sql](sql-monitor-text-report.sql) · تشخیص فقط‌خواندنی · Tuning Pack + Diagnostics Pack

گزارش همان اجرای مشخص‌شده در فهرست را باز کنید. برخی گزارش‌ها شامل متن SQL یا شناسه‌های عملیاتی‌اند. خروجی را پیش از اشتراک بررسی کنید.

دسترسی به `DBMS_SQLTUNE`، `GV$SQL_MONITOR`.

متغیرهای Bind

- `:p_instance` `NUMBER` · شمارهٔ نمونه یا نمونهٔ هماهنگ‌کنندهٔ مانیتور.
- `:p_sql_id` `VARCHAR2(13)` · SQL ID از نشست یا کش خودتان.
- `:p_exec_id` `NUMBER` · مقدار SQL_EXEC_ID از فهرست مانیتور.
- `:p_exec_start` `VARCHAR2(19)` · مقدار REPORT_START_VALUE از ردیف متناظر مانیتور.

```sql
VARIABLE p_instance NUMBER
EXEC :p_instance := 1
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
VARIABLE p_exec_id NUMBER
EXEC :p_exec_id := 16777216
VARIABLE p_exec_start VARCHAR2(19)
EXEC :p_exec_start := '2026-01-15 09:30:00'
@licensed-diagnostics/sql-monitor-text-report.sql
```

## ساخت یک Snapshot دستی AWR

[create-awr-snapshot.sql](create-awr-snapshot.sql) · نوشتن در مخزن AWR · Diagnostics Pack

مدیر مجاز می‌تواند مرز قبل یا بعد از یک بررسی را در مخزن AWR موردنظر ثبت کند. اجرای بلوک در مخزن می‌نویسد و شناسهٔ Snapshot را برمی‌گرداند.

دسترسی به `DBMS_WORKLOAD_REPOSITORY`، `DBMS_OUTPUT`.

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [اطلاعات مجوز Oracle](https://docs.oracle.com/en/database/oracle/oracle-database/19/dblic/Licensing-Information.html)
- [مرجع DBMS_SQLTUNE](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_SQLTUNE.html)
- [مرجع DBMS_WORKLOAD_REPOSITORY](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_WORKLOAD_REPOSITORY.html)
