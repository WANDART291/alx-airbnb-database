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

-- Query: Rank properties based on the total number of bookings
-- Using RANK() window function to handle ties in booking counts

SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b
    ON p.property_id = b.property_id
GROUP BY 
    p.property_id,
    p.name
ORDER BY booking_rank, property_name;


