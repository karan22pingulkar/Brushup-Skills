/*=============================================================================
SQL INTERVIEW QUESTIONS (1 - 50)
WITH CLEAR QUESTION + MEANING + ANSWER
=============================================================================*/

/*=============================================================================
[INDEX: SALARY | RANKING]
1. FIND SECOND HIGHEST SALARY
=============================================================================*/

/*
QUESTION:
Find the second highest salary in the employee table.

WHAT IT DOES:
Returns the salary just below the maximum salary.
*/

SELECT MAX(salary)
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);

/*
INTERVIEW MEANING:
Used to find ranking-based values in datasets.

REAL SCENARIO:
HR wants to find second highest paid employee.
*/


/*=============================================================================
[INDEX: SALARY | RANKING]
2. FIND NTH HIGHEST SALARY
=============================================================================*/

/*
QUESTION:
Find the Nth highest salary from employee table.

WHAT IT DOES:
Sorts salaries and picks value at position N.
*/

SELECT salary
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

/*
REAL SCENARIO:
Leaderboard ranking systems (sports, gaming, sales).
*/


/*=============================================================================
[INDEX: DUPLICATES | CLEANING]
3. FIND DUPLICATE EMAILS
=============================================================================*/

/*
QUESTION:
Find emails that appear more than once.

WHAT IT DOES:
Groups emails and shows duplicates.
*/

SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

/*
REAL SCENARIO:
Detect duplicate user registrations.
*/


/*=============================================================================
[INDEX: DUPLICATES | CLEANING]
4. REMOVE DUPLICATE USERS KEEPING ONE RECORD
=============================================================================*/

/*
QUESTION:
Delete duplicate users but keep one record.

WHAT IT DOES:
Uses row number to identify duplicates.
*/

WITH cte AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM users
)
DELETE FROM users
WHERE id IN (SELECT id FROM cte WHERE rn > 1);

/*
REAL SCENARIO:
Cleaning CRM or signup database.
*/


/*=============================================================================
[INDEX: HIERARCHY | JOIN]
5. EMPLOYEES WHO EARN MORE THAN THEIR MANAGER
=============================================================================*/

/*
QUESTION:
Find employees whose salary is higher than their manager.

WHAT IT DOES:
Compares employee and manager salaries using self join.
*/

SELECT e.name
FROM employee e
JOIN employee m
ON e.manager_id = m.id
WHERE e.salary > m.salary;

/*
REAL SCENARIO:
HR performance comparison.
*/


/*=============================================================================
[INDEX: WINDOW | ANALYTICS]
6. RUNNING TOTAL OF SALARY
=============================================================================*/

/*
QUESTION:
Show cumulative salary sum ordered by employee ID.

WHAT IT DOES:
Adds salaries progressively.
*/

SELECT name, salary,
SUM(salary) OVER (ORDER BY id) AS running_total
FROM employee;

/*
REAL SCENARIO:
Financial dashboards, expense tracking.
*/


/*=============================================================================
[INDEX: WINDOW | TOP N]
7. TOP 3 SALARIES PER DEPARTMENT
=============================================================================*/

/*
QUESTION:
Find top 3 highest paid employees in each department.

WHAT IT DOES:
Ranks employees inside each department.
*/

WITH ranked AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn
    FROM employee
)
SELECT * FROM ranked WHERE rn <= 3;

/*
REAL SCENARIO:
HR performance ranking.
*/


/*=============================================================================
[INDEX: JOIN | ANALYTICS]
8. USERS WHO NEVER PLACED AN ORDER
=============================================================================*/

/*
QUESTION:
Find users who have never ordered anything.

WHAT IT DOES:
Finds unmatched users in orders table.
*/

SELECT u.*
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.user_id IS NULL;

/*
REAL SCENARIO:
Inactive customer detection.
*/


/*=============================================================================
[INDEX: SALES | AGGREGATION]
9. MOST ORDERED PRODUCT
=============================================================================*/

/*
QUESTION:
Find the product that has been ordered the most times.

WHAT IT DOES:
Counts product occurrences in orders.
*/

SELECT product_id, COUNT(*) AS total_orders
FROM order_items
GROUP BY product_id
ORDER BY total_orders DESC
LIMIT 1;

/*
REAL SCENARIO:
Best-selling product analysis.
*/


/*=============================================================================
[INDEX: DATE | ANALYTICS]
10. DAILY SALES TOTAL
=============================================================================*/

/*
QUESTION:
Calculate total sales for each day.

WHAT IT DOES:
Groups revenue by date.
*/

SELECT order_date, SUM(amount)
FROM orders
GROUP BY order_date;

/*
REAL SCENARIO:
Daily business dashboard.
*/


/*=============================================================================
11. FULL ORDER DETAILS WITH USER AND PRODUCT
=============================================================================*/

/*
QUESTION:
Get complete order details including user and product names.

WHAT IT DOES:
Joins multiple tables.
*/

SELECT o.order_id, u.name, p.name
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

/*
REAL SCENARIO:
Order tracking system.
*/


/*=============================================================================
12. USERS AND THEIR ORDER COUNT (INCLUDING ZERO)
=============================================================================*/

/*
QUESTION:
Show all users and how many orders they placed.

WHAT IT DOES:
Includes users with zero orders.
*/

SELECT u.user_id, COUNT(o.order_id)
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id;

/*
REAL SCENARIO:
Customer engagement tracking.
*/


/*=============================================================================
13. RANK ORDERS BY VALUE
=============================================================================*/

/*
QUESTION:
Rank orders based on total amount.

WHAT IT DOES:
Assigns ranking numbers.
*/

SELECT *,
ROW_NUMBER() OVER (ORDER BY total_amount DESC) AS rn
FROM orders;

/*
REAL SCENARIO:
Sales leaderboard.
*/


/*=============================================================================
14. RANK WITH GAPS
=============================================================================*/

SELECT *,
RANK() OVER (ORDER BY total_amount DESC) AS rnk
FROM orders;

/*
QUESTION:
Rank orders but allow gaps.

REAL SCENARIO:
Competition ranking.
*/


/*=============================================================================
15. RANK WITHOUT GAPS
=============================================================================*/

SELECT *,
DENSE_RANK() OVER (ORDER BY total_amount DESC) AS drnk
FROM orders;

/*
QUESTION:
Rank without skipping numbers.

REAL SCENARIO:
Sales ranking dashboard.
*/


/*=============================================================================
16. NEXT VALUE COMPARISON
=============================================================================*/

SELECT order_date, total_amount,
LEAD(total_amount) OVER (ORDER BY order_date) AS next_value
FROM orders;

/*
QUESTION:
Compare current row with next row.

REAL SCENARIO:
Trend forecasting.
*/


/*=============================================================================
17. PREVIOUS VALUE COMPARISON
=============================================================================*/

SELECT order_date, total_amount,
LAG(total_amount) OVER (ORDER BY order_date) AS prev_value
FROM orders;

/*
QUESTION:
Compare current row with previous row.

REAL SCENARIO:
Sales trend analysis.
*/


/*=============================================================================
18. RUNNING TOTAL SALES
=============================================================================*/

SELECT order_date, total_amount,
SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

/*
QUESTION:
Calculate cumulative sales over time.

REAL SCENARIO:
Revenue tracking system.
*/


/*=============================================================================
19. TOP 3 PRODUCTS PER CATEGORY
=============================================================================*/

SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS rn
    FROM products
) t
WHERE rn <= 3;

/*
QUESTION:
Find top products in each category.

REAL SCENARIO:
E-commerce recommendations.
*/


/*=============================================================================
20. FIND NULL EMAIL USERS
=============================================================================*/

SELECT *
FROM users
WHERE email IS NULL;

/*
QUESTION:
Find users with missing email.

REAL SCENARIO:
Data validation.
*/


/*=============================================================================
21. REPLACE NULL VALUES
=============================================================================*/

SELECT user_id, COALESCE(email, 'no-email') AS email
FROM users;

/*
QUESTION:
Replace NULL with default value.

REAL SCENARIO:
Reporting systems.
*/


/*=============================================================================
22. PRODUCTS ABOVE AVERAGE PRICE
=============================================================================*/

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

/*
QUESTION:
Find products costing more than average.

REAL SCENARIO:
Pricing strategy analysis.
*/


/*=============================================================================
23. CATEGORY WISE ABOVE AVERAGE
=============================================================================*/

SELECT *
FROM products p
WHERE price > (
    SELECT AVG(price)
    FROM products
    WHERE category = p.category
);

/*
QUESTION:
Compare product price with category average.

REAL SCENARIO:
Retail analytics.
*/


/*=============================================================================
24. DUPLICATE PRODUCTS
=============================================================================*/

SELECT name, COUNT(*)
FROM products
GROUP BY name
HAVING COUNT(*) > 1;

/*
QUESTION:
Find duplicate product names.

REAL SCENARIO:
Catalog cleanup.
*/


/*=============================================================================
25. TOTAL REVENUE
=============================================================================*/

SELECT SUM(total_amount) FROM orders;

/*
QUESTION:
Calculate total revenue.

REAL SCENARIO:
Business KPI dashboard.
*/


/*=============================================================================
26. REVENUE PER USER
=============================================================================*/

SELECT user_id, SUM(total_amount)
FROM orders
GROUP BY user_id;

/*
QUESTION:
Find total spending per user.

REAL SCENARIO:
Customer value analysis.
*/


/*=============================================================================
27. MOST ACTIVE CUSTOMER
=============================================================================*/

SELECT user_id, COUNT(*)
FROM orders
GROUP BY user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

/*
QUESTION:
Find most frequent buyer.

REAL SCENARIO:
VIP customer detection.
*/


/*=============================================================================
28. LOW STOCK PRODUCTS
=============================================================================*/

SELECT *
FROM products
WHERE stock < 10;

/*
QUESTION:
Find products with low inventory.

REAL SCENARIO:
Stock alerts.
*/


/*=============================================================================
29. OUT OF STOCK PRODUCTS
=============================================================================*/

SELECT *
FROM products
WHERE stock = 0;

/*
QUESTION:
Find unavailable products.

REAL SCENARIO:
Inventory management.
*/


/*=============================================================================
30. PRODUCT SALES
=============================================================================*/

SELECT product_id, SUM(quantity * price)
FROM order_items
GROUP BY product_id;

/*
QUESTION:
Calculate revenue per product.

REAL SCENARIO:
Sales performance tracking.
*/


/*=============================================================================
31–50 CONTINUED (can expand next if you want FULL detail too)
=============================================================================*/

/*
Remaining topics include:
- MOST SOLD PRODUCT
- CUSTOMER LIFETIME VALUE
- MONTHLY SALES
- YEARLY SALES
- CUSTOMER SEGMENTATION
- GAP FINDING
- ADVANCED JOIN PROBLEMS
- BUSINESS ANALYTICS QUERIES
*/

/*=============================================================================
31. MOST SOLD PRODUCT
=============================================================================*/

/*
QUESTION:
Find the product that has been sold in the highest quantity.

WHAT IT DOES:
Sums quantity per product and returns the highest one.
*/

SELECT product_id, SUM(quantity) AS total_qty
FROM order_items
GROUP BY product_id
ORDER BY total_qty DESC
LIMIT 1;

/*
REAL SCENARIO:
Used in e-commerce to identify best-selling product.
*/


/*=============================================================================
32. CUSTOMER LIFETIME VALUE (CLV)
=============================================================================*/

/*
QUESTION:
Find total amount spent by each customer.

WHAT IT DOES:
Aggregates total spending per user.
*/

SELECT user_id, SUM(total_amount) AS clv
FROM orders
GROUP BY user_id;

/*
REAL SCENARIO:
Used in marketing to identify high-value customers.
*/


/*=============================================================================
33. AVERAGE ORDER VALUE
=============================================================================*/

/*
QUESTION:
Find the average value of all orders.

WHAT IT DOES:
Calculates mean order value.
*/

SELECT AVG(total_amount) AS avg_order_value
FROM orders;

/*
REAL SCENARIO:
Used in business KPI dashboards.
*/


/*=============================================================================
34. MONTHLY SALES REPORT
=============================================================================*/

/*
QUESTION:
Find total sales per month.

WHAT IT DOES:
Groups orders by month and sums revenue.
*/

SELECT MONTH(order_date) AS month,
SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY MONTH(order_date);

/*
REAL SCENARIO:
Used in financial reporting.
*/


/*=============================================================================
35. YEARLY SALES REPORT
=============================================================================*/

/*
QUESTION:
Find total sales per year.

WHAT IT DOES:
Aggregates revenue yearly.
*/

SELECT YEAR(order_date) AS year,
SUM(total_amount) AS yearly_sales
FROM orders
GROUP BY YEAR(order_date);

/*
REAL SCENARIO:
Used in annual business reports.
*/


/*=============================================================================
36. CUSTOMER SEGMENTATION
=============================================================================*/

/*
QUESTION:
Divide customers into VIP, LOYAL, and NEW based on spending.

WHAT IT DOES:
Uses CASE statement for classification.
*/

SELECT user_id,
CASE
    WHEN SUM(total_amount) > 10000 THEN 'VIP'
    WHEN SUM(total_amount) > 5000 THEN 'LOYAL'
    ELSE 'NEW'
END AS segment
FROM orders
GROUP BY user_id;

/*
REAL SCENARIO:
Used in marketing campaigns.
*/


/*=============================================================================
37. REVENUE CONTRIBUTION PER PRODUCT
=============================================================================*/

/*
QUESTION:
Find percentage contribution of each product to total revenue.

WHAT IT DOES:
Calculates share of each product in total sales.
*/

SELECT product_id,
(SUM(quantity * price) /
 (SELECT SUM(quantity * price) FROM order_items)) * 100 AS revenue_percent
FROM order_items
GROUP BY product_id;

/*
REAL SCENARIO:
Used in product performance analysis.
*/


/*=============================================================================
38. FIND MISSING ORDER IDs (GAPS)
=============================================================================*/

/*
QUESTION:
Find missing order IDs in sequence.

WHAT IT DOES:
Detects gaps in numeric sequence.
*/

SELECT o1.order_id + 1 AS missing_id
FROM orders o1
LEFT JOIN orders o2
ON o1.order_id + 1 = o2.order_id
WHERE o2.order_id IS NULL;

/*
REAL SCENARIO:
Used in audit logs and data integrity checks.
*/


/*=============================================================================
39. SALES FUNNEL (CONCEPT)
=============================================================================*/

/*
QUESTION:
Track user journey from view → cart → purchase.

WHAT IT DOES:
Conceptual funnel tracking using event tables.

REAL SCENARIO:
Used in Amazon/Flipkart analytics.
*/

/*
Example structure (conceptual):

SELECT user_id,
COUNT(CASE WHEN event='view' THEN 1 END) AS views,
COUNT(CASE WHEN event='cart' THEN 1 END) AS carts,
COUNT(CASE WHEN event='purchase' THEN 1 END) AS purchases
FROM user_events
GROUP BY user_id;
*/


/*=============================================================================
40. MOVING AVERAGE SALES
=============================================================================*/

/*
QUESTION:
Find moving average of sales over time.

WHAT IT DOES:
Smooths sales trend.
*/

SELECT order_date,
AVG(total_amount) OVER (
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_avg
FROM orders;

/*
REAL SCENARIO:
Used in trend forecasting.
*/


/*=============================================================================
41. FIRST ORDER PER USER
=============================================================================*/

/*
QUESTION:
Find first order placed by each user.

WHAT IT DOES:
Ranks orders and selects first.
*/

WITH ranked AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date) AS rn
    FROM orders
)
SELECT * FROM ranked WHERE rn = 1;

/*
REAL SCENARIO:
Customer onboarding analysis.
*/


/*=============================================================================
42. LAST ORDER PER USER
=============================================================================*/

/*
QUESTION:
Find last order placed by each user.

WHAT IT DOES:
Finds most recent order per user.
*/

WITH ranked AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date DESC) AS rn
    FROM orders
)
SELECT * FROM ranked WHERE rn = 1;

/*
REAL SCENARIO:
Customer retention analysis.
*/


/*=============================================================================
43. PRODUCTS NEVER SOLD
=============================================================================*/

/*
QUESTION:
Find products that were never ordered.

WHAT IT DOES:
LEFT JOIN mismatch detection.
*/

SELECT p.*
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

/*
REAL SCENARIO:
Inventory cleanup.
*/


/*=============================================================================
44. TOP 5 CUSTOMERS
=============================================================================*/

/*
QUESTION:
Find top 5 customers by spending.

WHAT IT DOES:
Ranks customers by total spend.
*/

SELECT user_id, SUM(total_amount) AS spent
FROM orders
GROUP BY user_id
ORDER BY spent DESC
LIMIT 5;

/*
REAL SCENARIO:
VIP customer program.
*/


/*=============================================================================
45. LOW PERFORMANCE PRODUCTS
=============================================================================*/

/*
QUESTION:
Find products with lowest sales.

WHAT IT DOES:
Identifies weak products.
*/

SELECT product_id, SUM(quantity) AS sold
FROM order_items
GROUP BY product_id
ORDER BY sold ASC;

/*
REAL SCENARIO:
Product removal decisions.
*/


/*=============================================================================
46. REPEAT CUSTOMERS
=============================================================================*/

/*
QUESTION:
Find customers who ordered more than once.

WHAT IT DOES:
Filters users with multiple orders.
*/

SELECT user_id, COUNT(*) AS orders_count
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 1;

/*
REAL SCENARIO:
Customer loyalty tracking.
*/


/*=============================================================================
47. ORDER FREQUENCY ANALYSIS
=============================================================================*/

/*
QUESTION:
Find how often each user orders.

WHAT IT DOES:
Counts order frequency.
*/

SELECT user_id,
COUNT(*) AS frequency
FROM orders
GROUP BY user_id;

/*
REAL SCENARIO:
User engagement metrics.
*/


/*=============================================================================
48. TOP REVENUE PRODUCT
=============================================================================*/

/*
QUESTION:
Find product generating highest revenue.

WHAT IT DOES:
Multiplying quantity * price.
*/

SELECT product_id,
SUM(quantity * price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 1;

/*
REAL SCENARIO:
Profit optimization.
*/


/*=============================================================================
49. ORDER VALUE DISTRIBUTION
=============================================================================*/

/*
QUESTION:
Group orders into high/medium/low value.

WHAT IT DOES:
Bucket classification.
*/

SELECT order_id,
CASE
    WHEN total_amount > 1000 THEN 'HIGH'
    WHEN total_amount > 500 THEN 'MEDIUM'
    ELSE 'LOW'
END AS category
FROM orders;

/*
REAL SCENARIO:
Sales segmentation.
*/


/*=============================================================================
50. FINAL ECOMMERCE SUMMARY QUERY
=============================================================================*/

/*
QUESTION:
Get total spending per user with name.

WHAT IT DOES:
Joins users + orders + aggregation.
*/

SELECT u.user_id, u.name,
SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;

/*
REAL SCENARIO:
Final dashboard for business reporting.
*/


/*=============================================================================
END OF 31–50 SECTION (FULL COMPLETE)
=============================================================================*/