-- ==========================================================
-- Airbnb Clone Database
-- Query 1: Retrieve all bookings and the respective users
-- using an INNER JOIN
-- ==========================================================
-- Purpose:
--   This query returns all bookings together with the user 
--   who made each booking. Only bookings that are associated
--   with a valid user will be included in the result.
--
-- Learning Outcome:
--   Demonstrates the use of INNER JOIN to combine data from 
--   related tables using a shared key (user_id).
-- ==========================================================

SELECT 
    b.booking_id,        -- Unique identifier for the booking
    b.property_id,       -- Property being booked
    b.start_date,        -- Booking start date
    b.end_date,          -- Booking end date
    u.user_id,           -- Unique identifier for the user
    u.first_name,        -- User's first name
    u.last_name,         -- User's last name
    u.email              -- User's email address
FROM Booking b
INNER JOIN User u
    ON b.user_id = u.user_id;

User table

| user\_id | first\_name | last\_name | email                                         |
| -------- | ----------- | ---------- | --------------------------------------------- |
| u1       | Alice       | Johnson    | [alice@example.com](mailto:alice@example.com) |
| u2       | Bob         | Smith      | [bob@example.com](mailto:bob@example.com)     |
| u3       | Carol       | Davis      | [carol@example.com](mailto:carol@example.com) |

  Booking table

| booking\_id | property\_id | start\_date | end\_date  | user\_id |
| ----------- | ------------ | ----------- | ---------- | -------- |
| b1          | p1           | 2025-09-10  | 2025-09-15 | u1       |
| b2          | p3           | 2025-09-12  | 2025-09-18 | u2       |
| b3          | p2           | 2025-09-20  | 2025-09-25 | u3       |


  After running the query
  
| booking\_id | property\_id | start\_date | end\_date  | user\_id | first\_name | last\_name | email                                         |
| ----------- | ------------ | ----------- | ---------- | -------- | ----------- | ---------- | --------------------------------------------- |
| b1          | p1           | 2025-09-10  | 2025-09-15 | u1       | Alice       | Johnson    | [alice@example.com](mailto:alice@example.com) |
| b2          | p3           | 2025-09-12  | 2025-09-18 | u2       | Bob         | Smith      | [bob@example.com](mailto:bob@example.com)     |
| b3          | p2           | 2025-09-20  | 2025-09-25 | u3       | Carol       | Davis      | [carol@example.com](mailto:carol@example.com) |




