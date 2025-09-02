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


Before running the query
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


    # Airbnb Clone Database – LEFT JOIN Query

## 🔹 Query 2: Retrieve Properties and Their Reviews

This query demonstrates how to use a **LEFT JOIN** to combine the `Property` and `Review` tables.  
It returns all properties and their reviews. If a property has no review, it will still appear in the results, but the review fields will be `NULL`.

📌 **SQL Query:**
```sql
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM Property p
LEFT JOIN Review r
    ON p.property_id = r.property_id;

SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM Property p
LEFT JOIN Review r
    ON p.property_id = r.property_id;


before running the query
    Property Table
| property\_id | name        | location     |
| ------------ | ----------- | ------------ |
| p1           | Cozy Loft   | Cape Town    |
| p2           | Beach House | Durban       |
| p3           | City Studio | Johannesburg |

    Review table
| review\_id | property\_id | rating | comment         | created\_at |
| ---------- | ------------ | ------ | --------------- | ----------- |
| r1         | p1           | 5      | Excellent stay! | 2025-08-12  |
| r2         | p3           | 4      | Great location  | 2025-08-15  |

After running the query
| property\_id | property\_name | location     | review\_id | rating | comment         | review\_date |
| ------------ | -------------- | ------------ | ---------- | ------ | --------------- | ------------ |
| p1           | Cozy Loft      | Cape Town    | r1         | 5      | Excellent stay! | 2025-08-12   |
| p2           | Beach House    | Durban       | NULL       | NULL   | NULL            | NULL         |
| p3           | City Studio    | Johannesburg | r2         | 4      | Great location  | 2025-08-15   |

  
  

# Airbnb Clone Database – FULL OUTER JOIN Query

## 🔹 Query 3: Retrieve All Users and All Bookings

This query demonstrates how to use a **FULL OUTER JOIN** to combine the `User` and `Booking` tables.  
It returns all users and all bookings, even if:  
- A user has **no bookings**, or  
- A booking is **not linked to a user**.  

📌 **SQL Query:**
```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM User u
FULL OUTER JOIN Booking b
    ON u.user_id = b.user_id;

Before running the query
User table
| user\_id | first\_name | last\_name | email                                         |
| -------- | ----------- | ---------- | --------------------------------------------- |
| u1       | Alice       | Johnson    | [alice@example.com](mailto:alice@example.com) |
| u2       | Bob         | Smith      | [bob@example.com](mailto:bob@example.com)     |
| u3       | Carol       | Davis      | [carol@example.com](mailto:carol@example.com) |

Before running the query
Booking table
| booking\_id | property\_id | start\_date | end\_date  | user\_id |
| ----------- | ------------ | ----------- | ---------- | -------- |
| b1          | p1           | 2025-09-10  | 2025-09-15 | u1       |
| b2          | p3           | 2025-09-12  | 2025-09-18 | u2       |
| b3          | p5           | 2025-09-20  | 2025-09-25 | NULL     |

After running the query
| user\_id | first\_name | last\_name | email                                         | booking\_id | property\_id | start\_date | end\_date  |
| -------- | ----------- | ---------- | --------------------------------------------- | ----------- | ------------ | ----------- | ---------- |
| u1       | Alice       | Johnson    | [alice@example.com](mailto:alice@example.com) | b1          | p1           | 2025-09-10  | 2025-09-15 |
| u2       | Bob         | Smith      | [bob@example.com](mailto:bob@example.com)     | b2          | p3           | 2025-09-12  | 2025-09-18 |
| u3       | Carol       | Davis      | [carol@example.com](mailto:carol@example.com) | NULL        | NULL         | NULL        | NULL       |
| NULL     | NULL        | NULL       | NULL                                          | b3          | p5           | 2025-09-20  | 2025-09-25 |












