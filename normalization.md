# Database Normalization - Airbnb Clone

This document describes how the Airbnb Clone database schema was normalized to eliminate redundancy, maintain data integrity, and improve scalability.

---

## 1. First Normal Form (1NF)
**Rule**: Each table must have a primary key, and all fields must contain atomic values (no repeating groups).

- **User Table**  
  - `user_id` is the primary key.  
  - Each column holds a single value (e.g., one email, one role per user).  

- **Property Table**  
  - `property_id` is the primary key.  
  - Attributes like `name`, `description`, `price_per_night` are atomic.  

✅ Example: Instead of storing multiple phone numbers in one column, each user record has a single `phone_number`.

---

## 2. Second Normal Form (2NF)
**Rule**: All non-key attributes must depend on the whole primary key (no partial dependency).

- **Booking Table**  
  - `booking_id` is the primary key.  
  - Attributes `start_date`, `end_date`, `total_price`, and `status` depend entirely on `booking_id`.  

- **Payment Table**  
  - `payment_id` is the primary key.  
  - Attributes `amount`, `payment_date`, and `payment_method` depend only on `payment_id`.  

✅ Example: In `Booking`, `total_price` depends only on the unique booking, not partially on `property_id` or `user_id`.

---

## 3. Third Normal Form (3NF)
**Rule**: Remove transitive dependencies (non-key attributes should not depend on other non-key attributes).

- **Payment** was separated from **Booking**.  
  - Instead of storing `amount` and `payment_method` in `Booking`, these were moved to a `Payment` table, linked by `booking_id`.  

- **Review** was separated from **Property**.  
  - Instead of storing ratings and comments in `Property`, they are stored in `Review`, linked by `property_id` and `user_id`.  

✅ Example: If a user leaves multiple reviews for different properties, reviews are stored independently without duplicating property data.

---

## 4. Boyce-Codd Normal Form (BCNF)
**Rule**: Every determinant must be a candidate key.

- In **Message Table**, `message_id` uniquely determines `sender_id`, `recipient_id`, `message_body`, and `sent_at`.  
- In **Review Table**, `review_id` uniquely determines `rating` and `comment`.  

There are no anomalies caused by non-candidate keys determining other attributes.

---

## ✅ Conclusion
The Airbnb Clone database schema is normalized up to **3NF/BCNF**:
- **1NF**: All attributes are atomic.  
- **2NF**: All non-key fields depend on the full primary key.  
- **3NF**: Transitive dependencies removed (Payments, Reviews, Messages separated).  
- **BCNF**: All functional dependencies are based on candidate keys.  

This ensures minimal redundancy, strong data integrity, and efficient scalability for the project.

