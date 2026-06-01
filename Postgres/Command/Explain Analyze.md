# Find disk pages and rows

'SELECT relpages, reltuples FROM pg_class WHERE relname = 'tenk1';'

Kết quả :
```
 relpages | reltuples
----------+-----------
        1 |         1
(1 row)

```
