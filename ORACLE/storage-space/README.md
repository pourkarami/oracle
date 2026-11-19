# فضای ذخیره‌سازی

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

فضای تخصیص‌یافته، فضای آزاد فعلی و حد رشد را جداگانه بخوانید. ویوهای دیکشنری PDB را در کانتینر موردنظر اجرا کنید.

## مصرف و ظرفیت مؤثر Tablespace

[tablespace-usage.sql](tablespace-usage.sql) · تشخیص فقط‌خواندنی

فضای مصرف‌شده و ظرفیت مؤثر را برای هر Tablespace بخوانید. Autoextend، فضای زیرساخت و محدودیت کانتینر می‌توانند ظرفیت این ویو را تغییر دهند.

دسترسی به `DBA_TABLESPACE_USAGE_METRICS`، `DBA_TABLESPACES`.

## فضای تخصیص‌یافته و آزاد فایل داده

[datafile-free-space.sql](datafile-free-space.sql) · تشخیص فقط‌خواندنی

تخصیص فعلی، Extentهای آزاد و سقف Autoextend را مقایسه کنید. برای فایل‌های آفلاین ممکن است اطلاعات Extent دیده نشود و مقدار فضای آزاد نامشخص باشد.

دسترسی به `DBA_DATA_FILES`، `DBA_FREE_SPACE`.

## بالاترین Extent تخصیص‌یافته در فایل داده

[datafile-end-extents.sql](datafile-end-extents.sql) · تشخیص فقط‌خواندنی

قبل از برنامه‌ریزی Resize، آخرین Extent قابل‌مشاهده در فایل آنلاین را بررسی کنید. Header، فایل‌های آفلاین و تخصیص هم‌زمان به بررسی جداگانه نیاز دارند.

دسترسی به `DBA_DATA_FILES`، `DBA_TABLESPACES`، `DBA_EXTENTS`.

متغیرهای Bind

- `:p_file_id` `NUMBER` · شناسهٔ فایل داده در کانتینر مقصد.

```sql
VARIABLE p_file_id NUMBER
EXEC :p_file_id := 7
@storage-space/datafile-end-extents.sql
```

## مصرف فعلی TEMP به تفکیک نشست

[temp-usage-by-session.sql](temp-usage-by-session.sql) · تشخیص فقط‌خواندنی

مصرف‌کنندگان فعلی TEMP را به تفکیک نشست و نوع Segment پیدا کنید. خروجی بر حسب بلاک است و نمونه‌ها و کانتینرها جدا می‌مانند.

دسترسی به `GV$TEMPSEG_USAGE`، `GV$SESSION`.

## فضای ثبت‌شده در Header فایل TEMP

[tempfile-space.sql](tempfile-space.sql) · تشخیص فقط‌خواندنی

فضای مصرف‌شده و آزاد هر فایل TEMP را از Header بخوانید. برای دیدن مالک تخصیص‌های فعال از کوئری نشست استفاده کنید.

دسترسی به `V$TEMP_SPACE_HEADER`.

## بزرگ‌ترین Segmentهای تخصیص‌یافتهٔ اسکیما

[largest-schema-segments.sql](largest-schema-segments.sql) · تشخیص فقط‌خواندنی

Segmentهایی را که بیشترین بایت تخصیص‌یافته را دارند پیدا کنید. جدول، ایندکس، LOB و پارتیشن می‌توانند ردیف‌های جدا داشته باشند.

دسترسی به `DBA_SEGMENTS`.

متغیرهای Bind

- `:p_owner` `VARCHAR2(128)` · نام اسکیما مطابق دیکشنری.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
@storage-space/largest-schema-segments.sql
```

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [راهنمای مدیریت دیتابیس](https://docs.oracle.com/en/database/oracle/oracle-database/19/admin/index.html)
