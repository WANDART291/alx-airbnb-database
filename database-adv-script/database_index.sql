-- File: database_index.sql
-- Purpose: Create indexes on high-usage columns for performance optimization
-- Author: [Your Name]
-- Date: [Insert Date]

-- ==============================
-- Indexes for User table
-- ==============================
CREATE INDEX idx_user_email
    ON User(email);

-- ==============================
-- Indexes for Booking table
-- ==============================
CREATE INDEX idx_booking_user_id
    ON Booking(user_id);

CREATE INDEX idx_booking_property_id
    ON Booking(property_id);

CREATE INDEX idx_booking_created_at
    ON Booking(created_at);

-- ==============================
-- Indexes for Property table
-- ==============================
CREATE INDEX idx_property_location
    ON Property(location);

