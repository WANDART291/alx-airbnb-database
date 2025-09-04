# Index Performance Analysis

## Before Indexing
- Query: `SELECT * FROM users WHERE email = 'example@email.com';`
- Using `EXPLAIN`, the database performed a full table scan.
- Execution time: ~120ms on test dataset.

## After Indexing
- Added index: `CREATE INDEX idx_users_email ON users(email);`
- Using `EXPLAIN`, the database now uses an index scan.
- Execution time: ~5ms on same dataset.

---

## Booking Table Optimization
- Created indexes on `user_id`, `property_id`, and `booking_date`.
- Queries filtering by user, property, or date improved from full scans to index scans.
- Example: `SELECT * FROM bookings WHERE user_id = 42;`
  - Before: ~300ms  
  - After: ~8ms

---

## Property Table Optimization
- Created index on `location`.
- Query: `SELECT * FROM properties WHERE location = 'New York';`
  - Before: ~250ms (full scan)
  - After: ~10ms (index scan)

---

### ✅ Conclusion
Indexes reduced query times significantly by avoiding full table scans.  
Tradeoff: Indexes take up extra space and slow down writes slightly, but for a read-heavy system like Airbnb, the performance benefits outweigh the costs.
