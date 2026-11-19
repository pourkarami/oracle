# نشست‌ها و قفل‌ها

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

از نشست فعلی شروع کنید و قبل از تفسیر مسدودکننده یا شناسهٔ پردازه، شمارهٔ نمونه، SID و Serial Number را تطبیق دهید.

## نشست‌های فعال کاربران

[active-user-sessions.sql](active-user-sessions.sql) · تشخیص فقط‌خواندنی

در گزارش کندی، ابتدا این کوئری را اجرا کنید. مقدار `WAITING` انتظار فعلی را نشان می‌دهد و سایر حالت‌ها می‌توانند شامل اجرا یا انتظار برای نوبت CPU باشند.

دسترسی به `V$SESSION`.

## نشست‌های مسدودکننده در RAC

[blocking-sessions-rac.sql](blocking-sessions-rac.sql) · تشخیص فقط‌خواندنی

نشست‌هایی را پیدا کنید که مسدودکنندهٔ معتبر دارند. پیش از اقدام، نمونه، SID و Serial Number را تطبیق دهید. اگر نشست مسدودکننده ناپدید شود، ردیف منتظر باقی می‌ماند.

دسترسی به `GV$SESSION`.

## آبجکت‌های دارای قفل تراکنشی

[locked-objects.sql](locked-objects.sql) · تشخیص فقط‌خواندنی

آبجکت‌هایی را که در کانتینر فعلی قفل DML دارند پیدا کنید. وجود قفل ممکن است عادی باشد و هیچ نشستی منتظر آن نباشد.

دسترسی به `V$LOCKED_OBJECT`، `V$SESSION`، `DBA_OBJECTS`.

## شمار نشانگرها در یک نشست

[session-open-cursors.sql](session-open-cursors.sql) · تشخیص فقط‌خواندنی

فشار Cursor را در نمونهٔ فعلی بررسی کنید. بعضی انواع Cursor در کش نگهداری می‌شوند. برای تشخیص نشت، آمار `opened cursors current` را با حد تنظیم‌شده مقایسه کنید.

دسترسی به `V$OPEN_CURSOR`.

متغیرهای Bind

- `:p_sid` `NUMBER` · SID از نمونهٔ مقصد.

```sql
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
@sessions-locks/session-open-cursors.sql
```

## پیشرفت عملیات طولانی ثبت‌شده

[session-long-operations.sql](session-long-operations.sql) · تشخیص فقط‌خواندنی

عملیات ناتمام گزارش‌شده توسط اوراکل را پیگیری کنید. `time_remaining` برآورد است و فقط عملیات دارای ابزار اندازه‌گیری در این ویو دیده می‌شود.

دسترسی به `GV$SESSION_LONGOPS`.

## تطبیق نشست با پردازهٔ سرور

[session-server-process.sql](session-server-process.sql) · تشخیص فقط‌خواندنی

پس از تأیید SID و Serial Number، پردازهٔ سرور را در نمونهٔ فعلی پیدا کنید. در Shared Server یا اجرای چندرشته‌ای، OS PID ممکن است مختص یک نشست نباشد.

دسترسی به `V$SESSION`، `V$PROCESS`.

متغیرهای Bind

- `:p_sid` `NUMBER` · SID از نمونهٔ مقصد.
- `:p_serial` `NUMBER` · مقدار SERIAL# متناظر با SID.

```sql
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
VARIABLE p_serial NUMBER
EXEC :p_serial := 3189
@sessions-locks/session-server-process.sql
```

## هماهنگ‌کننده و Workerهای موازی

[parallel-session-workers.sql](parallel-session-workers.sql) · تشخیص فقط‌خواندنی

Workerهای اجرای موازی را با شمارهٔ نمونه، SID و Serial Number هماهنگ‌کننده در RAC پیدا کنید.

دسترسی به `GV$PX_SESSION`.

متغیرهای Bind

- `:p_instance` `NUMBER` · شمارهٔ نمونه یا نمونهٔ هماهنگ‌کنندهٔ مانیتور.
- `:p_sid` `NUMBER` · SID از نمونهٔ مقصد.
- `:p_serial` `NUMBER` · مقدار SERIAL# متناظر با SID.

```sql
VARIABLE p_instance NUMBER
EXEC :p_instance := 1
VARIABLE p_sid NUMBER
EXEC :p_sid := 251
VARIABLE p_serial NUMBER
EXEC :p_serial := 3189
@sessions-locks/parallel-session-workers.sql
```

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
