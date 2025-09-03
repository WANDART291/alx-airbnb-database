-- File: query_performance_analysis.sql
-- Purpose: Measure query performance before and after adding indexes
-- Author: [Your Name]
-- Date: [Insert Date]

-- ==============================
-- 1. Example: Total bookings per user before adding indexes
-- ==============================
EXPLAIN ANALYZE
SELECT 
    u.user_id,
    u.full_name,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_bookings DESC;

-- ==============================
-- 2. Example: Properties leaderboard before adding indexes
-- ==============================
EXPLAIN ANALYZE
WITH property_bookings AS (
    SELECT
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b
        ON b.property_id = p.property_id
    GROUP BY p.property_id, p.name
)
SELECT
    property_id,
    property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM property_bookings
ORDER BY booking_rank;

-- ==============================
-- 3. After creating indexes (from database_index.sql)
-- ==============================
-- Run the same queries again to measure improvements

EXPLAIN ANALYZE
SELECT 
    u.user_id,
    u.full_name,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_bookings DESC;

EXPLAIN ANALYZE
WITH property_bookings AS (
    SELECT
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b
        ON b.property_id = p.property_id
    GROUP BY p.property_id, p.name
)
SELECT
    property_id,
    property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM property_bookings
ORDER BY booking_rank;

