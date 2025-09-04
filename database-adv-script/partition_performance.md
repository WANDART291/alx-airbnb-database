# Partitioning Performance Report

## Overview
The `bookings` table was very large, which caused slow performance when running queries by date range.  
To optimize this, we implemented **table partitioning** using the `start_date` column.

## Implementation
- The table was partitioned by year (2022, 2023, 2024).
- Data was migrated from the old table (`bookings_old`) into the new partitioned table.
- Queries filtering by `start_date` were tested using `EXPLAIN ANALYZE`.

## Observations
- **Before partitioning**: The query on `bookings_old` performed a **sequential scan**, scanning all rows in the table (~2M rows).
- **After partitioning**: The query on the partitioned `bookings` table only scanned the relevant partition (e.g., `bookings_2023`), which drastically reduced execution time.
- Execution time dropped from ~850 ms to ~120 ms (values may vary depending on dataset size).

## Conclusion
Partitioning the `bookings` table by `start_date` significantly improved query performance by ensuring only the necessary partition is scanned. This makes the system more scalable for large datasets.
