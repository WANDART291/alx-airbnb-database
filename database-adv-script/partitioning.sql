-- ============================================
-- Step 1: Rename the original bookings table
-- ============================================
ALTER TABLE bookings RENAME TO bookings_old;

-- ============================================
-- Step 2: Create a new partitioned bookings table
-- ============================================
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    amount DECIMAL(10,2)
) PARTITION BY RANGE (start_date);

-- ============================================
-- Step 3: Create partitions (example by year)
-- ============================================
CREATE TABLE bookings_2022 PARTITION OF bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- ============================================
-- Step 4: (Optional) Insert existing data into partitions
-- ============================================
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, amount)
SELECT booking_id, user_id, property_id, start_date, end_date, amount
FROM bookings_old;

-- ============================================
-- Step 5: Run performance test queries
-- ============================================

-- Query BEFORE partitioning (on bookings_old)
EXPLAIN ANALYZE
SELECT * FROM bookings_old
WHERE start_date BETWEEN '2023-01-01' AND '2023-06-30';

-- Query AFTER partitioning (on bookings)
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-06-30';
