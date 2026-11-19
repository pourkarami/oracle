# اسکیما، امنیت و Jobها

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

وضعیت آبجکت‌ها، دسترسی‌ها و اطلاعات Jobها را از ویوهای دیکشنری بخوانید و فیلترها را در اسکیما یا PDB مقصد اعمال کنید.

## آبجکت‌های نامعتبر یک اسکیما

[invalid-objects-by-owner.sql](invalid-objects-by-owner.sql) · تشخیص فقط‌خواندنی

پیش یا پس از انتشار، آبجکت‌های نامعتبر را بررسی کنید. برای یافتن خطاهای کامپایل یا وابستگی‌ها از نوع و نام آبجکت استفاده کنید.

دسترسی به `DBA_OBJECTS`.

متغیرهای Bind

- `:p_owner` `VARCHAR2(128)` · نام اسکیما مطابق دیکشنری.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
@schema-security-jobs/invalid-objects-by-owner.sql
```

## استخراج DDL یک آبجکت

[object-ddl.sql](object-ddl.sql) · تشخیص فقط‌خواندنی

DDL را به‌صورت متن برای بازبینی یا مقایسه دریافت کنید. دسترسی به فراداده به مالک آبجکت و مجوزهای اجراکننده بستگی دارد.

دسترسی به `DBMS_METADATA`.

متغیرهای Bind

- `:p_object_type` `VARCHAR2(50)` · نوع آبجکت در DBMS_METADATA.
- `:p_object` `VARCHAR2(128)` · نام آبجکت مطابق دیکشنری.
- `:p_owner` `VARCHAR2(128)` · نام اسکیما مطابق دیکشنری.

```sql
VARIABLE p_object_type VARCHAR2(50)
EXEC :p_object_type := 'TABLE'
VARIABLE p_object VARCHAR2(128)
EXEC :p_object := 'EXAMPLE_TABLE'
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
@schema-security-jobs/object-ddl.sql
```

## قیود یک جدول

[table-constraints.sql](table-constraints.sql) · تشخیص فقط‌خواندنی

نوع، ستون‌ها، فعال بودن، وضعیت اعتبارسنجی و قید مرجع یک جدول را در PDB مقصد ببینید.

دسترسی به `DBA_CONSTRAINTS`، `DBA_CONS_COLUMNS`.

متغیرهای Bind

- `:p_owner` `VARCHAR2(128)` · نام اسکیما مطابق دیکشنری.
- `:p_table` `VARCHAR2(128)` · نام جدول مطابق دیکشنری.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
VARIABLE p_table VARCHAR2(128)
EXEC :p_table := 'EXAMPLE_TABLE'
@schema-security-jobs/table-constraints.sql
```

## فهرست ایندکس‌های یک جدول

[table-index-inventory.sql](table-index-inventory.sql) · تشخیص فقط‌خواندنی

ترتیب ستون‌ها، یکتایی، Visibility و نوع ایندکس را ببینید. ایندکس پارتیشن‌بندی‌شده ممکن است به بررسی جداگانهٔ وضعیت پارتیشن‌ها نیاز داشته باشد.

دسترسی به `DBA_INDEXES`، `DBA_IND_COLUMNS`.

متغیرهای Bind

- `:p_owner` `VARCHAR2(128)` · نام اسکیما مطابق دیکشنری.
- `:p_table` `VARCHAR2(128)` · نام جدول مطابق دیکشنری.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
VARIABLE p_table VARCHAR2(128)
EXEC :p_table := 'EXAMPLE_TABLE'
@schema-security-jobs/table-index-inventory.sql
```

## کلیدهای خارجی بدون پیشوند ایندکس منطبق

[foreign-key-index-review.sql](foreign-key-index-review.sql) · تشخیص فقط‌خواندنی

کلیدهای خارجی فعالی را بیابید که ایندکس معمولی و قابل‌مشاهدهٔ B-tree با همان مجموعهٔ ستون‌ها در ابتدای ایندکس ندارند. وضعیت استفاده‌پذیری ایندکس یا پارتیشن را جداگانه بررسی کنید.

دسترسی به `DBA_CONSTRAINTS`، `DBA_CONS_COLUMNS`، `DBA_INDEXES`، `DBA_IND_COLUMNS`.

متغیرهای Bind

- `:p_owner` `VARCHAR2(128)` · نام اسکیما مطابق دیکشنری.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
@schema-security-jobs/foreign-key-index-review.sql
```

## وضعیت و انقضای حساب بر اساس کاربر

[account-status-and-expiry.sql](account-status-and-expiry.sql) · تشخیص فقط‌خواندنی

وضعیت قفل و انقضای رمز را در PDB مقصد بررسی کنید. برای تفسیر انقضا و Grace Period پروفایل کاربر را ببینید.

دسترسی به `DBA_USERS`.

متغیرهای Bind

- `:p_user` `VARCHAR2(128)` · نام کاربر یا NULL برای فهرست محدود.

```sql
VARIABLE p_user VARCHAR2(128)
EXEC :p_user := NULL
@schema-security-jobs/account-status-and-expiry.sql
```

## اعطای مستقیم یک نقش دیتابیس

[direct-role-grants.sql](direct-role-grants.sql) · تشخیص فقط‌خواندنی

گیرندگان مستقیم یک Role و وضعیت Admin Option را ببینید. برای نقش‌های تودرتو، زنجیرهٔ اعطای دسترسی را بررسی کنید.

دسترسی به `DBA_ROLE_PRIVS`.

متغیرهای Bind

- `:p_role` `VARCHAR2(128)` · نام Role مطابق دیکشنری.

```sql
VARIABLE p_role VARCHAR2(128)
EXEC :p_role := 'DBA'
@schema-security-jobs/direct-role-grants.sql
```

## Jobهای در حال اجرای Scheduler

[running-scheduler-jobs.sql](running-scheduler-jobs.sql) · تشخیص فقط‌خواندنی

Jobهای در حال اجرا را بر اساس مالک، نمونه و نشست پیدا کنید. پس از پایان، وضعیت نهایی را در تاریخچهٔ Job ببینید.

دسترسی به `DBA_SCHEDULER_RUNNING_JOBS`.

## اجراهای اخیر Job در Scheduler

[scheduler-job-run-history.sql](scheduler-job-run-history.sql) · تشخیص فقط‌خواندنی

اجراهای ثبت‌شدهٔ اخیر، خطاها و شمارهٔ خطا را برای مالک مشخص مرور کنید. تنظیمات Logging تعیین می‌کند کدام اجراها قابل‌مشاهده‌اند.

دسترسی به `DBA_SCHEDULER_JOB_RUN_DETAILS`.

متغیرهای Bind

- `:p_owner` `VARCHAR2(128)` · نام اسکیما مطابق دیکشنری.
- `:p_days` `NUMBER` · بازهٔ مرور مثبت بر حسب روز.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
VARIABLE p_days NUMBER
EXEC :p_days := 7
@schema-security-jobs/scheduler-job-run-history.sql
```

## فهرست Jobهای Data Pump

[data-pump-jobs.sql](data-pump-jobs.sql) · تشخیص فقط‌خواندنی

حالت Job، نوع عملیات، وضعیت و نشست‌های متصل را در کانتینر فعلی ببینید. جدول Master باقی‌مانده ممکن است بدون Worker فعال دیده شود.

دسترسی به `DBA_DATAPUMP_JOBS`.

## زمینهٔ دیتابیس، نمونه و کانتینر نشست

[database-session-context.sql](database-session-context.sql) · تشخیص فقط‌خواندنی

پیش از نمونه‌برداری از ویوهای پویا یا اعمال فیلتر اسکیما، دامنهٔ گزارش را مشخص کنید.

دسترسی به `SYS_CONTEXT`.

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [مرجع DBMS_METADATA](https://docs.oracle.com/en/database/oracle/oracle-database/19/arpls/DBMS_METADATA.html)
- [راهنمای مدیریت دیتابیس](https://docs.oracle.com/en/database/oracle/oracle-database/19/admin/index.html)
