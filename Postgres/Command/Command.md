# Check size của table
SELECT pg_size_pretty(
    pg_total_relation_size('overseas_trade_indexes')
);

# Backup / Restore

## Backup/Restore table

Backup : 
```
pg_dump -U postgres -d postgres -t employees -Fc -f employees.dump
```

Restore:
```
pg_restore -U postgres -d postgres employees.dump
```

Xem table nào đang được backup để liệt kê các object bên trong file backup custom format.
```
pg_restore -l employees.dump
```

## Backup / Restore Physical Database
Backup:
```
ALTER USER postgres REPLICATION;

# Add a line like this to pg_hba.conf
host replication all 127.0.0.1/32 trust

#Run the Backup Command
pg_basebackup -h localhost -D /path/to/backup/folder -F tar -z -P
```
Restore:
```
Stop the Database: Shut down the PostgreSQL server completely so no data changes happen during the process .
Move Existing Data: Move your current data directory to a temporary location to create space .
Empty the Data Folder: Delete all files and folders inside your main data directory .
Copy Backup Files: Copy the files from your physical backup dump back into the empty data directory .Set Permissions: Ensure the postgres operating system user owns these files and has the correct permissions .
Start the Database: Start the PostgreSQL service. The database will automatically read the logs and recover itself to a consistent stat
```

