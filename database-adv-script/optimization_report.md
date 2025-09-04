# Optimization Report 

## 1. Initial Query
The initial query retrieved bookings with user, property, and payment details using multiple joins:

```sql
SELECT b.booking_id, b.booking_date, u.name, p.title, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;
