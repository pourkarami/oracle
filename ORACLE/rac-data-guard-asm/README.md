# RAC، Data Guard و ASM

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

قبل از تفسیر Lag، شکاف آرشیو یا ظرفیت Disk Group، نقش دیتابیس و نمونهٔ فعلی را بررسی کنید.

## وضعیت و Startup نمونه‌های RAC

[rac-instance-status.sql](rac-instance-status.sql) · تشخیص فقط‌خواندنی

نمونه‌های قابل‌مشاهده، زمان Startup، وضعیت دیتابیس و وضعیت Login را ببینید و با پیکربندی مورد انتظار کلاستر تطبیق دهید.

دسترسی به `GV$INSTANCE`.

## نقش دیتابیس و وضعیت حفاظت

[data-guard-database-role.sql](data-guard-database-role.sql) · تشخیص فقط‌خواندنی

روی هر دیتابیس اجرا کنید تا قبل از تفسیر داده‌های Data Guard، نقش، Open Mode، حفاظت و وضعیت Switchover مشخص باشد.

دسترسی به `V$DATABASE`.

## تأخیر Transport و Apply در Data Guard

[standby-transport-apply-lag.sql](standby-transport-apply-lag.sql) · تشخیص فقط‌خواندنی

روی Standby اجرا کنید. علاوه بر Lag، زمان `datum_time` را ببینید. ثابت ماندن آن می‌تواند نشانهٔ نرسیدن دادهٔ تازه باشد.

دسترسی به `V$DATAGUARD_STATS`.

## شکاف فعلی آرشیو در Standby

[standby-archive-gap.sql](standby-archive-gap.sql) · تشخیص فقط‌خواندنی

روی Physical Standby اجرا کنید تا شکاف فعلی مسدودکنندهٔ بازیابی را به تفکیک Thread پیدا کنید. بعد از رفع شکاف دوباره اجرا کنید.

دسترسی به `V$ARCHIVE_GAP`.

## ظرفیت Disk Group در ASM

[asm-diskgroup-capacity.sql](asm-diskgroup-capacity.sql) · تشخیص فقط‌خواندنی

فضای خام آزاد و `usable_file_mb` را کنار هم ببینید. در گروه‌هایی که این مقدار کاربرد دارد، Redundancy و ذخیرهٔ لازم برای بازگرداندن آن لحاظ می‌شود.

دسترسی به `V$ASM_DISKGROUP_STAT`.

## حالت باز یا محدود PDBها

[pdb-open-modes.sql](pdb-open-modes.sql) · تشخیص فقط‌خواندنی

در Root دیتابیس CDB اجرا کنید تا حالت باز بودن هر PDB برای هر نمونهٔ RAC مشخص شود. حالت Restricted کاربران مجاز به اتصال را محدود می‌کند.

دسترسی به `GV$PDBS`.

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
- [ویوهای Data Guard](https://docs.oracle.com/en/database/oracle/oracle-database/19/sbydb/oracle-data-guard-in-oracle-database-views.html)
- [راهنمای مدیریت ASM](https://docs.oracle.com/en/database/oracle/oracle-database/19/ostmg/index.html)
