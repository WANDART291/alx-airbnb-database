-- Before adding index: Check performance on users.email
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'example@email.com';

-- Create an index on email for fast user lookups
CREATE INDEX idx_users_email ON users(email);

-- After adding index: Check performance again
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'example@email.com';



-- Before adding index: Check performance on bookings.user_id
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 42;

-- Create index
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- After adding index
EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 42;
