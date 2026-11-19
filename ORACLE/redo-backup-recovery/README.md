# Redo، پشتیبان‌گیری و بازیابی

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

حجم آرشیو، مصرف FRA و وضعیت RMAN را جداگانه بررسی کنید. موفقیت Job به‌تنهایی بازیابی‌پذیری را تأیید نمی‌کند.

## گروه‌ها و اعضای Online Redo

[online-redo-groups.sql](online-redo-groups.sql) · تشخیص فقط‌خواندنی

وضعیت، اندازه و محل اعضای Online Redo را به تفکیک Thread بررسی کنید. هر گروه می‌تواند چند عضو و چند ردیف خروجی داشته باشد.

دسترسی به `V$LOG`، `V$LOGFILE`.

## سابقهٔ روزانهٔ Log Switch

[daily-log-switches.sql](daily-log-switches.sql) · تشخیص فقط‌خواندنی

شمار Sequenceهای Redo را به تفکیک روز و Thread بخوانید. ظرفیت تاریخچهٔ Control File محدود است و کوئری فقط Incarnation فعلی را پوشش می‌دهد.

دسترسی به `V$LOG_HISTORY`، `V$DATABASE`.

متغیرهای Bind

- `:p_days` `NUMBER` · بازهٔ مرور مثبت بر حسب روز.

```sql
VARIABLE p_days NUMBER
EXEC :p_days := 7
@redo-backup-recovery/daily-log-switches.sql
```

## حجم روزانهٔ Archived Redo برای یک مقصد

[archived-redo-volume.sql](archived-redo-volume.sql) · تشخیص فقط‌خواندنی

حجم آرشیو را به تفکیک روز و Thread برای یک مقصد برآورد کنید. رکوردهای تکراری پیش از جمع حجم بر اساس Incarnation، Thread و Sequence گروه‌بندی می‌شوند.

دسترسی به `V$ARCHIVED_LOG`.

متغیرهای Bind

- `:p_days` `NUMBER` · بازهٔ مرور مثبت بر حسب روز.
- `:p_dest_id` `NUMBER` · شناسهٔ مقصد آرشیو از محیط خودتان.

```sql
VARIABLE p_days NUMBER
EXEC :p_days := 7
VARIABLE p_dest_id NUMBER
EXEC :p_dest_id := 1
@redo-backup-recovery/archived-redo-volume.sql
```

## ظرفیت Fast Recovery Area

[recovery-area-usage.sql](recovery-area-usage.sql) · تشخیص فقط‌خواندنی

حد FRA، فضای مصرف‌شده و بایت‌های قابل‌بازیابی را مقایسه کنید. فایل‌های محل‌های قبلی هم می‌توانند در مصرف گزارش‌شده حساب شوند.

دسترسی به `V$RECOVERY_FILE_DEST`.

## مصرف FRA بر اساس نوع فایل

[recovery-area-by-file-type.sql](recovery-area-by-file-type.sql) · تشخیص فقط‌خواندنی

نوع فایل‌هایی را که سهمیهٔ FRA را مصرف می‌کنند و فضای قابل‌بازیابی دارند پیدا کنید. این گزارش را همراه کوئری ظرفیت FRA بخوانید.

دسترسی به `V$RECOVERY_AREA_USAGE`.

## Jobهای اخیر پشتیبان‌گیری RMAN

[rman-backup-job-history.sql](rman-backup-job-history.sql) · تشخیص فقط‌خواندنی

وضعیت Job، مدت، نوع ورودی و حجم خروجی را از Control File مقصد بخوانید. علت هشدارها و خطاها را در گزارش Job بررسی کنید.

دسترسی به `V$RMAN_BACKUP_JOB_DETAILS`.

متغیرهای Bind

- `:p_days` `NUMBER` · بازهٔ مرور مثبت بر حسب روز.

```sql
VARIABLE p_days NUMBER
EXEC :p_days := 7
@redo-backup-recovery/rman-backup-job-history.sql
```

## شاخص‌های پیشرفت بازیابی

[media-recovery-progress.sql](media-recovery-progress.sql) · تشخیص فقط‌خواندنی

شاخص‌های بازیابی گزارش‌شده روی نمونهٔ فعلی را بخوانید. ردیف‌ها واحدهای مختلفی دارند و ممکن است زمان یا نقاط عطف عملیات را نشان دهند.

دسترسی به `V$RECOVERY_PROGRESS`.

## بلاک‌های خراب ثبت‌شده

[database-block-corruption.sql](database-block-corruption.sql) · تشخیص فقط‌خواندنی

بازه‌های خرابی ثبت‌شده در Control File را ببینید. خروجی خالی یعنی در حال حاضر بازه‌ای ثبت نشده است. برای ارزیابی سلامت فیزیکی و منطقی از Job اعتبارسنجی استفاده کنید.

دسترسی به `V$DATABASE_BLOCK_CORRUPTION`.

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [راهنمای پشتیبان‌گیری و بازیابی](https://docs.oracle.com/en/database/oracle/oracle-database/19/bradv/index.html)
