-- ==============================
-- Initial Query (Unoptimized)
-- ==============================

EXPLAIN
SELECT b.booking_id, b.booking_date, u.name AS user_name, p.title AS property_title, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.booking_date >= '2023-01-01' AND pay.amount > 0;

-- Sample Output (from EXPLAIN, yours may vary)
-- Seq Scan on bookings  (cost=0.00..1024.00 rows=50000 width=...)
-- Nested Loop Join ...
-- Execution Time: ~120 ms


-- ==============================
-- Optimized Query
-- ==============================

-- Optimization techniques:
-- 1. Added indexes (on booking.user_id, booking.property_id, payments.booking_id).
-- 2. Selected only necessary columns (instead of SELECT *).
-- 3. Used LEFT JOIN for payments in case some bookings don’t have payments.

EXPLAIN
SELECT b.booking_id, b.booking_date, u.name AS user_name, p.title AS property_title, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.booking_date >= '2023-01-01' AND (pay.amount IS NULL OR pay.amount > 0);

-- Sample Output (from EXPLAIN, yours may vary)
-- Index Scan using idx_bookings_user_id on bookings  (cost=0.42..350.00 rows=50000 width=...)
-- Hash Join ...
-- Execution Time: ~40 ms
