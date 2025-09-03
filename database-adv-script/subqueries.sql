-- Query: Find all properties where the average rating is greater than 4.0
-- Using a subquery on the Review table to calculate average ratings

SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    (
        SELECT AVG(r.rating)
        FROM Review r
        WHERE r.property_id = p.property_id
    ) AS average_rating
FROM Property p
WHERE (
        SELECT AVG(r.rating)
        FROM Review r
        WHERE r.property_id = p.property_id
      ) > 4.0
ORDER BY average_rating DESC;

-- Query: Find all users who have made more than 3 bookings
-- Using a correlated subquery to count each user's bookings

SELECT 
    u.user_id,
    u.full_name,
    u.email,
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) AS total_bookings
FROM User u
WHERE (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
      ) > 3
ORDER BY total_bookings DESC;

