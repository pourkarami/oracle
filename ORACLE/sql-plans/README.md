# SQL، پلن اجرا و آمار

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

ابتدا SQL ID و Child Cursor را تطبیق دهید. مجموع زمان و میانگین هر اجرا را جداگانه مقایسه کنید.

## Child Cursorهای کش‌شده برای SQL ID

[cached-cursors-by-sql-id.sql](cached-cursors-by-sql-id.sql) · تشخیص فقط‌خواندنی

Plan Hash، شمار اجرا و مصرف منابع هر Child Cursor را روی نمونهٔ محلی ببینید. ردیف‌ها ممکن است از Shared Pool خارج شوند.

دسترسی به `V$SQL`.

متغیرهای Bind

- `:p_sql_id` `VARCHAR2(13)` · SQL ID از نشست یا کش خودتان.

```sql
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
@sql-plans/cached-cursors-by-sql-id.sql
```

## SQLهای برتر کش‌شده بر اساس CPU تجمعی

[top-cached-sql-by-cpu.sql](top-cached-sql-by-cpu.sql) · تشخیص فقط‌خواندنی

SQL IDهای دارای مصرف بالای CPU و فعالیت اخیر را پیدا کنید. زمان تجمعی CPU می‌تواند شامل زمان پیش از بازهٔ فیلتر شود.

دسترسی به `V$SQLSTATS`.

متغیرهای Bind

- `:p_minutes` `NUMBER` · بازهٔ زمانی مثبت بر حسب دقیقه.

```sql
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 15
@sql-plans/top-cached-sql-by-cpu.sql
```

## SQLهای برتر کش‌شده بر اساس زمان تجمعی

[top-cached-sql-by-elapsed.sql](top-cached-sql-by-elapsed.sql) · تشخیص فقط‌خواندنی

SQLهای کش‌شدهٔ اخیراً فعال با مجموع زمان بالا را پیدا کنید. شمار اجرا و میانگین هر اجرا را مقایسه کنید و برای نسبت دادن زمان به یک بازه از تفاضل Snapshotها استفاده کنید.

دسترسی به `V$SQLSTATS`.

متغیرهای Bind

- `:p_minutes` `NUMBER` · بازهٔ زمانی مثبت بر حسب دقیقه.

```sql
VARIABLE p_minutes NUMBER
EXEC :p_minutes := 15
@sql-plans/top-cached-sql-by-elapsed.sql
```

## پلن اجرای Child Cursor کش‌شده

[cached-execution-plan.sql](cached-execution-plan.sql) · تشخیص فقط‌خواندنی

پلن مرتبط با Cursor را مشاهده کنید. از همان نمونه و کانتینر استفاده کنید و توضیحات پلن، برآورد ردیف‌ها و Predicateها را بررسی کنید.

دسترسی به `DBMS_XPLAN`، `V$SQL`، `V$SQL_PLAN`، `V$SQL_PLAN_STATISTICS_ALL`، `V$SESSION`.

متغیرهای Bind

- `:p_sql_id` `VARCHAR2(13)` · SQL ID از نشست یا کش خودتان.
- `:p_child` `NUMBER` · شمارهٔ Child برای SQL ID کش‌شده.

```sql
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
VARIABLE p_child NUMBER
EXEC :p_child := 0
@sql-plans/cached-execution-plan.sql
```

## فرادادهٔ Bindهای ثبت‌شده بر اساس SQL ID

[cached-bind-metadata.sql](cached-bind-metadata.sql) · تشخیص فقط‌خواندنی

موقعیت، نوع و زمان ثبت Bindها را بررسی کنید. ثبت نمونه‌ای است و همهٔ انواع و اجراها را پوشش نمی‌دهد.

دسترسی به `V$SQL_BIND_CAPTURE`.

متغیرهای Bind

- `:p_sql_id` `VARCHAR2(13)` · SQL ID از نشست یا کش خودتان.

```sql
VARIABLE p_sql_id VARCHAR2(13)
EXEC :p_sql_id := '0000000000000'
@sql-plans/cached-bind-metadata.sql
```

## وضعیت SQL Plan Baseline

[sql-plan-baselines.sql](sql-plan-baselines.sql) · تشخیص فقط‌خواندنی

Baselineهای فعال، پذیرفته‌شده و ثابت را ببینید. اگر SQL Handle را می‌دانید فیلتر کنید و دسترسی SPM را برای Edition و نسخه بررسی کنید.

دسترسی به `DBA_SQL_PLAN_BASELINES`.

متغیرهای Bind

- `:p_handle` `VARCHAR2(128)` · SQL Handle یا NULL برای فهرست Baselineهای اخیر.

```sql
VARIABLE p_handle VARCHAR2(128)
EXEC :p_handle := NULL
@sql-plans/sql-plan-baselines.sql
```

## عملیات آمار Optimizer

[optimizer-statistics-operations.sql](optimizer-statistics-operations.sql) · تشخیص فقط‌خواندنی

برای برنامه‌ریزی تغییرات یا بررسی پیدایش پلن جدید، عملیات اخیر جمع‌آوری آمار و وضعیتشان را ببینید.

دسترسی به `DBA_OPTSTAT_OPERATIONS`.

متغیرهای Bind

- `:p_days` `NUMBER` · بازهٔ مرور مثبت بر حسب روز.

```sql
VARIABLE p_days NUMBER
EXEC :p_days := 7
@sql-plans/optimizer-statistics-operations.sql
```

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [مرجع DBMS_XPLAN](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_XPLAN.html)
- [اطلاعات مجوز Oracle](https://docs.oracle.com/en/database/oracle/oracle-database/19/dblic/Licensing-Information.html)
