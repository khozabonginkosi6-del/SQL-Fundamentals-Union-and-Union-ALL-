---1.Unique customer names---
SELECT customer_name FROM online_sales
UNION
SELECT customer_name FROM store_sales;

---2.list all customers using union all(including duplicates)
SELECT customer_name FROM online_sales
UNION ALL
SELECT customer_nam FROM store_sales;

---3.Unique sale dates ---
SELECT sale_date  FROM online_store
UNION
SELECT sale_date FROM store_sales
ORDER BY sale_date ASC;

---4.all sales date including duplicates---
SELECT sale_date FROM online_sales
UNION ALL
SELECT sale_date FROM store_sales;

---5.unique customers who made purchase greater than 250---
SELECT DISTINCT customer_name
FROM ( SELECT customer_name FROM store_sales
)AS combined sales 
WHERE amount > 250;

---6.combine all record from the table---
SELECT customer_name,amount,sale_date FROM online_sales
UNION ALL
SELECT customer_name,amount,sales_date FROM store_sales;

---7.add sales sources label---
SELECT customer_name
       amount,
       sales_date
       'online' AS source
FROM online_sales
SELECT customer_name,
       amount,
       sale_date
       'store' AS source
FROM store_sales;

---8.customers appearing in both tables---
SELECT customer_name,COUNT(*) AS 
       occurrences
FROM (
      SELECT customer_name FROM 
      online_sales
      UNION ALL
      SELECT customer_name FROM store_sales
) AS combined 
GROUP BY customer_name 
HAVING COUNT(*) > 1;

---9.Total combined sales amount---
SELECT SUM(AMOUNT) AS total_amount
FROM(
SELECT amount FROM online_sales
UNION ALL
SELECT amount FROM store_sales
) AS combined_sales;

---10.combine amount from both tables
SELECT customer_name, SUM(Amount) AS total_spent
FROM (
SELECT customer_name
       amount FROM online_sales
UNION ALL 
SELECT customer_name,
amount FROM store_sales
) AS combined_sales
GROUP BY customer_name;