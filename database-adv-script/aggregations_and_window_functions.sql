-- Query: Find the total number of bookings made by each user
-- Using COUNT() with GROUP BY to aggregate bookings per user

SELECT 
    u.user_id,
    u.full_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b
    ON u.user_id = b.user_id
GROUP BY 
    u.user_id,
    u.full_name,
    u.email
ORDER BY total_bookings DESC;

-- Leaderboard of properties by total bookings
-- Step 1: aggregate bookings per property
-- Step 2: apply window functions to rank

WITH property_bookings AS (
    SELECT
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b
        ON b.property_id = p.property_id
    GROUP BY
        p.property_id,
        p.name
)
SELECT
    property_id,
    property_name,
    total_bookings,
    RANK()       OVER (ORDER BY total_bookings DESC)                         AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC, property_name ASC)      AS booking_row_number
FROM property_bookings
ORDER BY booking_rank, property_name;



