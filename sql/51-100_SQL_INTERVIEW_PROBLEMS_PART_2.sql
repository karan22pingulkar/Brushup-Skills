
/*=============================================================================
SQL INTERVIEW QUESTIONS (51 - 100)
FULL DETAIL + QUESTION + MEANING + REAL SCENARIO
=============================================================================*/


/*=============================================================================
51. FIND USERS WITH NO LOGIN HISTORY
=============================================================================*/

/*
QUESTION:
Find users who have never logged into the system.

WHAT IT DOES:
Returns users missing in login table.
*/

SELECT u.*
FROM users u
LEFT JOIN logins l
ON u.user_id = l.user_id
WHERE l.user_id IS NULL;

/*
REAL SCENARIO:
Identify inactive users in SaaS or apps.
*/


/*=============================================================================
52. FIND USERS WHO LOGGED IN AT LEAST ONCE
=============================================================================*/

/*
QUESTION:
Find users who have logged in at least once.

WHAT IT DOES:
Returns users present in login table.
*/

SELECT DISTINCT u.*
FROM users u
JOIN logins l
ON u.user_id = l.user_id;

/*
REAL SCENARIO:
Active user tracking.
*/


/*=============================================================================
53. FIND FIRST LOGIN DATE PER USER
=============================================================================*/

/*
QUESTION:
Find the first login date of each user.

WHAT IT DOES:
Gets earliest login per user.
*/

SELECT user_id,
MIN(login_date) AS first_login
FROM logins
GROUP BY user_id;

/*
REAL SCENARIO:
User onboarding analysis.
*/


/*=============================================================================
54. FIND LAST LOGIN DATE PER USER
=============================================================================*/

/*
QUESTION:
Find most recent login of each user.

WHAT IT DOES:
Gets latest login per user.
*/

SELECT user_id,
MAX(login_date) AS last_login
FROM logins
GROUP BY user_id;

/*
REAL SCENARIO:
Retention tracking.
*/


/*=============================================================================
55. USERS WHO NEVER PLACED ORDER
=============================================================================*/

/*
QUESTION:
Find users who never placed any order.

WHAT IT DOES:
Anti-join on orders table.
*/

SELECT u.*
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id
WHERE o.user_id IS NULL;

/*
REAL SCENARIO:
Inactive customer detection.
*/


/*=============================================================================
56. ORDERS WITHOUT PAYMENT
=============================================================================*/

/*
QUESTION:
Find orders where payment is missing.

WHAT IT DOES:
Detects incomplete transactions.
*/

SELECT o.*
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.order_id IS NULL;

/*
REAL SCENARIO:
Payment failure tracking.
*/


/*=============================================================================
57. PAYMENT FAILURE RATE
=============================================================================*/

/*
QUESTION:
Find count of successful vs failed payments.

WHAT IT DOES:
Groups payment status.
*/

SELECT status, COUNT(*)
FROM payments
GROUP BY status;

/*
REAL SCENARIO:
Financial monitoring dashboard.
*/


/*=============================================================================
58. TOTAL REVENUE FROM SUCCESSFUL PAYMENTS
=============================================================================*/

/*
QUESTION:
Calculate revenue from successful payments only.

WHAT IT DOES:
Filters successful transactions.
*/

SELECT SUM(amount)
FROM payments
WHERE status = 'SUCCESS';

/*
REAL SCENARIO:
Accurate revenue calculation.
*/


/*=============================================================================
59. TOP PAYMENT METHOD
=============================================================================*/

/*
QUESTION:
Find most used payment method.

WHAT IT DOES:
Counts payment methods.
*/

SELECT payment_method, COUNT(*)
FROM payments
GROUP BY payment_method
ORDER BY COUNT(*) DESC
LIMIT 1;

/*
REAL SCENARIO:
Business payment preference analysis.
*/


/*=============================================================================
60. USERS WITH HIGHEST PAYMENT FAILURE
=============================================================================*/

/*
QUESTION:
Find users with most failed payments.

WHAT IT DOES:
Joins orders and payments.
*/

SELECT o.user_id, COUNT(*) AS failed
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.status = 'FAILED'
GROUP BY o.user_id
ORDER BY failed DESC;

/*
REAL SCENARIO:
Fraud or payment issue detection.
*/


/*=============================================================================
61. TOP SELLING PRODUCT BY QUANTITY
=============================================================================*/

/*
QUESTION:
Find product sold in highest quantity.

WHAT IT DOES:
Sums quantity per product.
*/

SELECT product_id, SUM(quantity) AS qty
FROM order_items
GROUP BY product_id
ORDER BY qty DESC
LIMIT 1;

/*
REAL SCENARIO:
Inventory planning.
*/


/*=============================================================================
62. TOP REVENUE PRODUCT
=============================================================================*/

/*
QUESTION:
Find product with highest revenue.

WHAT IT DOES:
Calculates total sales value.
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
63. PRODUCTS NEVER PURCHASED
=============================================================================*/

/*
QUESTION:
Find products that were never sold.

WHAT IT DOES:
LEFT JOIN mismatch.
*/

SELECT p.*
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

/*
REAL SCENARIO:
Catalog cleanup.
*/


/*=============================================================================
64. LOW STOCK ALERT
=============================================================================*/

/*
QUESTION:
Find products with low stock.

WHAT IT DOES:
Inventory threshold check.
*/

SELECT *
FROM products
WHERE stock < 10;

/*
REAL SCENARIO:
Warehouse alert system.
*/


/*=============================================================================
65. OUT OF STOCK PRODUCTS
=============================================================================*/

/*
QUESTION:
Find products with zero stock.

WHAT IT DOES:
Checks inventory depletion.
*/

SELECT *
FROM products
WHERE stock = 0;

/*
REAL SCENARIO:
Stock management system.
*/


/*=============================================================================
66. CUSTOMER LIFETIME VALUE
=============================================================================*/

/*
QUESTION:
Find total spend per customer.

WHAT IT DOES:
Aggregates user spending.
*/

SELECT user_id,
SUM(total_amount) AS clv
FROM orders
GROUP BY user_id;

/*
REAL SCENARIO:
Customer segmentation.
*/


/*=============================================================================
67. AVERAGE ORDER VALUE
=============================================================================*/

/*
QUESTION:
Find average order value.

WHAT IT DOES:
Mean order calculation.
*/

SELECT AVG(total_amount)
FROM orders;

/*
REAL SCENARIO:
Business KPI.
*/


/*=============================================================================
68. DAILY SALES REPORT
=============================================================================*/

/*
QUESTION:
Find total sales per day.

WHAT IT DOES:
Groups revenue daily.
*/

SELECT order_date,
SUM(total_amount)
FROM orders
GROUP BY order_date;

/*
REAL SCENARIO:
Dashboard reporting.
*/


/*=============================================================================
69. MONTHLY SALES REPORT
=============================================================================*/

/*
QUESTION:
Find total sales per month.

WHAT IT DOES:
Monthly aggregation.
*/

SELECT MONTH(order_date),
SUM(total_amount)
FROM orders
GROUP BY MONTH(order_date);

/*
REAL SCENARIO:
Financial reporting.
*/


/*=============================================================================
70. YEARLY SALES REPORT
=============================================================================*/

/*
QUESTION:
Find yearly revenue.

WHAT IT DOES:
Year-wise aggregation.
*/

SELECT YEAR(order_date),
SUM(total_amount)
FROM orders
GROUP BY YEAR(order_date);

/*
REAL SCENARIO:
Annual business report.
*/


/*=============================================================================
71. CUSTOMER SEGMENTATION
=============================================================================*/

/*
QUESTION:
Divide customers into VIP, LOYAL, NEW.

WHAT IT DOES:
Case-based classification.
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
Marketing campaigns.
*/


/*=============================================================================
72. TOP 5 CUSTOMERS
=============================================================================*/

/*
QUESTION:
Find top 5 customers by spending.

WHAT IT DOES:
Ranks customers by revenue.
*/

SELECT user_id,
SUM(total_amount) AS spent
FROM orders
GROUP BY user_id
ORDER BY spent DESC
LIMIT 5;

/*
REAL SCENARIO:
VIP program.
*/


/*=============================================================================
73. ORDER FREQUENCY PER USER
=============================================================================*/

/*
QUESTION:
Find how many orders each user placed.

WHAT IT DOES:
Counts orders per user.
*/

SELECT user_id,
COUNT(*) AS order_count
FROM orders
GROUP BY user_id;

/*
REAL SCENARIO:
Engagement tracking.
*/


/*=============================================================================
74. REPEAT CUSTOMERS
=============================================================================*/

/*
QUESTION:
Find users who ordered more than once.

WHAT IT DOES:
Filters active buyers.
*/

SELECT user_id,
COUNT(*) AS orders
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 1;

/*
REAL SCENARIO:
Retention analysis.
*/


/*=============================================================================
75. MOST FREQUENT CUSTOMER
=============================================================================*/

/*
QUESTION:
Find user with highest number of orders.

WHAT IT DOES:
Ranking by order count.
*/

SELECT user_id,
COUNT(*) AS cnt
FROM orders
GROUP BY user_id
ORDER BY cnt DESC
LIMIT 1;

/*
REAL SCENARIO:
VIP identification.
*/


/*=============================================================================
76. RUNNING TOTAL SALES
=============================================================================*/

/*
QUESTION:
Calculate cumulative sales over time.

WHAT IT DOES:
Window sum over order date.
*/

SELECT order_date,
SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

/*
REAL SCENARIO:
Revenue tracking dashboard.
*/


/*=============================================================================
77. DAY OVER DAY DIFFERENCE
=============================================================================*/

/*
QUESTION:
Find change in sales compared to previous day.

WHAT IT DOES:
Uses LAG function.
*/

SELECT order_date, total_amount,
total_amount - LAG(total_amount) OVER (ORDER BY order_date) AS diff
FROM orders;

/*
REAL SCENARIO:
Trend analysis.
*/


/*=============================================================================
78. NEXT DAY COMPARISON
=============================================================================*/

SELECT order_date, total_amount,
LEAD(total_amount) OVER (ORDER BY order_date) AS next_value
FROM orders;

/*
REAL SCENARIO:
Forecasting trends.
*/


/*=============================================================================
79. FIRST ORDER PER USER
=============================================================================*/

SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date) AS rn
    FROM orders
) t
WHERE rn = 1;

/*
REAL SCENARIO:
User onboarding analysis.
*/


/*=============================================================================
80. LAST ORDER PER USER
=============================================================================*/

SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date DESC) AS rn
    FROM orders
) t
WHERE rn = 1;

/*
REAL SCENARIO:
Retention tracking.
*/


/*=============================================================================
81. TOP PRODUCTS PER CATEGORY
=============================================================================*/

SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS rn
    FROM products
) t
WHERE rn = 1;

/*
REAL SCENARIO:
E-commerce ranking.
*/


/*=============================================================================
82. ABOVE AVERAGE PRICE PRODUCTS
=============================================================================*/

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

/*
REAL SCENARIO:
Pricing strategy.
*/


/*=============================================================================
83. CATEGORY WISE ABOVE AVG PRICE
=============================================================================*/

SELECT *
FROM products p
WHERE price > (
    SELECT AVG(price)
    FROM products
    WHERE category = p.category
);

/*
REAL SCENARIO:
Retail analysis.
*/


/*=============================================================================
84. FIND DUPLICATE PRODUCTS
=============================================================================*/

SELECT name, COUNT(*)
FROM products
GROUP BY name
HAVING COUNT(*) > 1;

/*
REAL SCENARIO:
Data cleanup.
*/


/*=============================================================================
85. REMOVE DUPLICATE PRODUCTS
=============================================================================*/

WITH cte AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY name ORDER BY product_id) AS rn
    FROM products
)
DELETE FROM products
WHERE product_id IN (SELECT product_id FROM cte WHERE rn > 1);

/*
REAL SCENARIO:
Database cleaning.
*/


/*=============================================================================
86. FIND MISSING ORDER IDS
=============================================================================*/

SELECT o1.order_id + 1 AS missing
FROM orders o1
LEFT JOIN orders o2
ON o1.order_id + 1 = o2.order_id
WHERE o2.order_id IS NULL;

/*
REAL SCENARIO:
Audit checks.
*/


/*=============================================================================
87. PRODUCT REVENUE SHARE
=============================================================================*/

SELECT product_id,
SUM(quantity * price) * 100 /
(SELECT SUM(quantity * price) FROM order_items) AS share
FROM order_items
GROUP BY product_id;

/*
REAL SCENARIO:
Revenue contribution analysis.
*/


/*=============================================================================
88. MOVING AVERAGE SALES
=============================================================================*/

SELECT order_date,
AVG(total_amount) OVER (
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_avg
FROM orders;

/*
REAL SCENARIO:
Trend smoothing.
*/


/*=============================================================================
89. FIRST VALUE IN SERIES
=============================================================================*/

SELECT order_date,
FIRST_VALUE(total_amount) OVER (ORDER BY order_date)
FROM orders;

/*
REAL SCENARIO:
Baseline comparison.
*/


/*=============================================================================
90. LAST VALUE IN SERIES
=============================================================================*/

SELECT order_date,
LAST_VALUE(total_amount) OVER (ORDER BY order_date)
FROM orders;

/*
REAL SCENARIO:
End trend tracking.
*/


/*=============================================================================
91. NULL VALUE CHECK
=============================================================================*/

SELECT *
FROM users
WHERE email IS NULL;

/*
REAL SCENARIO:
Data quality check.
*/


/*=============================================================================
92. REPLACE NULL VALUES
=============================================================================*/

SELECT user_id,
COALESCE(email, 'no-email')
FROM users;

/*
REAL SCENARIO:
Reporting cleanup.
*/


/*=============================================================================
93. COUNT NULL VALUES
=============================================================================*/

SELECT COUNT(*) - COUNT(email) AS null_count
FROM users;

/*
REAL SCENARIO:
Data validation.
*/


/*=============================================================================
94. FIND HIGH VALUE ORDERS
=============================================================================*/

SELECT *
FROM orders
WHERE total_amount > 1000;

/*
REAL SCENARIO:
Premium customers.
*/


/*=============================================================================
95. ORDER VALUE SEGMENTATION
=============================================================================*/

SELECT order_id,
CASE
    WHEN total_amount > 1000 THEN 'HIGH'
    WHEN total_amount > 500 THEN 'MEDIUM'
    ELSE 'LOW'
END AS category
FROM orders;

/*
REAL SCENARIO:
Sales classification.
*/


/*=============================================================================
96. FULL CUSTOMER SPENDING
=============================================================================*/

SELECT u.user_id, u.name,
SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;

/*
REAL SCENARIO:
Final dashboard report.
*/


/*=============================================================================
97. TOP SELLING PRODUCT
=============================================================================*/

SELECT product_id,
SUM(quantity) AS qty
FROM order_items
GROUP BY product_id
ORDER BY qty DESC
LIMIT 1;

/*
REAL SCENARIO:
Demand analysis.
*/


/*=============================================================================
98. PRODUCT REVENUE LEADER
=============================================================================*/

SELECT product_id,
SUM(quantity * price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 1;

/*
REAL SCENARIO:
Profit analysis.
*/


/*=============================================================================
99. FULL SALES SUMMARY
=============================================================================*/

SELECT user_id,
SUM(total_amount)
FROM orders
GROUP BY user_id;

/*
REAL SCENARIO:
Business summary.
*/


/*=============================================================================
100. FINAL E-COMMERCE AGGREGATED REPORT
=============================================================================*/

SELECT u.user_id, u.name,
SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;

/*
REAL SCENARIO:
Final executive dashboard.
*/


/*=============================================================================

=============================================================================*/


/*=============================================================================
101. PAGINATION (MOST IMPORTANT MISSING TOPIC)
=============================================================================*/

/*
QUESTION:
How do you implement pagination in SQL to fetch records page by page?

WHAT IT DOES:
Returns a limited subset of rows using LIMIT + OFFSET.

WHY IT IS USED:
Prevents loading huge datasets at once and improves performance.

REAL SCENARIO:
E-commerce product listing pages (Amazon, Flipkart), where users see
10–20 products per page.
*/


/*=============================================================================
BASIC PAGINATION
=============================================================================*/

SELECT *
FROM products
ORDER BY product_id
LIMIT 10 OFFSET 0;

/*
PAGE 1:
Fetches first 10 records.

REAL SCENARIO:
First page of product catalog.
*/


/*=============================================================================
PAGE 2 PAGINATION
=============================================================================*/

SELECT *
FROM products
ORDER BY product_id
LIMIT 10 OFFSET 10;

/*
PAGE 2:
Skips first 10 and shows next 10 records.

REAL SCENARIO:
User clicks "Next Page".
*/


/*=============================================================================
DYNAMIC PAGINATION FORMULA
=============================================================================*/

/*
FORMULA:
LIMIT page_size OFFSET (page_number - 1) * page_size
*/


SELECT *
FROM products
ORDER BY product_id
LIMIT 10 OFFSET (2 - 1) * 10;

/*
REAL SCENARIO:
Backend APIs returning paginated results.
*/


/*=============================================================================
KEYSET PAGINATION (ADVANCED - INTERVIEW FAVORITE)
=============================================================================*/

/*
QUESTION:
How do you optimize pagination for large datasets?

WHAT IT DOES:
Uses last seen ID instead of OFFSET (faster approach).
*/


SELECT *
FROM products
WHERE product_id > 100
ORDER BY product_id
LIMIT 10;

/*
REAL SCENARIO:
Infinite scroll (Instagram, YouTube feeds).
*/


/*=============================================================================
COMPARISON (VERY IMPORTANT INTERVIEW POINT)
=============================================================================*/

/*
OFFSET PAGINATION:
- Easy
- Slow for large data (skips rows)

KEYSET PAGINATION:
- Fast
- Scales well
- Used in production systems
*/

/*
INTERVIEW LINE:
"OFFSET pagination becomes slow on large datasets, so production systems
prefer keyset pagination using indexed columns."
*/