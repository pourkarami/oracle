# مرجع عملیات

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

از یادداشت‌ها برای پیدا کردن دستورالعمل مرتبط و شناسایی اقدام‌هایی استفاده کنید که به تأیید تغییر نیاز دارند.

## مسدودی نشست

با کوئری RAC، شناسهٔ نشست منتظر و مسدودکننده را ثبت کنید. تراکنش فعال مسدودکننده را بررسی کنید و پیش از تغییر وضعیت نشست با مالک برنامه هماهنگ شوید. پس از اقدام مصوب، Rollback را پیگیری کنید.

- [نشست‌های مسدودکننده در RAC](../sessions-locks/blocking-sessions-rac.sql)
- [تراکنش‌های فعال بر اساس مصرف Undo](../undo-transactions/active-transactions.sql)
- [پیشرفت Fast-start Rollback](../undo-transactions/fast-start-rollback-progress.sql)

## رخداد کندی

دو برداشت از انتظارها و Time Model بگیرید. وقتی الگوی انتظار یا CPU مشخص شد، SQL و پلن Child Cursor را بررسی کنید. برای بازهٔ تاریخی در صورت داشتن مجوز از ASH یا AWR استفاده کنید.

- [مجموع انتظارهای نمونه](../waits-performance/instance-wait-totals.sql)
- [مجموع DB Time و CPU](../waits-performance/instance-time-model.sql)
- [پلن اجرای Child Cursor کش‌شده](../sql-plans/cached-execution-plan.sql)

## هشدار ظرفیت یا FRA

کانتینر یا مقصد درگیر را مشخص کنید. تخصیص و Extentهای آزاد یا سهمیهٔ FRA و نوع فایل‌ها را بررسی کنید. قبل از تأیید نگهداری، سیاست پشتیبان‌گیری و وضعیت Apply را مرور کنید.

- [مصرف و ظرفیت مؤثر Tablespace](../storage-space/tablespace-usage.sql)
- [فضای تخصیص‌یافته و آزاد فایل داده](../storage-space/datafile-free-space.sql)
- [ظرفیت Fast Recovery Area](../redo-backup-recovery/recovery-area-usage.sql)
- [مصرف FRA بر اساس نوع فایل](../redo-backup-recovery/recovery-area-by-file-type.sql)

## تأخیر Standby یا شکاف آرشیو

نقش دیتابیس را تأیید کنید، Lag و زمان مبدأ آن را ببینید و شکاف فعلی آرشیو را بررسی کنید. پیش از اجرای دستورالعمل بازیابی محیط، شمارهٔ Thread و Sequence را ثبت کنید.

- [نقش دیتابیس و وضعیت حفاظت](../rac-data-guard-asm/data-guard-database-role.sql)
- [تأخیر Transport و Apply در Data Guard](../rac-data-guard-asm/standby-transport-apply-lag.sql)
- [شکاف فعلی آرشیو در Standby](../rac-data-guard-asm/standby-archive-gap.sql)

## انتشار تغییرات اسکیما

پیش و پس از تغییر، آبجکت‌های نامعتبر، تعریف آبجکت، فهرست ایندکس‌ها و اجراهای مرتبط Scheduler را ثبت کنید.

- [آبجکت‌های نامعتبر یک اسکیما](../schema-security-jobs/invalid-objects-by-owner.sql)
- [استخراج DDL یک آبجکت](../schema-security-jobs/object-ddl.sql)
- [فهرست ایندکس‌های یک جدول](../schema-security-jobs/table-index-inventory.sql)
- [اجراهای اخیر Job در Scheduler](../schema-security-jobs/scheduler-job-run-history.sql)
