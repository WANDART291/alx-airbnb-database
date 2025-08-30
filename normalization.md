# Database Normalization - Airbnb Clone

## Objective
Apply normalization principles to ensure the database is in the third normal form (3NF).

---

## 1. First Normal Form (1NF)
**Rule**: Each table must have a primary key, and all fields must contain atomic values (no repeating groups).

- **User Table**  
  - `user_id` is the primary key.  
  - Attributes such as `first_name`, `last_name`, and `email` are atomic.  

- **Property Table**  
  - `property_id` is the primary key.  
  - Attributes such as `name`, `description`, `location`, and `pricepernight` are atomic.  

- **Booking Table**  
  - `booking_id` is the primary key.  
  - Attributes such as `start_date`, `end_date`, `total_price`, and `status` are atomic.  

✅ At this stage, the schema avoids repeating groups and ensures each attribute stores one value.

---

## 2. Second Normal Form (2NF)
**Rule**: All non-key attributes must depend on the whole primary key (no partial dependency).  
This is most relevant in tables with composite primary keys (but here we use single-column primary keys).  

- **Booking Table**  
  - `total_price` depends only on the booking, not partially on `property_id` or `user_id`.  

- **Payment Table**  
  - `amount` and `payment_method` depend on the full `payment_id`, not partially on `booking_id`.  

✅ All non-key attributes depend entirely on the primary key, so 2NF is satisfied.

---

## 3. Third Normal Form (3NF)
**Rule**: Remove transitive dependencies (non-key attributes should not depend on other non-key attributes).  

- **Payment** separated from **Booking**  
  - Instead of storing payment details (`amount`, `payment_method`) in `Booking`, a separate `Payment` table was created, linked by `booking_id`.  

- **Review** separated from **Property**  
  - Instead of storing ratings and comments in the `Property` table, they are stored in a separate `Review` table, linked by `property_id` and `user_id`.  

- **Message** separated from **User**  
  - Instead of mixing messages with user data, a `Message` table was created with `sender_id` and `recipient_id` as foreign keys to the `User` table.  

✅ After these adjustments, there are no transitive dependencies. Each non-key attribute depends only on the primary key of its table.

---

## ✅ Conclusion
The Airbnb Clone database schema has been normalized to **Third Normal Form (3NF)**:  
- **1NF**: Atomic values ensured.  
- **2NF**: No partial dependencies.  
- **3NF**: Transitive dependencies removed by separating Payments, Reviews, and Messages.  

This design minimizes redundancy, preserves data integrity, and supports scalability.


