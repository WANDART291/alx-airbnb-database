-- 1. INNER JOIN: Bookings with respective users
SELECT b.booking_id, b.property_id, b.start_date, b.end_date, u.user_id, u.name
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

-- 2. LEFT JOIN: Properties with their reviews (including properties with no reviews)
SELECT p.property_id, p.name AS property_name, r.review_id, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;
ORDER BY p.id;

-- 3. FULL OUTER JOIN: Users and bookings (even if no match)
SELECT u.user_id, u.name, b.booking_id, b.property_id
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
