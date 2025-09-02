# Airbnb Clone Database – SQL Joins

This section demonstrates advanced SQL join queries using the **Airbnb Clone Database** schema.  
The goal is to master `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN` by applying them to practical Airbnb use cases.  

---

## 1. INNER JOIN – Bookings with Their Users

```sql
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN User u
    ON b.user_id = u.user_id;

| booking\_id | property\_id | start\_date | end\_date  | user\_id | first\_name | last\_name | email                                         |
| ----------- | ------------ | ----------- | ---------- | -------- | ----------- | ---------- | --------------------------------------------- |
| b1          | p1           | 2025-09-10  | 2025-09-15 | u1       | Alice       | Johnson    | [alice@example.com](mailto:alice@example.com) |
| b2          | p3           | 2025-09-12  | 2025-09-18 | u2       | Bob         | Smith      | [bob@example.com](mailto:bob@example.com)     |

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

| property\_id | property\_name | location  | review\_id | rating | comment         | review\_date |
| ------------ | -------------- | --------- | ---------- | ------ | --------------- | ------------ |
| p1           | Cozy Loft      | Cape Town | r1         | 5      | Excellent stay! | 2025-08-12   |
| p2           | Beach House    | Durban    | NULL       | NULL   | NULL            | NULL         |

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

| user\_id | first\_name | last\_name | email                                         | booking\_id | property\_id | start\_date | end\_date  |
| -------- | ----------- | ---------- | --------------------------------------------- | ----------- | ------------ | ----------- | ---------- |
| u1       | Alice       | Johnson    | [alice@example.com](mailto:alice@example.com) | b1          | p1           | 2025-09-10  | 2025-09-15 |
| u2       | Bob         | Smith      | [bob@example.com](mailto:bob@example.com)     | NULL        | NULL         | NULL        | NULL       |
| NULL     | NULL        | NULL       | NULL                                          | b3          | p5           | 2025-09-20  | 2025-09-25 |

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
LEFT JOIN Booking b
    ON u.user_id = b.user_id

UNION

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
RIGHT JOIN Booking b
    ON u.user_id = b.user_id;



