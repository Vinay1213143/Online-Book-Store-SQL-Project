CREATE DATABASE online_book_store;

USE online_book_store;

CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10,2),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

LOAD DATA LOCAL INFILE 'C:/Users/vinay/OneDrive/Desktop/ThinkQuotient Generative AI/SQLqueries/ST - SQL ALL PRACTICE FILES-2/All Excel Practice Files/Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock);

LOAD DATA LOCAL INFILE 'C:/Users/vinay/OneDrive/Desktop/ThinkQuotient Generative AI/SQLqueries/ST - SQL ALL PRACTICE FILES-2/All Excel Practice Files/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Customer_ID, Name, Email, Phone, City, Country);

LOAD DATA LOCAL INFILE 'C:/Users/vinay/OneDrive/Desktop/ThinkQuotient Generative AI/SQLqueries/ST - SQL ALL PRACTICE FILES-2/All Excel Practice Files/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Q1. Retrieve all books in the 'Fiction' genre:
SELECT * FROM Books
WHERE Genre='Fiction';

-- Q2. Find books published after the years 1950:
SELECT * FROM Books
WHERE Published_Year > 1950;

-- Q3. List all the Customers from the Canada:
SELECT * FROM Customers
WHERE Country='Canada';

-- Q4. Show orders placed in November 2023:
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- Q5. Retrieve the total stock of books available:
SELECT SUM(stock) AS Total_Books_Available
FROM Books;

-- Q6. Find the details of the most expensive Book:
SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;

-- Q7. Show all the customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders
WHERE quantity>1;

-- Q8. Retrieve all orders where the total amount exceeds 20:
SELECT * FROM Orders
WHERE total_amount>20;

-- Q9. List all genre available in the book title:
SELECT DISTINCT(Genre) 
FROM Books;

-- Q10. Find the book with the lowest stock:
SELECT * FROM Books
ORDER BY stock ASC
Limit 1;

-- Q11. Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS Revenue
FROM Orders;

-- ADVANCED QUERY
-- Q12. Retrieve the total number of books sold for each genre:
SELECT * FROM ORDERS;
SELECT * FROM BOOKS;
SELECT * FROM CUSTOMERS;

SELECT b.Genre, SUM(o.quantity)AS 'Total Book Sold For Each Genre'
FROM Orders o
JOIN Books b ON o.book_id=b.book_id
GROUP BY Genre;

-- Q13. Find the average price of books in the 'Fantasy' Genre:
SELECT AVG(Price) AS 'Average Price Of Fantasy'
FROM Books
WHERE Genre='Fantasy';

-- Q14. List customers who have placed at least 2 orders:
SELECT o.customer_id,c.name, COUNT(o.order_id) AS Order_Count
FROM Orders o
JOIN Customers c
ON o.customer_id=c.customer_id
GROUP BY Customer_id,name
HAVING COUNT(order_id)>=2;

-- Q15. Find the most frequently ordered book:
SELECT o.Book_id,b.Title, COUNT(order_id) AS ORDER_COUNT
FROM orders o
JOIN Books b ON o.book_id=b.book_id
GROUP BY Book_id
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- Q16. Show the top 3 most expensive books of 'Fantasy' Genre:
SELECT * FROM Books
WHERE Genre='Fantasy'
ORDER BY Price DESC
LIMIT 3;

-- Q17. Retrieve the total quantity of books sold by each author:
SELECT b.author,SUM(o.quantity) AS 'Books Quantity Sold By Author'
FROM Orders o 
JOIN Books b ON o.book_id=b.book_id
GROUP BY Author;

-- Q18. List the cities where customers who spent over $30 are located:
SELECT c.city,o.total_amount
FROM Orders o 
JOIN Customers c ON o.customer_id=c.customer_id
WHERE total_amount>30;

-- Q19. Find the customer who spent the most on orders:
SELECT c.name,SUM(o.total_amount) AS Total_Amount
FROM Orders o 
JOIN Customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id,c.name
ORDER BY total_amount DESC 
LIMIT 1;

-- Q20. Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id,b.title,b.stock,COALESCE(SUM(o.quantity),0) AS Quantity,
	   b.stock-COALESCE(SUM(o.quantity),0) AS Quantity_Remaining
FROM Orders o 
JOIN Books b ON o.book_id=b.book_id
GROUP BY Book_id;

SELECT b.book_id,b.title,b.stock,COALESCE(SUM(o.quantity),0) AS Quantity,
		b.stock-COALESCE(SUM(o.quantity),0) AS Quantity_Remaining
FROM Orders o 
JOIN Books b ON o.book_id=b.book_id
GROUP BY Book_id;






