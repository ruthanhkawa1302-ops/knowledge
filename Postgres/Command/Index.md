# Check index in 1 table
Using \d in psql : psql > \d users;

Query in pg_indexes : SELECT * FROM pg_indexes WHERE tablename = 'users';

# Check index size
SELECT
    indexrelname AS index_name,
    pg_size_pretty(pg_relation_size(indexrelid)) AS size
FROM pg_stat_user_indexes
WHERE relname = 'users';

# Check the requently of using index in 1 table
SELECT
    indexrelname,
    idx_scan
FROM pg_stat_user_indexes
WHERE relname = 'users';

if idx_scan is high > Using a lot

