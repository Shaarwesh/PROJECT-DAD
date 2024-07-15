# BITP 3123 Group Project

## Group Members
- Misya Nurbalqis binti Shaiful Azli (B032010019)
- Shaarweshwary A/P Saravanan (B032320091)
- Ahmed Abdulkareem Abdullah Mohammed Alsenwi (B032130091)

## Project Overview

This project involves the development of three applications that interact with a single database. The applications are designed to simulate a bookstore operation with book purchasing/renting, delivery, and return functionalities.

## Development Environment

- *IDE*: Eclipse
- *Database Management Tool*: phpMyAdmin

## Applications Involved

1. *Bookstore Application*
   - Responsible for handling book purchases and rentals.
   - Allows users to browse available books, add books to a checkout list, and calculate the total cost of books selected for purchase or rent.

2. *Courier Application*
   - Manages the delivery of books to customers.
   - Couriers can view assigned delivery tasks, update the status of deliveries, and notify users about the delivery status.

3. *Book Return Application*
   - Handles the return of rented books.
   - Updates the status of books from 'borrowed' to 'returned' in the database.

## Architecture/Layer Diagram

### Bookstore Application
![bookstoredraw drawio](https://github.com/user-attachments/assets/d9438bd7-b41b-42a9-9e99-cdec847f97cf)

### Courier Application
![courier drawio](https://github.com/user-attachments/assets/ff93c5fb-dd14-45c7-b742-8c32f75a6b2f)


### Book Return Application
![bookreturn drawio](https://github.com/user-attachments/assets/47474fae-eb36-484b-a832-8dd68b47f8a8)


### Middleware
![image](https://github.com/user-attachments/assets/e931526e-3882-49d9-9ef3-c5013b6c2796)

- RESTful API Endpoints:
  - /books: Manages CRUD operations for books.
  - /transactions: Manages transaction history and status updates.
  - /couriers: Manages courier information and task assignments.

## Functions/Features in the Middleware

- *Bookstore Application*:
  - Display data from the database.
  - Manage checkout lists (select, add, delete items).
  - Calculate total costs.

- *Courier Application*:
  - View assigned delivery tasks.
  - Update delivery statuses.
  - Notify users about delivery updates.

- *Book Return Application*:
  - Update book status from 'borrowed' to 'returned'.
  - Manage transaction records.

## Database

Our project uses a single database named "projectdad" that is accessed by all three applications.

### Tables

1. *Book*
   - book_id: Unique identifier for each book.
   - title: Title of the book.
   - author: Author of the book.
   - status: Current status of the book (e.g., available, rented).
   - price: Price of the book.

2. *Couriers*
   - courier_id: Unique identifier for each courier.
   - name: Name of the courier.
   - contact: Contact information for the courier.

3. *Transactions*
   - tr_id: Unique identifier for each transaction.
   - book_id: ID of the book involved in the transaction.
   - user_id: ID of the user who made the transaction.
   - tr_type: Type of transaction (e.g., purchase, rental, return).
   - tr_date: Date of the transaction.
   - dlvr_status: Delivery status of the transaction.
   - courier_id: ID of the courier assigned to the transaction.
