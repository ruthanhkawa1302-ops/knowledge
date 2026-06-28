# Check size của table
SELECT pg_size_pretty(
    pg_total_relation_size('overseas_trade_indexes')
);

