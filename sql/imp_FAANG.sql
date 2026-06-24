
/*=============================================================================
FAANG SQL UPGRADE PACK (MISSING INTERVIEW CONCEPTS)
COVERS: EDGE CASES + PERFORMANCE + ANALYTICS + ADVANCED PATTERNS
=============================================================================*/


/*=============================================================================
1. DISTINCT vs GROUP BY (INTERVIEW TRICK QUESTION)
=============================================================================*/

/*
QUESTION:
What is the difference between DISTINCT and GROUP BY?

ANSWER:
DISTINCT removes duplicate rows.
GROUP BY groups rows and allows aggregation.

REAL SCENARIO:
DISTINCT → remove duplicate emails
GROUP BY → calculate total spend per user
*/

SELECT DISTINCT email FROM users;

SELECT email, COUNT(*) FROM users GROUP BY email;


/*=============================================================================
2. IN vs EXISTS (VERY IMPORTANT FAANG QUESTION)
=============================================================================*/

/*
QUESTION:
What is difference between IN and EXISTS?

ANSWER:
IN → compares full result set
EXISTS → checks row existence (faster in correlated cases)

REAL SCENARIO:
Check users who placed orders
*/

-- IN version
SELECT * FROM users
WHERE user_id IN (SELECT user_id FROM orders);

-- EXISTS version (preferred in large datasets)
SELECT * FROM users u
WHERE EXISTS (
    SELECT 1 FROM orders o
    WHERE o.user_id = u.user_id
);


/*=============================================================================
3. NOT IN vs NOT EXISTS (NULL BUG TRAP)
=============================================================================*/

/*
QUESTION:
Why is NOT IN dangerous?

ANSWER:
If subquery contains NULL → result becomes empty.

REAL SCENARIO:
Find users who never ordered
*/

-- SAFE VERSION
SELECT * FROM users u
WHERE NOT EXISTS (
    SELECT 1 FROM orders o
    WHERE o.user_id = u.user_id
);


/*=============================================================================
4. COHORT ANALYSIS (FAANG ANALYTICS QUESTION)
=============================================================================*/

/*
QUESTION:
How do you track user retention over time?

REAL SCENARIO:
SaaS apps track monthly user retention
*/

SELECT
    user_id,
    MIN(order_date) AS cohort_date
FROM orders
GROUP BY user_id;


/*=============================================================================
5. RETENTION QUERY (MONTHLY ACTIVE USERS)
=============================================================================*/

/*
QUESTION:
How many users return after first month?

REAL SCENARIO:
Netflix / Spotify retention tracking
*/

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(DISTINCT user_id) AS active_users
FROM orders
GROUP BY month;


/*=============================================================================
6. CHURN ANALYSIS
=============================================================================*/

/*
QUESTION:
Find users who stopped using product.

REAL SCENARIO:
Subscription cancellation analysis
*/

SELECT u.user_id
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id
WHERE o.order_id IS NULL;


/*=============================================================================
7. FUNNEL ANALYSIS (VERY IMPORTANT)
=============================================================================*/

/*
QUESTION:
Track user journey: view → cart → purchase

REAL SCENARIO:
Amazon conversion tracking
*/

SELECT user_id,
SUM(CASE WHEN event = 'view' THEN 1 ELSE 0 END) AS views,
SUM(CASE WHEN event = 'cart' THEN 1 ELSE 0 END) AS carts,
SUM(CASE WHEN event = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM user_events
GROUP BY user_id;


/*=============================================================================
8. INDEX LEFTMOST PREFIX RULE
=============================================================================*/

/*
QUESTION:
Why composite index sometimes not used?

ANSWER:
MySQL uses leftmost prefix rule.

REAL SCENARIO:
Index (name, age)
Query on age alone → index NOT used
*/

CREATE INDEX idx_name_age ON employee(name, age);


/*=============================================================================
9. WHEN INDEX IS NOT USED
=============================================================================*/

/*
CASE:
- Low selectivity column
- Using functions on column
- Leading wildcard LIKE '%abc'

REAL SCENARIO:
Slow search queries
*/

SELECT * FROM users
WHERE LOWER(name) = 'john';


/*=============================================================================
10. TRANSACTION ANOMALIES (VERY IMPORTANT THEORY)
=============================================================================*/

/*
DIRTY READ:
Read uncommitted data

NON-REPEATABLE READ:
Same query gives different results

PHANTOM READ:
New rows appear in same query

REAL SCENARIO:
Banking systems consistency issues
*/


/*=============================================================================
11. ISOLATION LEVELS USAGE
=============================================================================*/

-- Higher isolation = more safety, less performance

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;


/*=============================================================================
12. DEADLOCK PREVENTION
=============================================================================*/

/*
QUESTION:
How to prevent deadlocks?

ANSWER:
- Always lock tables in same order
- Keep transactions short
- Use retry logic

REAL SCENARIO:
Payment gateway systems
*/


/*=============================================================================
13. PAGINATION (KEYSET - PRODUCTION LEVEL)
=============================================================================*/

/*
QUESTION:
Why OFFSET pagination is bad?

ANSWER:
Slow for large datasets

REAL SCENARIO:
Instagram infinite scroll
*/

SELECT * FROM posts
WHERE id > 1000
ORDER BY id
LIMIT 10;


/*=============================================================================
14. CURSOR BASED PAGINATION (BEST PRACTICE)
=============================================================================*/

-- Faster than OFFSET

SELECT * FROM posts
WHERE created_at < '2026-01-01'
ORDER BY created_at DESC
LIMIT 10;


/*=============================================================================
15. WINDOW FRAME EXPLANATION
=============================================================================*/

/*
QUESTION:
Difference between ROWS and RANGE?

ANSWER:
ROWS → physical rows
RANGE → value-based range

REAL SCENARIO:
Moving average calculations
*/

SELECT
order_date,
SUM(amount) OVER (
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_avg
FROM orders;


/*=============================================================================
16. FIRST_VALUE / LAST_VALUE ISSUE
=============================================================================*/

/*
QUESTION:
Why LAST_VALUE gives unexpected results?

ANSWER:
Needs window frame correction

REAL SCENARIO:
Analytics dashboards
*/

SELECT
order_date,
LAST_VALUE(total_amount) OVER (
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS last_val
FROM orders;


/*=============================================================================
17. UPSERT (VERY IMPORTANT IN SYSTEMS)
=============================================================================*/

-- Insert or update in one query

INSERT INTO users(user_id, email)
VALUES (1, 'a@test.com')
ON DUPLICATE KEY UPDATE email = VALUES(email);


/*=============================================================================
18. SOFT DELETE vs HARD DELETE
=============================================================================*/

/*
SOFT DELETE:
Mark record as deleted

HARD DELETE:
Remove permanently

REAL SCENARIO:
Amazon keeps order history → soft delete preferred
*/

UPDATE users
SET is_deleted = 1
WHERE user_id = 10;


/*=============================================================================
19. SLOW QUERY DEBUGGING FLOW
=============================================================================*/

/*
STEP 1:
Run EXPLAIN

STEP 2:
Check full scan

STEP 3:
Add index

STEP 4:
Reduce columns

REAL SCENARIO:
Production performance tuning
*/

EXPLAIN SELECT * FROM orders WHERE user_id = 10;


/*=============================================================================
20. FULL FAANG SUMMARY RULES
=============================================================================*/

/*
INTERVIEW GOLD RULES:

1. Prefer EXISTS over IN (large data)
2. Avoid SELECT *
3. Use indexes wisely
4. Use keyset pagination
5. Avoid functions on indexed columns
6. Normalize unless performance requires denormalization
7. Always handle NULL cases
8. Watch transaction isolation
9. Use EXPLAIN before optimizing
10. Think in terms of real systems (Amazon/Netflix scale)
*/


/*=============================================================================
END OF FAANG UPGRADE PACK
=============================================================================*/