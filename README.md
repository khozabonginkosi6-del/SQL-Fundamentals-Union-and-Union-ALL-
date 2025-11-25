📘 SQL Practice Queries — UNION & UNION ALL
📌 Overview
This project demonstrates how to use UNION and UNION ALL in SQL to combine results from multiple tables. The examples cover:

Combining customer and sales data

Filtering unique vs. duplicate records

Aggregating totals across datasets

Adding source labels for merged records

🛠️ Requirements
SQL-compatible database (Snowflake, PostgreSQL, MySQL, SQL Server, Oracle, etc.)

Tables used in examples:

online_sales (customer_name, amount, sale_date)

store_sales (customer_name, amount, sale_date)

online_store (sale_date)

📂 Queries
1. 👤 Unique Customer Names
sql
SELECT customer_name FROM online_sales
UNION
SELECT customer_name FROM store_sales;
Combines customer names from both tables, removing duplicates.

2. 👥 All Customers (Including Duplicates)
sql
SELECT customer_name FROM online_sales
UNION ALL
SELECT customer_name FROM store_sales;
Lists all customers, including duplicates.

3. 📅 Unique Sale Dates
sql
SELECT sale_date FROM online_store
UNION
SELECT sale_date FROM store_sales
ORDER BY sale_date ASC;
Combines sale dates from both tables, sorted ascending, without duplicates.

4. 📅 All Sale Dates (Including Duplicates)
sql
SELECT sale_date FROM online_sales
UNION ALL
SELECT sale_date FROM store_sales;
Lists all sale dates, including duplicates.

5. 💵 Unique Customers with Purchases > 250
sql
SELECT DISTINCT customer_name
FROM store_sales
WHERE amount > 250;
Filters customers with purchases greater than 250.

6. 📊 Combine All Records
sql
SELECT customer_name, amount, sale_date FROM online_sales
UNION ALL
SELECT customer_name, amount, sale_date FROM store_sales;
Combines all records from both tables.

7. 🏷️ Add Sales Source Labels
sql
SELECT customer_name, amount, sale_date, 'online' AS source
FROM online_sales
UNION ALL
SELECT customer_name, amount, sale_date, 'store' AS source
FROM store_sales;
Adds a label to indicate whether the sale was online or in-store.

8. 👥 Customers Appearing in Both Tables
sql
SELECT customer_name, COUNT(*) AS occurrences
FROM (
  SELECT customer_name FROM online_sales
  UNION ALL
  SELECT customer_name FROM store_sales
) AS combined
GROUP BY customer_name
HAVING COUNT(*) > 1;
Identifies customers present in both datasets.

9. 💰 Total Combined Sales Amount
sql
SELECT SUM(amount) AS total_amount
FROM (
  SELECT amount FROM online_sales
  UNION ALL
  SELECT amount FROM store_sales
) AS combined_sales;
Calculates total sales across both tables.

10. 💳 Total Spent per Customer
sql
SELECT customer_name, SUM(amount) AS total_spent
FROM (
  SELECT customer_name, amount FROM online_sales
  UNION ALL
  SELECT customer_name, amount FROM store_sales
) AS combined_sales
GROUP BY customer_name;
Aggregates total spending per customer across online and store sales.
