-- =====================================
-- Airbnb Clone Database Sample Data
-- =====================================

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('u1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
('u2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '2345678901', 'host'),
('u3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw_3', '3456789012', 'guest'),
('u4', 'Diana', 'Williams', 'diana@example.com', 'hashed_pw_4', '4567890123', 'host');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
('p1', 'u2', 'Cozy Apartment in Cape Town', 'A beautiful apartment near the beach', 'Cape Town, South Africa', 750.00),
('p2', 'u4', 'Modern Loft in Johannesburg', 'Spacious loft with city views', 'Johannesburg, South Africa', 1200.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('b1', 'p1', 'u1', '2025-09-05', '2025-09-10', 3750.00, 'confirmed'),
('b2', 'p2', 'u3', '2025-10-01', '2025-10-05', 4800.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('pay1', 'b1', 3750.00, 'credit_card'),
('pay2', 'b2', 4800.00, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('r1', 'p1', 'u1', 5, 'Amazing place! Very clean and close to the beach.'),
('r2', 'p2', 'u3', 4, 'Beautiful loft but a bit noisy at night.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('m1', 'u1', 'u2', 'Hi Bob, is your Cape Town apartment available next month?'),
('m2', 'u2', 'u1', 'Yes Alice, it’s available. Would you like to book?');

