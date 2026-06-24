/*=============================================================================
FULL 100 SQL INTERVIEW PROBLEMS (51 - 100)
WITH INDEX TAGS FOR SEARCHING
PART 2 (ADVANCED LEVEL)
=============================================================================*/

/*=============================================================================
[INDEX: PAGINATION | LIMIT]
51. NTH HIGHEST SALARY (GENERIC)
=============================================================================*/

SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

/*
Interview:
Fetch Nth highest salary using LIMIT OFFSET.

Real Scenario:
Leaderboard pagination systems.
*/


/*=============================================================================
[INDEX: STRING | PATTERN]
52. FIND USERS STARTING WITH A
=============================================================================*/

SELECT *
FROM users
WHERE name LIKE 'A%';

/*
Interview:
String pattern matching.

Real Scenario:
Search autocomplete systems.
*/


/*=============================================================================
[INDEX: STRING | PATTERN]
53. FIND USERS ENDING WITH SON
=============================================================================*/

SELECT *
FROM users
WHERE name LIKE '%son';

/*
Interview:
Suffix-based search.

Real Scenario:
CRM filtering.
*/


/*=============================================================================
[INDEX: STRING | SEARCH]
54. EMAIL DOMAIN FILTER
=============================================================================*/

SELECT *
FROM users
WHERE email LIKE '%@gmail.com';

/*
Interview:
Domain-based filtering.

Real Scenario:
User segmentation.
*/


/*=============================================================================
[INDEX: DATE | FILTER]
55. LAST 7 DAYS ORDERS
=============================================================================*/

SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

/*
Interview:
Time-based filtering.

Real Scenario:
Recent activity dashboard.
*/


/*=============================================================================
[INDEX: DATE | ANALYTICS]
56. ORDERS THIS MONTH
=============================================================================*/

SELECT *
FROM orders
WHERE MONTH(order_date) = MONTH(CURDATE());

/*
Interview:
Monthly filtering.

Real Scenario:
Sales reports.
*/


/*=============================================================================
[INDEX: JOIN | LEFT JOIN]
57. USERS WITHOUT ORDERS
=============================================================================*/

SELECT u.*
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.user_id IS NULL;

/*
Interview:
Anti-join pattern.

Real Scenario:
Inactive users.
*/


/*=============================================================================
[INDEX: JOIN | INNER]
58. USERS WITH ORDERS ONLY
=============================================================================*/

SELECT DISTINCT u.*
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id;

/*
Interview:
Matching records only.

Real Scenario:
Active customers.
*/


/*=============================================================================
[INDEX: WINDOW | RANK]
59. TOP 1 PRODUCT PER CATEGORY
=============================================================================*/

WITH ranked AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS rn
    FROM products
)
SELECT * FROM ranked WHERE rn = 1;

/*
Interview:
Top per group.

Real Scenario:
E-commerce ranking.
*/


/*=============================================================================
[INDEX: WINDOW | RANK]
60. SECOND HIGHEST PER CATEGORY
=============================================================================*/

WITH ranked AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS rn
    FROM products
)
SELECT * FROM ranked WHERE rn = 2;

/*
Interview:
Nth item per group.
*/


/*=============================================================================
[INDEX: WINDOW | RUNNING]
61. RUNNING TOTAL SALES
=============================================================================*/

SELECT order_date,
SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

/*
Interview:
Cumulative analytics.
*/


/*=============================================================================
[INDEX: WINDOW | DIFFERENCE]
62. DAY OVER DAY SALES CHANGE
=============================================================================*/

SELECT order_date, total_amount,
total_amount - LAG(total_amount) OVER (ORDER BY order_date) AS diff
FROM orders;

/*
Interview:
Trend comparison.
*/


/*=============================================================================
[INDEX: WINDOW | LEAD]
63. NEXT DAY SALES COMPARISON
=============================================================================*/

SELECT order_date, total_amount,
LEAD(total_amount) OVER (ORDER BY order_date) AS next_day
FROM orders;

/*
Interview:
Forward comparison.
*/


/*=============================================================================
[INDEX: NULL | CLEAN]
64. REPLACE NULL WITH ZERO
=============================================================================*/

SELECT COALESCE(total_amount, 0)
FROM orders;

/*
Interview:
NULL handling.
*/


/*=============================================================================
[INDEX: NULL | CHECK]
65. COUNT NULLS IN COLUMN
=============================================================================*/

SELECT SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END)
FROM users;

/*
Interview:
Data quality check.
*/


/*=============================================================================
[INDEX: AGGREGATE | BUSINESS]
66. TOTAL ORDERS PER USER
=============================================================================*/

SELECT user_id, COUNT(*)
FROM orders
GROUP BY user_id;

/*
Interview:
Customer activity.
*/


/*=============================================================================
[INDEX: AGGREGATE | BUSINESS]
67. USERS WITH MORE THAN 5 ORDERS
=============================================================================*/

SELECT user_id, COUNT(*)
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 5;

/*
Interview:
Engagement filtering.
*/


/*=============================================================================
[INDEX: BUSINESS | VIP]
68. VIP CUSTOMERS
=============================================================================*/

SELECT user_id, SUM(total_amount) AS spend
FROM orders
GROUP BY user_id
HAVING SUM(total_amount) > 10000;

/*
Interview:
High value users.
*/


/*=============================================================================
[INDEX: SALES | PRODUCT]
69. TOP SELLING PRODUCT
=============================================================================*/

SELECT product_id, SUM(quantity) AS qty
FROM order_items
GROUP BY product_id
ORDER BY qty DESC
LIMIT 1;

/*
Interview:
Demand tracking.
*/


/*=============================================================================
[INDEX: SALES | REVENUE]
70. TOP REVENUE PRODUCT
=============================================================================*/

SELECT product_id,
SUM(quantity * price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 1;

/*
Interview:
Revenue optimization.
*/


/*=============================================================================
[INDEX: BUSINESS | KPI]
71. AVERAGE ORDER VALUE
=============================================================================*/

SELECT AVG(total_amount) FROM orders;

/*
Interview:
Business KPI.
*/


/*=============================================================================
[INDEX: BUSINESS | KPI]
72. TOTAL REVENUE
=============================================================================*/

SELECT SUM(total_amount) FROM orders;

/*
Interview:
Revenue calculation.
*/


/*=============================================================================
[INDEX: TIME | TREND]
73. MONTHLY SALES
=============================================================================*/

SELECT MONTH(order_date), SUM(total_amount)
FROM orders
GROUP BY MONTH(order_date);

/*
Interview:
Monthly trend.
*/


/*=============================================================================
[INDEX: TIME | TREND]
74. YEARLY SALES
=============================================================================*/

SELECT YEAR(order_date), SUM(total_amount)
FROM orders
GROUP BY YEAR(order_date);

/*
Interview:
Yearly comparison.
*/


/*=============================================================================
[INDEX: JOIN | COMPLEX]
75. FULL ORDER DETAILS
=============================================================================*/

SELECT o.order_id, u.name, p.name
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

/*
Interview:
Multi-table joins.
*/


/*=============================================================================
[INDEX: JOIN | LEFT]
76. PRODUCTS NEVER SOLD
=============================================================================*/

SELECT p.*
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

/*
Interview:
Unpurchased products.
*/


/*=============================================================================
[INDEX: CLEANING | DUPLICATES]
77. FIND DUPLICATE USERS
=============================================================================*/

SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

/*
Interview:
Duplicate detection.
*/


/*=============================================================================
[INDEX: CLEANING | DUPLICATES]
78. REMOVE DUPLICATES
=============================================================================*/

WITH cte AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY user_id) AS rn
    FROM users
)
DELETE FROM users
WHERE user_id IN (SELECT user_id FROM cte WHERE rn > 1);

/*
Interview:
Data deduplication.
*/


/*=============================================================================
[INDEX: SUBQUERY | ANALYTICS]
79. ABOVE AVERAGE PRICE PRODUCTS
=============================================================================*/

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

/*
Interview:
Benchmark comparison.
*/


/*=============================================================================
[INDEX: CORRELATED | ANALYTICS]
80. CATEGORY ABOVE AVG PRICE
=============================================================================*/

SELECT *
FROM products p
WHERE price > (
    SELECT AVG(price)
    FROM products
    WHERE category = p.category
);

/*
Interview:
Advanced correlation.
*/


/*=============================================================================
[INDEX: STRING | SEARCH]
81. SEARCH PRODUCTS CONTAINING 'PRO'
=============================================================================*/

SELECT *
FROM products
WHERE name LIKE '%pro%';

/*
Interview:
Search feature.
*/


/*=============================================================================
[INDEX: BUSINESS | SEGMENT]
82. CUSTOMER SEGMENTATION
=============================================================================*/

SELECT user_id,
CASE
    WHEN SUM(total_amount) > 10000 THEN 'VIP'
    WHEN SUM(total_amount) > 5000 THEN 'LOYAL'
    ELSE 'NEW'
END AS segment
FROM orders
GROUP BY user_id;

/*
Interview:
Marketing segmentation.
*/


/*=============================================================================
[INDEX: BUSINESS | CLV]
83. CUSTOMER LIFETIME VALUE
=============================================================================*/

SELECT user_id, SUM(total_amount) AS clv
FROM orders
GROUP BY user_id;

/*
Interview:
Customer value.
*/


/*=============================================================================
[INDEX: INVENTORY]
84. LOW STOCK ALERT
=============================================================================*/

SELECT *
FROM products
WHERE stock < 10;

/*
Interview:
Inventory system.
*/


/*=============================================================================
[INDEX: INVENTORY]
85. OUT OF STOCK
=============================================================================*/

SELECT *
FROM products
WHERE stock = 0;

/*
Interview:
Stock monitoring.
*/


/*=============================================================================
[INDEX: GAP | SEQUENCE]
86. FIND MISSING ORDER IDS
=============================================================================*/

SELECT o1.order_id + 1 AS missing_id
FROM orders o1
LEFT JOIN orders o2
ON o1.order_id + 1 = o2.order_id
WHERE o2.order_id IS NULL;

/*
Interview:
Sequence gaps.
*/


/*=============================================================================
[INDEX: BUSINESS | FUNNEL]
87. SALES FUNNEL (CONCEPT)
=============================================================================*/

/*
Views → Cart → Checkout → Payment

Interview:
Conversion tracking.
*/


/*=============================================================================
[INDEX: ADVANCED | JSON]
88. JSON FIELD QUERY (IF SUPPORTED)
=============================================================================*/

SELECT JSON_EXTRACT(details, '$.price')
FROM orders;

/*
Interview:
Modern DB usage.
*/


/*=============================================================================
[INDEX: PERFORMANCE | INDEXING]
89. FIND SLOW QUERY TARGET
=============================================================================*/

EXPLAIN SELECT * FROM orders WHERE user_id = 10;

/*
Interview:
Query optimization.
*/


/*=============================================================================
[INDEX: PERFORMANCE]
90. INDEX USAGE EXAMPLE
=============================================================================*/

CREATE INDEX idx_user_id ON orders(user_id);

/*
Interview:
Speed optimization.
*/


/*=============================================================================
[INDEX: WINDOW | ADVANCED]
91. MOVING AVERAGE SALES
=============================================================================*/

SELECT order_date,
AVG(total_amount) OVER (ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM orders;

/*
Interview:
Trend smoothing.
*/


/*=============================================================================
[INDEX: WINDOW | ADVANCED]
92. FIRST VALUE
=============================================================================*/

SELECT order_date,
FIRST_VALUE(total_amount) OVER (ORDER BY order_date)
FROM orders;

/*
Interview:
Baseline comparison.
*/


/*=============================================================================
[INDEX: WINDOW | ADVANCED]
93. LAST VALUE
=============================================================================*/

SELECT order_date,
LAST_VALUE(total_amount) OVER (ORDER BY order_date)
FROM orders;

/*
Interview:
End value tracking.
*/


/*=============================================================================
[INDEX: BUSINESS | RETENTION]
94. USER RETENTION (CONCEPT)
=============================================================================*/

/*
Track users returning after first order.

Interview:
Retention analytics.
*/


/*=============================================================================
[INDEX: BUSINESS | COHORT]
95. COHORT ANALYSIS (CONCEPT)
=============================================================================*/

/*
Group users by signup month.

Interview:
Growth analytics.
*/


/*=============================================================================
[INDEX: BUSINESS | REVENUE]
96. REVENUE PER DAY
=============================================================================*/

SELECT order_date, SUM(total_amount)
FROM orders
GROUP BY order_date;

/*
Interview:
Daily revenue tracking.
*/


/*=============================================================================
[INDEX: BUSINESS | RANK]
97. TOP CUSTOMERS
=============================================================================*/

SELECT user_id, SUM(total_amount) AS spend
FROM orders
GROUP BY user_id
ORDER BY spend DESC
LIMIT 5;

/*
Interview:
VIP users.
*/


/*=============================================================================
[INDEX: BUSINESS | PRODUCT]
98. MOST VIEWED PRODUCT (CONCEPT)
=============================================================================*/

/*
Requires logs table.

Interview:
Recommendation systems.
*/


/*=============================================================================
[INDEX: FINAL]
99. FULL SALES REPORT
=============================================================================*/

SELECT user_id, SUM(total_amount)
FROM orders
GROUP BY user_id;

/*
Interview:
Business summary.
*/


/*=============================================================================
[INDEX: FINAL]
100. END TO END ECOMMERCE QUERY
=============================================================================*/

SELECT u.user_id, u.name, SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id;

/*
Interview:
Final aggregation query.
*/


/*=============================================================================
END OF FULL 100 SQL INTERVIEW PROBLEMS
=============================================================================*/