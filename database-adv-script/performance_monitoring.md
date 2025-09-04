# Database Performance Monitoring and Refinement

## Step 1: Monitoring Queries
We used `EXPLAIN ANALYZE` to measure how queries were executed and where time was being spent.

### Example Query 1
```sql
EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';
Observation:
The execution plan showed a full table scan, which was slow because the Bookings table is large.
```

### Example Query 2
```
EXPLAIN ANALYZE
SELECT b.id, u.name, p.name, pay.amount
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
JOIN Payments pay ON b.id = pay.booking_id;
```

- Observation:
Nested loop joins were used, which increased execution time significantly.

## Step 2: Identifying Bottlenecks
- Full table scans on Bookings due to no index on start_date.

- Expensive joins between Bookings, Users, Properties, and Payments.

- Overhead from selecting all columns with SELECT *.

## Step 3: Schema / Index Adjustments
We applied the following optimizations:

```sql
-- Index to optimize date filters
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);

-- Indexes to optimize joins
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_payments_booking_id ON Payments(booking_id);
``` 

- We also refactored queries to select only necessary columns.

## Step 4: Re-Testing Queries
After Adding Index
```sql
EXPLAIN ANALYZE
SELECT id, user_id, property_id
FROM Bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';
```

- Improvement:

The query used the idx_bookings_start_date index, avoiding a full scan and executing faster.

## After Join Optimization
```sql
EXPLAIN ANALYZE
SELECT b.id, u.name AS user_name, p.name AS property_name, pay.amount
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Properties p ON b.property_id = p.id
JOIN Payments pay ON b.id = pay.booking_id;
```

- Improvement:

Indexes on join keys (user_id, property_id, booking_id) were used, reducing join cost.

## Step 5: Summary of Improvements
- Before: Queries relied on full scans and nested loops.

- After: Indexes optimized filtering and joins, cutting execution time.

- Lesson: Regular monitoring with EXPLAIN ANALYZE quickly highlights bottlenecks. Indexing and schema refinement are key for long-term database performance.
