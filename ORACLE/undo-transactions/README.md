# Undo و تراکنش‌ها

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

برای شناسایی مصرف‌کننده‌ها، تعداد بلاک‌ها و رکوردهای Undo را بررسی کنید. پیش از تغییر Retention یا فضا، بازه‌های اخیر را بخوانید.

## تراکنش‌های فعال بر اساس مصرف Undo

[active-transactions.sql](active-transactions.sql) · تشخیص فقط‌خواندنی

پرمصرف‌ترین تراکنش‌های فعلی Undo را بین نمونه‌ها پیدا کنید. پیش از هر اقدام، نشست مرتبط را بررسی کنید.

دسترسی به `GV$TRANSACTION`، `GV$SESSION`.

## آمار بازه‌های اخیر Undo

[undo-interval-statistics.sql](undo-interval-statistics.sql) · تشخیص فقط‌خواندنی

مصرف Undo، Retention تنظیم‌شده و شمار خطاهای Snapshot Too Old یا کمبود فضا را مرور کنید. Retention بر حسب ثانیه است.

دسترسی به `V$UNDOSTAT`.

متغیرهای Bind

- `:p_hours` `NUMBER` · بازهٔ مرور مثبت بر حسب ساعت.

```sql
VARIABLE p_hours NUMBER
EXEC :p_hours := 24
@undo-transactions/undo-interval-statistics.sql
```

## پیشرفت Fast-start Rollback

[fast-start-rollback-progress.sql](fast-start-rollback-progress.sql) · تشخیص فقط‌خواندنی

تراکنش‌های رصدشده در Fast-start Recovery را پیگیری کنید. درصد پیشرفت تقریبی است و کار Undo گزارش‌شده را پوشش می‌دهد.

دسترسی به `V$FAST_START_TRANSACTIONS`.

## فعالیت Segmentهای Undo

[rollback-segment-statistics.sql](rollback-segment-statistics.sql) · تشخیص فقط‌خواندنی

شمار تراکنش‌های فعلی و اندازهٔ هر Segment را همراه انتظارها و نوشتن‌های تجمعی Undo بررسی کنید.

دسترسی به `V$ROLLSTAT`.

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [راهنمای مدیریت دیتابیس](https://docs.oracle.com/en/database/oracle/oracle-database/19/admin/index.html)
