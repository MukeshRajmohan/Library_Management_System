# Library Management System

## Overview

The Library Management System is a software solution designed to automate and streamline the management of library operations. It facilitates efficient handling of various resources such as books, magazines, e-books, and audiobooks, enhancing the experience for both library users and staff. The system aims to optimize resource management processes and improve accessibility.

## Scope

The project involves designing and implementing a **database management system** for a public library. The system enables:
- **Efficient management** of library materials, members, and staff.
- **Tracking** of borrowing transactions and overdue materials.
- **Reporting and analytics** for administrative use.

### Key Features
- **Cataloging of Materials:** Manage books, e-books, and audiobooks with attributes like title, publication date, and genre.
- **Member Management:** Maintain records of library members, including contact details and membership information.
- **Borrowing & Returns:** Track issued materials, due dates, and returned books.
- **Author & Authorship Tracking:** Maintain author details and link them to their respective works.
- **Staff Management:** Manage library employees, their roles, and assigned tasks.
- **Search & Query Capabilities:** Users can search for materials using title, author, or genre.

## Database Design

The system follows a **relational database model** implemented in **PostgreSQL**. The key entities and their attributes include:

### Entities:
1. **Material:** Represents books, e-books, and other resources.
2. **Catalog:** Stores information about the physical or digital location of materials.
3. **Genre:** Categorizes materials (e.g., Fiction, Non-fiction).
4. **Borrow:** Records borrowing activities, including due dates and return dates.
5. **Author:** Stores details about book authors.
6. **Authorship:** Links authors to their respective books.
7. **Member:** Represents library users who borrow materials.
8. **Staff:** Represents library employees managing operations.

### Relationships:
- Each **Material** belongs to a **Catalog**.
- Each **Material** is assigned to a **Genre**.
- **Authorship** connects authors with the books they have written.
- **Borrow** links materials to members and staff who process transactions.

## Technology Stack

- **Database:** PostgreSQL
- **Query Language:** SQL
- **Data Storage:** CSV file imports for bulk data population

## Database Implementation

The database is structured using **PostgreSQL**, ensuring data integrity and efficient querying. It includes:

- **Schema Creation:** SQL scripts define tables, constraints, and relationships.
- **Data Population:** CSV files load initial data into tables.
- **Querying & Manipulation:** Includes searching, inserting, updating, and deleting records.
- **Advanced SQL Queries:** Supports joins, aggregation, and subqueries.

## Sample Queries

The system supports various administrative and user queries, including:

- **Available Materials:** Identify books currently available for borrowing.
- **Overdue Materials:** List materials that have exceeded their due date.
- **Most Borrowed Books:** Identify the top 10 most borrowed books.
- **Author Contributions:** Count how many books an author has written.
- **Genre Popularity:** Rank genres by borrowing frequency.

## Automation & Enhancements

The system includes automated processes for:
- **Daily Overdue Notifications:** A scheduled query alerts staff about overdue books.
- **Membership Deactivation & Reactivation:** If a member has three overdue instances, their membership is suspended until overdue fees are paid.

## How to Run the Project

### Prerequisites:
1. Install **PostgreSQL**.
2. Ensure the `Project.sql` file is available.

### Steps to Execute:
1. Open a PostgreSQL client.
2. Run the schema creation queries from `Project.sql`.
3. Load data using the provided CSV imports.
4. Execute sample queries to validate functionality.

## Contributors
- **Mukesh Rajmohan**
- **Pranavi Rao Lingala**

---
