# 📚 Online Book Store SQL Project

## 📌 Project Overview

The **Online Book Store SQL Project** is a database project designed to manage and analyze an online bookstore's data using SQL.

The project contains information about books, customers, and orders. SQL queries are used to retrieve, filter, aggregate, and analyze the data.

## 🗄️ Database

**Database Name:** `online_book_store`

```sql
CREATE DATABASE online_book_store;
USE online_book_store;
```

## 📊 Database Tables

The project contains three main tables:

### 1. Books

The `Books` table stores information about books.

| Column | Description |
|---|---|
| Book_ID | Unique ID of the book |
| Title | Book title |
| Author | Author name |
| Genre | Book genre |
| Published_Year | Year the book was published |
| Price | Price of the book |
| Stock | Available stock |

### 2. Customers

The `Customers` table stores customer information.

| Column | Description |
|---|---|
| Customer_ID | Unique customer ID |
| Name | Customer name |
| Email | Customer email |
| Phone | Customer phone number |
| City | Customer city |
| Country | Customer country |

### 3. Orders

The `Orders` table stores information about customer orders.

| Column | Description |
|---|---|
| Order_ID | Unique order ID |
| Customer_ID | Customer reference |
| Book_ID | Book reference |
| Order_Date | Date of order |
| Quantity | Number of books ordered |
| Total_Amount | Total order amount |

The `Orders` table is connected to the `Customers` and `Books` tables using foreign keys. 

## 🔗 Table Relationships

```text
Customers
    |
    | Customer_ID
    |
    v
  Orders
    ^
    |
    | Book_ID
    |
  Books
```

## 🛠️ Technologies Used

- MySQL
- MySQL Workbench
- SQL
- CSV files

## 📂 Project Files

```text
Online-Book-Store-SQL-Project/
│
├── Online_Book_Store.sql
├── Books.csv
├── Customers.csv
├── Orders.csv
└── README.md
```

## 🔍 SQL Queries Included

The project includes SQL queries for:

- Retrieving books by genre
- Finding books published after a specific year
- Finding customers from a specific country
- Retrieving orders within a specific date range
- Calculating total book stock
- Finding the most expensive book
- Finding orders with quantities greater than 1
- Finding orders with total amount greater than 20
- Finding available book genres
- Finding the book with the lowest stock
- Calculating total revenue
- Calculating books sold by genre
- Finding average book price by genre
- Finding customers with multiple orders
- Finding the most frequently ordered book
- Finding the top 3 most expensive Fantasy books
- Calculating books sold by each author
- Finding cities of customers with orders over 30
- Finding the customer who spent the most
- Calculating remaining stock after orders

## 📈 SQL Concepts Used

This project demonstrates the following SQL concepts:

- `CREATE DATABASE`
- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `LOAD DATA LOCAL INFILE`
- `SELECT`
- `WHERE`
- `DISTINCT`
- `BETWEEN`
- `ORDER BY`
- `LIMIT`
- `SUM()`
- `AVG()`
- `COUNT()`
- `GROUP BY`
- `HAVING`
- `JOIN`
- `COALESCE()`

## 💾 Data Import

The project uses CSV files to load data into the database:

```text
Books.csv
Customers.csv
Orders.csv
```

The SQL file contains `LOAD DATA LOCAL INFILE` statements for importing these CSV files.

## 🚀 How to Run the Project

### Step 1: Clone the Repository

Download or clone this repository from GitHub.

### Step 2: Open MySQL Workbench

Open MySQL Workbench and connect to your MySQL server.

### Step 3: Create the Database

Run:

```sql
CREATE DATABASE online_book_store;
USE online_book_store;
```

### Step 4: Create the Tables

Run the `CREATE TABLE` statements from:

```text
Online_Book_Store.sql
```

### Step 5: Import the CSV Data

Import:

```text
Books.csv
Customers.csv
Orders.csv
```

into their respective tables.

### Step 6: Run SQL Queries

Execute the queries in `Online_Book_Store.sql` to analyze the bookstore data.

## 🎯 Project Objectives

The main objectives of this project are:

- To understand relational database design
- To practice SQL queries
- To work with multiple related tables
- To perform data analysis using SQL
- To practice aggregate functions
- To understand joins and relationships
- To retrieve meaningful information from bookstore data

## 👨‍💻 Author

**Vinay Awari**

### ⭐ If you find this project useful, feel free to star the repository!
