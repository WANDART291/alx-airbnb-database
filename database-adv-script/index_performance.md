-- File: high_usage_columns.sql
-- Purpose: Identify high-usage columns in User, Booking, and Property tables
-- High-usage columns are typically used in WHERE, JOIN, and ORDER BY clauses
-- Author: [Your Name]
-- Date: [Insert Date]

SELECT 'User' AS table_name, 'user_id' AS column_name, 'Primary key, used in JOINs with Booking table' AS usage_reason
UNION ALL
SELECT 'User', 'email', 'Frequently used in WHERE filters for user lookups'
UNION ALL
SELECT 'Booking', 'booking_id', 'Primary key, used in queries and ordering results'
UNION ALL
SELECT 'Booking', 'user_id', 'Foreign key, used in JOINs with User table'
UNION ALL
SELECT 'Booking', 'property_id', 'Foreign key, used in JOINs with Property table'
UNION ALL
SELECT 'Booking', 'created_at', 'Frequently used in WHERE and ORDER BY for date-based queries'
UNION ALL
SELECT 'Property', 'property_id', 'Primary key, used in JOINs with Booking and Review tables'
UNION ALL
SELECT 'Property', 'location', 'Frequently used in WHERE filters for property searches';
