# 📚 Library Management System

## 📌 Project Overview
The **Library Management System** is a **database-driven software solution** designed to **automate and streamline library operations**. It manages **physical and digital resources** such as **books, e-books, magazines, and audiobooks**, enhancing accessibility and efficiency for both **library users and staff**.

### 🎯 Objectives:
- **Efficiently manage** library materials, members, and staff.
- **Track borrowing transactions**, due dates, and overdue books.
- **Generate reports & analytics** for administrative decision-making.

---

## 📂 Project Files
- **📄 Project Documentation**
- **📜 SQL Schema & Queries:** `Project.sql`
- **📂 Data Import CSVs:** (For bulk data population)

---

## 🔑 Key Features
- **📖 Cataloging of Materials:** Store details about books, e-books, and audiobooks.
- **🧑‍💻 Member Management:** Maintain **library user records** including membership details.
- **🔄 Borrowing & Returns:** Track **issued materials, due dates, and overdue books**.
- **✍️ Author & Authorship Tracking:** Maintain author details and **link books to authors**.
- **📋 Staff Management:** Manage **library employees, their roles, and tasks**.
- **🔎 Search & Query Capabilities:** Search **books by title, author, or genre**.

---

## 🗃️ Database Design

The system follows a **relational database model** implemented in **PostgreSQL**.

### **Entities & Relationships**
| Entity | Description |
|--------|------------|
| **Material** | Represents books, e-books, and other resources. |
| **Catalog** | Stores information about the physical or digital location of materials. |
| **Genre** | Categorizes materials (e.g., Fiction, Non-fiction). |
| **Borrow** | Records borrowing activities, including due dates and return dates. |
| **Author** | Stores details about book authors. |
| **Authorship** | Links authors to their respective books. |
| **Member** | Represents library users who borrow materials. |
| **Staff** | Represents library employees managing operations. |

### **Relationships**
- Each **Material** belongs to a **Catalog** and is assigned to a **Genre**.
- **Authorship** links authors with their books.
- **Borrow** connects **materials, members, and staff** for transaction tracking.

---

## 🛠️ Technology Stack
- **Database:** PostgreSQL
- **Query Language:** SQL
- **Data Storage:** CSV files for initial data imports

---

## 📊 Database Implementation
The database is designed to ensure **data integrity and efficient querying** through:
- **📜 Schema Definition:** SQL scripts for tables, constraints, and relationships.
- **📂 Data Population:** CSV files for bulk insertion of records.
- **🔎 Querying & Manipulation:** Supports **CRUD operations (Create, Read, Update, Delete)**.
- **📊 Advanced SQL Queries:** Implements **joins, aggregation, and subqueries**.

---

## 📋 Sample Queries
The system supports various administrative and user queries, such as:

| Query Type | Description |
|------------|------------|
| **Available Materials** | Identify books currently available for borrowing. |
| **Overdue Materials** | List all books that have exceeded their due date. |
| **Most Borrowed Books** | Retrieve the **top 10 most borrowed books**. |
| **Author Contributions** | Count the number of books an author has written. |
| **Genre Popularity** | Rank genres based on borrowing frequency. |

---

## 🔄 Automation & Enhancements
The system includes automated processes for:
- **📅 Daily Overdue Notifications:** Alerts staff about overdue books.
- **⛔ Membership Suspension:** **Auto-suspends** members after three overdue instances.
- **✅ Reactivation Process:** Membership is reactivated once overdue fees are cleared.

---

## ⚙️ How to Run the Project

### **1️⃣ Prerequisites**
- Install **PostgreSQL**.
- Ensure the SQL script (`Project.sql`) is available.

### **2️⃣ Execution Steps**
1. Open a **PostgreSQL client** (e.g., pgAdmin, psql).
2. **Run the schema creation script** from `Project.sql`.
3. **Load data** using the provided **CSV files**.
4. **Execute sample queries** to test functionality.

---

## 📚 References
- **PostgreSQL Documentation:** [Official PostgreSQL Docs](https://www.postgresql.org/docs/)
- **SQL Query Optimization:** [SQL Performance Tips](https://www.sqlshack.com/sql-performance-tuning/)
- **Database Normalization:** [Database Design Guide](https://www.guru99.com/database-normalization.html)

---

## 🤝 Contributors
👤 **Mukesh Rajmohan** - *Database Design & Implementation*  
👤 **Pranavi Rao Lingala** - *System Architecture & Query Optimization*

For any queries or contributions, feel free to raise an issue! 🚀

---
