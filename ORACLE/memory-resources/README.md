# حافظه و منابع

[کتابخانهٔ کوئری‌های DBA اوراکل](../README.md)

مصرف فعلی، بیشینهٔ ثبت‌شده و برآورد را از هم جدا کنید و مشخص کنید هر اندازه‌گیری مربوط به نشست است یا نمونه.

## خلاصهٔ حافظهٔ PGA به تفکیک نمونه

[pga-memory-summary.sql](pga-memory-summary.sql) · تشخیص فقط‌خواندنی

تخصیص فعلی و بیشینهٔ PGA، هدف تنظیم‌شده و شمار تخصیص مازاد را مقایسه کنید. واحد هر مقدار را از ستون `unit` بخوانید.

دسترسی به `GV$PGASTAT`.

## Workareaهای فعال SQL

[active-pga-workareas.sql](active-pga-workareas.sql) · تشخیص فقط‌خواندنی

عملیاتی را پیدا کنید که PGA مصرف می‌کنند یا به TEMP سرریز می‌شوند. افزایش `number_passes` به معنی گذرهای اضافه روی داده برای Workarea مشاهده‌شده است.

دسترسی به `V$SQL_WORKAREA_ACTIVE`.

## حد منابع و بیشینهٔ ثبت‌شده

[resource-limits.sql](resource-limits.sql) · تشخیص فقط‌خواندنی

مصرف فعلی و بیشینهٔ نشست، پردازه و تراکنش را بین نمونه‌ها مقایسه کنید. مقدار حد ممکن است متنی باشد، از جمله `UNLIMITED`.

دسترسی به `GV$RESOURCE_LIMIT`.

## اندازهٔ جزءهای پویای SGA

[sga-components.sql](sga-components.sql) · تشخیص فقط‌خواندنی

اندازهٔ فعلی، کمینه و بیشینهٔ مشاهده‌شدهٔ هر جزء را مقایسه کنید. شمار تغییر اندازه و زمان آخرین تغییر به تفسیر تخصیص کمک می‌کند.

دسترسی به `V$SGA_DYNAMIC_COMPONENTS`.

## نشست‌ها بر اساس مصرف فعلی PGA

[largest-session-pga.sql](largest-session-pga.sql) · تشخیص فقط‌خواندنی

مصرف فعلی و بیشینهٔ PGA را برای هر نشست در نمونهٔ فعلی مقایسه کنید. دامنهٔ آمار نشست با شاخص PGA نمونه فرق دارد.

دسترسی به `V$SESSTAT`، `V$STATNAME`، `V$SESSION`.

## مراجع

- [مرجع Oracle Database 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/index.html)
