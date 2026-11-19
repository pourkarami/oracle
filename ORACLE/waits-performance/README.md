# انتظارها و کارایی

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

برای مقایسهٔ شمارنده‌های تجمعی، در دو نقطه از یک بازه و از همان نمونه داده بگیرید.

## مجموع انتظارهای یک نشست

[session-wait-totals.sql](session-wait-totals.sql) · تشخیص فقط‌خواندنی

انتظارهای تجمعی غیر Idle را برای یک نشست فعلی روی نمونهٔ محلی بخوانید. تفاضل دو برداشت، بازهٔ موردنظر را جدا می‌کند.

دسترسی به `V$SESSION_EVENT`، `V$SESSION`.

متغیرهای Bind

- `:p_sid` `NUMBER` · SID از نمونهٔ مقصد.
- `:p_serial` `NUMBER` · مقدار SERIAL# متناظر با SID.

```sql
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
VARIABLE p_serial NUMBER
EXEC :p_serial := 3189
@waits-performance/session-wait-totals.sql
```

## مجموع انتظارهای نمونه

[instance-wait-totals.sql](instance-wait-totals.sql) · تشخیص فقط‌خواندنی

رویدادهای Foreground با زمان انتظار تجمعی بالا را پیدا کنید. دو برداشت از یک نمونه بگیرید و تفاضل مقادیر را مقایسه کنید.

دسترسی به `V$SYSTEM_EVENT`.

## شمارنده‌های فعالیت نمونه

[instance-activity-counters.sql](instance-activity-counters.sql) · تشخیص فقط‌خواندنی

Commit، Rollback، خواندن، اجرا و بایت‌های Redo را ثبت کنید. برای نرخ، تفاضل دو برداشت در یک دورهٔ Startup را بر زمان سپری‌شده تقسیم کنید.

دسترسی به `V$SYSSTAT`، `V$INSTANCE`.

## مجموع انتظارها به تفکیک کلاس

[wait-class-totals.sql](wait-class-totals.sql) · تشخیص فقط‌خواندنی

مجموع زمان انتظار Foreground را به تفکیک کلاس بررسی کنید تا حوزهٔ عیب‌یابی مشخص شود. زمان CPU را از Time Model بخوانید.

دسترسی به `V$SYSTEM_EVENT`.

## مجموع DB Time و CPU

[instance-time-model.sql](instance-time-model.sql) · تشخیص فقط‌خواندنی

تفاضل DB Time و DB CPU را مقایسه کنید. چون چند نشست هم‌زمان زمان مصرف می‌کنند، DB Time با زمان دیواری فرق دارد.

دسترسی به `V$SYS_TIME_MODEL`.

## شمارنده‌های I/O فیزیکی فایل داده

[datafile-io-counters.sql](datafile-io-counters.sql) · تشخیص فقط‌خواندنی

فایل‌ها را بر اساس مجموع خواندن و نوشتن فیزیکی رتبه‌بندی کنید. برای بازهٔ مشکل، تفاضل برداشت‌ها از نمونه و کانتینر یکسان را مقایسه کنید.

دسترسی به `V$FILESTAT`، `V$DATAFILE`.

## فعالیت Segment بر اساس نوع آمار

[segment-activity-counters.sql](segment-activity-counters.sql) · تشخیص فقط‌خواندنی

Segmentهای فعال را برای مالک و نوع آمار مشخص پیدا کنید. برای فعالیت اخیر، تفاضل دو برداشت را بسنجید و نام پارتیشن را در مقایسه حفظ کنید.

دسترسی به `V$SEGMENT_STATISTICS`.

متغیرهای Bind

- `:p_owner` `VARCHAR2(128)` · نام اسکیما مطابق دیکشنری.
- `:p_statistic` `VARCHAR2(64)` · نام دقیق شاخص.

```sql
VARIABLE p_owner VARCHAR2(128)
EXEC :p_owner := 'APP_SCHEMA'
VARIABLE p_statistic VARCHAR2(64)
EXEC :p_statistic := 'logical reads'
@waits-performance/segment-activity-counters.sql
```

## خطا و Sleep در Latch

[latch-contention-summary.sql](latch-contention-summary.sql) · تشخیص فقط‌خواندنی

برای یافتن Latchهای قابل‌بررسی، تفاضل Gets، Misses و Sleeps را در یک بازه مقایسه کنید. شمارنده‌ها مربوط به نمونهٔ محلی هستند.

دسترسی به `V$LATCH`.

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [تنظیم کارایی نمونه با ویوهای کارایی](https://docs.oracle.com/en/database/oracle/oracle-database/19/tgdba/instance-tuning-using-performance-views.html)
