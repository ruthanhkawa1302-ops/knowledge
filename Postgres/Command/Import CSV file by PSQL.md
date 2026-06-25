# 1 Create table for that csv file
CREATE TABLE overseas_trade_indexes (
    series_reference VARCHAR(50),
    period NUMERIC(10,2),
    data_value NUMERIC(20,4),
    status VARCHAR(20),
    units VARCHAR(50),
    magntude INTEGER,
    subject TEXT,
    "group" TEXT,
    series_title_1 TEXT,
    series_title_2 TEXT,
    series_title_3 TEXT,
    series_title_4 TEXT,
    series_title_5 TEXT
);


# 2 Use copy to import 
\copy overseas_trade_indexes FROM 'D:\\Database\\Data\\overseas-trade-indexes-march-2026-quarter-provisional.csv' CSV HEADER;