/*=============================================================================
MYSQL COMPLETE ROADMAP FOR INTERVIEWS + REAL PROJECTS
PART 1 : BEGINNER (TOPICS 1 - 17)
=============================================================================*/

/*=============================================================================
1. WHAT IS MYSQL
=============================================================================*/

CREATE DATABASE ecommerce;

/*
Interview Answer:
MySQL is an open-source Relational Database Management System (RDBMS) used to store, manage, and retrieve structured data using SQL (Structured Query Language).

Why We Need It:
It helps applications store data permanently in an organized format and allows fast querying and manipulation of data.

Real Scenario:
E-commerce platforms like Amazon or Flipkart use MySQL to store users, products, orders, and payments.

Follow-Up:
Q: Is MySQL a programming language?
A: No, it is a database management system that uses SQL for operations.
*/


/*=============================================================================
2. DATABASE
=============================================================================*/

CREATE DATABASE company_db;

/*
Interview Answer:
A database is an organized collection of related data stored electronically in a structured format.

Why We Need It:
It allows applications to store, retrieve, and manage large amounts of data efficiently.

Real Scenario:
A banking system stores customer details, account information, and transactions in separate databases.

Follow-Up:
Q: Can a system have multiple databases?
A: Yes, a single application can use multiple databases for different modules.
*/


/*=============================================================================
3. TABLE
=============================================================================*/

CREATE TABLE employees (
    id INT,
    name VARCHAR(100)
);

/*
Interview Answer:
A table is a structured format inside a database that stores data in rows and columns.

Why We Need It:
It organizes data in a way that is easy to query and maintain relationships.

Real Scenario:
An HR system stores employee details like ID, name, salary in an employee table.

Follow-Up:
Q: What is a row in a table?
A: A single record representing one entry.
*/


/*=============================================================================
4. DATA TYPES
=============================================================================*/

/*
Interview Answer:
Data types define the type of data that can be stored in a column.

Common Types:
INT, BIGINT, VARCHAR, CHAR, TEXT, DATE, DATETIME, TIMESTAMP, DECIMAL, FLOAT, BOOLEAN

Why We Need It:
To ensure data consistency and optimize storage.

Real Scenario:
Salary is stored as DECIMAL, names as VARCHAR, and dates as DATE.

Follow-Up:
Q: Why not store everything as text?
A: It would reduce performance and break data validation.
*/

-- Example usage
salary DECIMAL(10,2);


/*=============================================================================
5. CREATE DATABASE
=============================================================================*/

CREATE DATABASE company;


/*=============================================================================
6. DROP DATABASE
=============================================================================*/

DROP DATABASE company;

/*
Interview Answer:
DROP DATABASE removes the entire database permanently including all tables.

Real Scenario:
Removing old unused project databases.
*/


/*=============================================================================
7. CREATE TABLE
=============================================================================*/

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);


/*=============================================================================
8. DROP TABLE
=============================================================================*/

DROP TABLE employee;

/*
Interview Answer:
DROP TABLE deletes the entire table structure and data permanently.

Real Scenario:
Removing obsolete tables from legacy systems.
*/


/*=============================================================================
9. TRUNCATE TABLE
=============================================================================*/

TRUNCATE TABLE employee;

/*
Interview Answer:
TRUNCATE removes all rows from a table but keeps the structure intact.

Why We Need It:
Faster way to clear large tables compared to DELETE.

Real Scenario:
Clearing temporary logs or staging data.
*/


/*=============================================================================
10. INSERT
=============================================================================*/

INSERT INTO employee VALUES (1, 'John', 50000);

/*
Interview Answer:
INSERT is used to add new records into a table.

Real Scenario:
Adding a new employee record during onboarding.
*/


/*=============================================================================
11. SELECT
=============================================================================*/

SELECT * FROM employee;

/*
Interview Answer:
SELECT retrieves data from one or more tables.

Real Scenario:
Fetching employee list in HR dashboard.
*/


/*=============================================================================
12. WHERE
=============================================================================*/

SELECT * FROM employee
WHERE salary > 50000;

/*
Interview Answer:
WHERE filters rows based on a condition.

Real Scenario:
Fetching high salary employees for bonus calculation.
*/


/*=============================================================================
13. ORDER BY
=============================================================================*/

SELECT * FROM employee
ORDER BY salary DESC;

/*
Interview Answer:
ORDER BY sorts results in ascending or descending order.

Real Scenario:
Ranking employees by salary.
*/


/*=============================================================================
14. LIMIT
=============================================================================*/

SELECT * FROM employee
LIMIT 5;

/*
Interview Answer:
LIMIT restricts number of rows returned.

Real Scenario:
Pagination in web applications.
*/


/*=============================================================================
15. DISTINCT
=============================================================================*/

SELECT DISTINCT department FROM employee;

/*
Interview Answer:
DISTINCT removes duplicate values from result set.

Real Scenario:
Getting unique department list in HR system.
*/


/*=============================================================================
16. UPDATE
=============================================================================*/

UPDATE employee
SET salary = 60000
WHERE id = 1;

/*
Interview Answer:
UPDATE modifies existing records in a table.

Real Scenario:
Updating salary after appraisal.
*/


/*=============================================================================
17. DELETE
=============================================================================*/

DELETE FROM employee
WHERE id = 1;

/*
Interview Answer:
DELETE removes specific records from a table.

Real Scenario:
Deleting resigned employee records.

Follow-Up:
Q: Difference between DELETE and TRUNCATE?
A: DELETE removes selected rows, TRUNCATE removes all rows faster.
*/

/*=============================================================================
MYSQL COMPLETE ROADMAP FOR INTERVIEWS + REAL PROJECTS
PART 2 : INTERMEDIATE (TOPICS 18 - 39)
=============================================================================*/

/*=============================================================================
18. PRIMARY KEY
=============================================================================*/

CREATE TABLE Employee(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100)
);

/*
Interview Answer:
A Primary Key uniquely identifies each record in a table. It ensures no duplicate or NULL values exist and is used to maintain data integrity.

Why We Need It:
To uniquely identify every row and establish relationships between tables.

Real Scenario:
EmployeeID is used to uniquely identify each employee in HR systems.

Follow-Up:
Q: Can a table have multiple primary keys?
A: No, but it can have a composite primary key.
*/


/*=============================================================================
19. FOREIGN KEY
=============================================================================*/

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
);

/*
Interview Answer:
A Foreign Key creates a relationship between two tables by referencing the primary key of another table.

Why We Need It:
To maintain referential integrity and prevent invalid data entries.

Real Scenario:
Every order must belong to a valid customer in an e-commerce system.

Follow-Up:
Q: What happens if referenced data is missing?
A: MySQL throws a foreign key constraint error.
*/


/*=============================================================================
20. UNIQUE CONSTRAINT
=============================================================================*/

CREATE TABLE Users(
    Email VARCHAR(100) UNIQUE
);

/*
Interview Answer:
Ensures all values in a column are unique.

Why We Need It:
To prevent duplicate entries like duplicate emails.

Real Scenario:
User email must be unique in login systems.
*/


/*=============================================================================
21. NOT NULL CONSTRAINT
=============================================================================*/

CREATE TABLE Employee(
    Name VARCHAR(100) NOT NULL
);

/*
Interview Answer:
Ensures a column cannot have NULL values.

Why We Need It:
Mandatory fields must always contain data.

Real Scenario:
Employee name is required in HR databases.
*/


/*=============================================================================
22. DEFAULT CONSTRAINT
=============================================================================*/

CREATE TABLE Users(
    Status VARCHAR(20) DEFAULT 'ACTIVE'
);

/*
Interview Answer:
Assigns a default value when no value is provided during insert.

Why We Need It:
To reduce repetitive data entry.

Real Scenario:
New users are automatically set to ACTIVE status.
*/


/*=============================================================================
23. CHECK CONSTRAINT
=============================================================================*/

CREATE TABLE Employee(
    Age INT CHECK(Age >= 18)
);

/*
Interview Answer:
Restricts values based on a condition.

Why We Need It:
To enforce business rules at database level.

Real Scenario:
Employees must be at least 18 years old.
*/


/*=============================================================================
24. AUTO_INCREMENT
=============================================================================*/

CREATE TABLE Customer(
    CustomerID INT AUTO_INCREMENT PRIMARY KEY
);

/*
Interview Answer:
Automatically generates sequential numeric values.

Why We Need It:
To avoid manual ID assignment.

Real Scenario:
Customer IDs are auto-generated during registration.
*/


/*=============================================================================
25. AGGREGATE FUNCTIONS
=============================================================================*/

SELECT COUNT(*) FROM Employee;
SELECT SUM(Salary) FROM Employee;
SELECT AVG(Salary) FROM Employee;
SELECT MIN(Salary) FROM Employee;
SELECT MAX(Salary) FROM Employee;

/*
Interview Answer:
Aggregate functions perform calculations on multiple rows and return a single value.

Why We Need It:
Used in reporting and analytics.

Real Scenario:
Finding average salary in a company.
*/


/*=============================================================================
26. GROUP BY
=============================================================================*/

SELECT Department, COUNT(*)
FROM Employee
GROUP BY Department;

/*
Interview Answer:
GROUP BY groups rows with same values into summary rows.

Why We Need It:
Used with aggregate functions for reporting.

Real Scenario:
Number of employees in each department.
*/


/*=============================================================================
27. HAVING
=============================================================================*/

SELECT Department, COUNT(*)
FROM Employee
GROUP BY Department
HAVING COUNT(*) > 5;

/*
Interview Answer:
HAVING filters grouped results after aggregation.

Why We Need It:
To filter aggregated data.

Real Scenario:
Departments with more than 5 employees.
*/


/*=============================================================================
28. INNER JOIN
=============================================================================*/

SELECT *
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;

/*
Interview Answer:
Returns only matching records from both tables.

Why We Need It:
Used to combine related data from normalized tables.

Real Scenario:
Show customer details with their orders.

Follow-Up:
Q: What if no match exists?
A: Row is not included in result.
*/


/*=============================================================================
29. LEFT JOIN
=============================================================================*/

SELECT *
FROM Employee e
LEFT JOIN Project p
ON e.ProjectID = p.ProjectID;

/*
Interview Answer:
Returns all records from left table and matching records from right table.

Why We Need It:
To include all primary records even if related data is missing.

Real Scenario:
Show all employees even if they are not assigned to projects.
*/


/*=============================================================================
30. RIGHT JOIN
=============================================================================*/

SELECT *
FROM Employee e
RIGHT JOIN Department d
ON e.DepartmentID = d.DepartmentID;

/*
Interview Answer:
Returns all records from right table and matching from left table.

Why We Need It:
To ensure all records from secondary table are included.

Real Scenario:
Show all departments even if no employees exist.
*/


/*=============================================================================
31. SELF JOIN
=============================================================================*/

SELECT e.Name AS Employee, m.Name AS Manager
FROM Employee e
JOIN Employee m
ON e.ManagerID = m.EmployeeID;

/*
Interview Answer:
A table joins with itself.

Why We Need It:
Used for hierarchical relationships.

Real Scenario:
Employee-manager relationship mapping.
*/


/*=============================================================================
32. CROSS JOIN
=============================================================================*/

SELECT *
FROM Products
CROSS JOIN Sizes;

/*
Interview Answer:
Returns cartesian product of two tables.

Why We Need It:
Used when all combinations are required.

Real Scenario:
Generating all product-size combinations.
*/


/*=============================================================================
33. UNION
=============================================================================*/

SELECT Name FROM Employee
UNION
SELECT Name FROM Customer;

/*
Interview Answer:
Combines results and removes duplicates.

Why We Need It:
To merge similar datasets.

Real Scenario:
Combine employee and customer names.
*/


/*=============================================================================
34. UNION ALL
=============================================================================*/

SELECT Name FROM Employee
UNION ALL
SELECT Name FROM Customer;

/*
Interview Answer:
Combines results including duplicates.

Why We Need It:
Faster than UNION.

Real Scenario:
Logging combined activity records.
*/


/*=============================================================================
35. CASE
=============================================================================*/

SELECT Name,
CASE
    WHEN Salary > 100000 THEN 'High'
    ELSE 'Normal'
END AS SalaryCategory
FROM Employee;

/*
Interview Answer:
CASE works like IF-ELSE logic in SQL.

Why We Need It:
To apply conditional logic in queries.

Real Scenario:
Categorizing employees based on salary.
*/


/*=============================================================================
36. SUBQUERY
=============================================================================*/

SELECT *
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary) FROM Employee
);

/*
Interview Answer:
A query inside another query.

Why We Need It:
To break complex logic into smaller queries.

Real Scenario:
Find employees earning above average salary.
*/


/*=============================================================================
37. CORRELATED SUBQUERY
=============================================================================*/

SELECT *
FROM Employee e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DepartmentID = e.DepartmentID
);

/*
Interview Answer:
Subquery depends on outer query.

Why We Need It:
Used for row-wise comparisons.

Real Scenario:
Compare employee salary with department average.
*/


/*=============================================================================
38. VIEWS
=============================================================================*/

CREATE VIEW active_employees AS
SELECT * FROM Employee
WHERE Status = 'ACTIVE';

/*
Interview Answer:
A view is a virtual table based on a query.

Why We Need It:
To simplify complex queries and improve security.

Real Scenario:
HR accesses filtered employee data via views.
*/


/*=============================================================================
39. INDEX
=============================================================================*/

CREATE INDEX idx_name
ON Employee(Name);

/*
Interview Answer:
Index improves query performance by reducing full table scans.

Why We Need It:
To speed up search operations on large datasets.

Real Scenario:
Searching customers by email in large systems.

Follow-Up:
Q: Does index improve write performance?
A: No, it slows inserts/updates slightly because index must update.
*/
/*=============================================================================
MYSQL COMPLETE ROADMAP FOR INTERVIEWS + REAL PROJECTS
PART 3 : ADVANCED (TOPICS 40 - 65)
=============================================================================*/

/*=============================================================================
40. CLUSTERED INDEX
=============================================================================*/

CREATE TABLE Example1(
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

/*
Interview Answer:
A clustered index determines the physical order of data in a table.
In MySQL (InnoDB), the primary key automatically becomes the clustered index.

Why We Need It:
It improves data retrieval speed for primary key-based searches.

Real Scenario:
Fetching employee details using EmployeeID in HR systems.
*/


/*=============================================================================
41. NON CLUSTERED INDEX
=============================================================================*/

CREATE INDEX idx_name ON Employee(Name);

/*
Interview Answer:
A non-clustered index is a separate structure from the actual data that
helps speed up query retrieval.

Why We Need It:
To optimize searches on non-primary key columns.

Real Scenario:
Searching customers by email or username in login systems.
*/


/*=============================================================================
42. COMPOSITE INDEX
=============================================================================*/

CREATE INDEX idx_name_dept ON Employee(Name, Department);

/*
Interview Answer:
A composite index is created on multiple columns together.

Why We Need It:
To optimize queries that filter using multiple columns.

Real Scenario:
Filtering employees by department and name together.
*/


/*=============================================================================
43. COVERING INDEX
=============================================================================*/

CREATE INDEX idx_cover ON Employee(Name, Salary);

/*
Interview Answer:
A covering index contains all columns needed for a query so MySQL
does not need to access the table.

Why We Need It:
Improves performance by avoiding table lookup.

Real Scenario:
Fetching name and salary frequently in reports.
*/


/*=============================================================================
44. STORED PROCEDURE
=============================================================================*/

DELIMITER //
CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM Employee;
END //
DELIMITER ;

/*
Interview Answer:
A stored procedure is a precompiled set of SQL statements stored in the database.

Why We Need It:
To reuse logic and improve performance.

Real Scenario:
Generating monthly employee reports.
*/


/*=============================================================================
45. FUNCTION
=============================================================================*/

CREATE FUNCTION GetBonus(salary INT)
RETURNS INT
RETURN salary * 0.10;

/*
Interview Answer:
A function returns a single value based on input parameters.

Why We Need It:
To encapsulate reusable logic.

Real Scenario:
Calculating employee bonus based on salary.
*/


/*=============================================================================
46. TRIGGER
=============================================================================*/

CREATE TRIGGER before_insert_employee
BEFORE INSERT ON Employee
FOR EACH ROW
SET NEW.created_at = NOW();

/*
Interview Answer:
A trigger automatically executes when a specific event occurs.

Why We Need It:
To enforce rules automatically.

Real Scenario:
Auto-adding timestamps during record creation.
*/


/*=============================================================================
47. CURSOR
=============================================================================*/

DELIMITER //
CREATE PROCEDURE ProcessEmployees()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE empName VARCHAR(100);

    DECLARE cur CURSOR FOR SELECT Name FROM Employee;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO empName;
        IF done THEN
            LEAVE read_loop;
        END IF;
    END LOOP;

    CLOSE cur;
END //
DELIMITER ;

/*
Interview Answer:
A cursor is used to process rows one by one.

Why We Need It:
For row-by-row processing when set-based operations are not enough.

Real Scenario:
Sending personalized emails to employees.
*/


/*=============================================================================
48. TRANSACTIONS
=============================================================================*/

START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 1000
WHERE ID = 1;

UPDATE Accounts
SET Balance = Balance + 1000
WHERE ID = 2;

COMMIT;

/*
Interview Answer:
A transaction is a group of SQL statements executed as a single unit.

Why We Need It:
To ensure data consistency and avoid partial updates.

Real Scenario:
Bank money transfer system.

Follow-Up:
Q: What if one query fails?
A: ROLLBACK is used to undo changes.
*/


/*=============================================================================
49. ACID PROPERTIES
=============================================================================*/

/*
Interview Answer:
ACID ensures reliable transaction processing.

Atomicity: All or nothing execution
Consistency: Data remains valid
Isolation: Transactions do not interfere
Durability: Changes are permanent

Why We Need It:
To maintain data reliability in critical systems.

Real Scenario:
Banking and payment systems.
*/


/*=============================================================================
50. COMMIT
=============================================================================*/

COMMIT;

/*
Interview Answer:
Saves all changes made in a transaction permanently.

Real Scenario:
Finalizing a successful payment transaction.
*/


/*=============================================================================
51. ROLLBACK
=============================================================================*/

ROLLBACK;

/*
Interview Answer:
Undoes all changes made in a transaction.

Real Scenario:
Canceling failed payment operations.
*/


/*=============================================================================
52. SAVEPOINT
=============================================================================*/

SAVEPOINT sp1;

/*
Interview Answer:
Creates a point within a transaction to rollback partially.

Real Scenario:
Multi-step order processing system.
*/


/*=============================================================================
53. ISOLATION LEVELS
=============================================================================*/

/*
Interview Answer:
Defines how transaction changes are visible to other transactions.

Levels:
Read Uncommitted
Read Committed
Repeatable Read
Serializable

Why We Need It:
To control concurrency behavior.

Real Scenario:
Banking systems avoiding dirty reads.
*/


/*=============================================================================
54. DEADLOCK
=============================================================================*/

/*
Interview Answer:
A deadlock occurs when two transactions wait for each other indefinitely.

Why We Need It:
To understand and avoid system lock issues.

Real Scenario:
Two users updating same rows in different order.

Solution:
Use consistent locking order.
*/


/*=============================================================================
55. LOCKING
=============================================================================*/

/*
Interview Answer:
Locking controls access to data during transactions.

Types:
Shared Lock
Exclusive Lock

Why We Need It:
To prevent data inconsistency.

Real Scenario:
Preventing multiple users from updating same account simultaneously.
*/


/*=============================================================================
56. NORMALIZATION
=============================================================================*/

/*
Interview Answer:
Normalization organizes data to reduce redundancy and improve integrity.

Forms:
1NF, 2NF, 3NF, BCNF, 4NF, 5NF

Why We Need It:
To eliminate duplicate data.

Real Scenario:
Separating customer and order tables.
*/


/*=============================================================================
57. DENORMALIZATION
=============================================================================*/

/*
Interview Answer:
Denormalization adds redundancy to improve read performance.

Why We Need It:
To speed up reporting queries.

Real Scenario:
E-commerce dashboards using pre-joined data.
*/


/*=============================================================================
58. PARTITIONING
=============================================================================*/

CREATE TABLE Sales (
    ID INT,
    Amount DECIMAL(10,2)
)
PARTITION BY RANGE (ID) (
    PARTITION p1 VALUES LESS THAN (1000),
    PARTITION p2 VALUES LESS THAN (2000)
);

/*
Interview Answer:
Partitioning divides large tables into smaller parts.

Why We Need It:
To improve performance on large datasets.

Real Scenario:
Millions of transaction records split by date or ID.
*/


/*=============================================================================
59. REPLICATION
=============================================================================*/

/*
Interview Answer:
Replication copies data from one database server to another.

Types:
Master-Slave

Why We Need It:
For high availability and read scaling.

Real Scenario:
Production database with read replicas.
*/


/*=============================================================================
60. SHARDING
=============================================================================*/

/*
Interview Answer:
Sharding splits data across multiple databases.

Why We Need It:
To handle very large-scale applications.

Real Scenario:
Social media platforms distributing user data.
*/


/*=============================================================================
61. EXPLAIN
=============================================================================*/

EXPLAIN SELECT * FROM Employee WHERE Email = 'test@gmail.com';

/*
Interview Answer:
EXPLAIN shows query execution plan.

Why We Need It:
To analyze and optimize queries.

Real Scenario:
Identifying slow queries in production.
*/


/*=============================================================================
62. QUERY OPTIMIZATION
=============================================================================*/

/*
Interview Answer:
Query optimization improves performance of SQL queries.

Techniques:
Use indexes
Avoid SELECT *
Use proper joins
Use filtering early

Real Scenario:
Improving dashboard load time in applications.
*/


/*=============================================================================
63. CTE (COMMON TABLE EXPRESSION)
=============================================================================*/

WITH HighSalary AS (
    SELECT * FROM Employee WHERE Salary > 100000
)
SELECT * FROM HighSalary;

/*
Interview Answer:
CTE is a temporary result set used within a query.

Why We Need It:
To simplify complex queries.

Real Scenario:
Reporting systems with layered queries.
*/


/*=============================================================================
64. RECURSIVE CTE
=============================================================================*/

WITH RECURSIVE EmployeeTree AS (
    SELECT ID, ManagerID FROM Employee WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.ID, e.ManagerID
    FROM Employee e
    JOIN EmployeeTree et ON e.ManagerID = et.ID
)
SELECT * FROM EmployeeTree;

/*
Interview Answer:
Recursive CTE is used for hierarchical data.

Why We Need It:
To process tree-like structures.

Real Scenario:
Organizational hierarchy.
*/


/*=============================================================================
65. WINDOW FUNCTIONS
=============================================================================*/

SELECT Name,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS rn
FROM Employee;

/*
Interview Answer:
Window functions perform calculations across a set of rows without collapsing them.

Types:
ROW_NUMBER, RANK, DENSE_RANK, LEAD, LAG

Why We Need It:
For analytics and ranking.

Real Scenario:
Leaderboards and salary ranking systems.
*/
/*=============================================================================
MYSQL COMPLETE ROADMAP FOR INTERVIEWS + REAL PROJECTS
PART 4 : ADVANCED (TOPICS 66 - 90)
=============================================================================*/

/*=============================================================================
66. ROW_NUMBER()
=============================================================================*/

SELECT Name,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS rn
FROM Employee;

/*
Interview Answer:
ROW_NUMBER assigns a unique sequential number to each row based on ordering.

Why We Need It:
Used for ranking, pagination, and removing duplicates logically.

Real Scenario:
Assigning ranks to employees based on salary.
*/


/*=============================================================================
67. RANK()
=============================================================================*/

SELECT Name,
RANK() OVER (ORDER BY Salary DESC) AS rnk
FROM Employee;

/*
Interview Answer:
RANK assigns ranking but skips numbers when ties occur.

Why We Need It:
Used when equal values should share same rank.

Real Scenario:
Sports leaderboard rankings.
*/


/*=============================================================================
68. DENSE_RANK()
=============================================================================*/

SELECT Name,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS drnk
FROM Employee;

/*
Interview Answer:
DENSE_RANK assigns ranks without skipping numbers.

Why We Need It:
Used when continuous ranking is required.

Real Scenario:
Employee salary ranking system.
*/


/*=============================================================================
69. LEAD()
=============================================================================*/

SELECT Name,
LEAD(Salary) OVER (ORDER BY Salary DESC) AS next_salary
FROM Employee;

/*
Interview Answer:
LEAD returns the next row’s value in a result set.

Why We Need It:
Used for comparing current row with next row.

Real Scenario:
Salary comparison between employees in ranking.
*/


/*=============================================================================
70. LAG()
=============================================================================*/

SELECT Name,
LAG(Salary) OVER (ORDER BY Salary DESC) AS prev_salary
FROM Employee;

/*
Interview Answer:
LAG returns the previous row’s value in a result set.

Why We Need It:
Used for historical comparisons.

Real Scenario:
Comparing current month sales with previous month.
*/


/*=============================================================================
71. TEMPORARY TABLES
=============================================================================*/

CREATE TEMPORARY TABLE TempEmp AS
SELECT * FROM Employee;

/*
Interview Answer:
Temporary tables exist only during session and store intermediate results.

Why We Need It:
Used for complex query breakdowns.

Real Scenario:
Storing intermediate report data.
*/


/*=============================================================================
72. JSON DATA TYPE
=============================================================================*/

CREATE TABLE Users (
    Info JSON
);

/*
Interview Answer:
JSON data type stores semi-structured data in MySQL.

Why We Need It:
Useful for flexible schema requirements.

Real Scenario:
Storing user preferences and settings.
*/


/*=============================================================================
73. FULL TEXT SEARCH
=============================================================================*/

CREATE FULLTEXT INDEX idx_desc ON Products(Description);

/*
Interview Answer:
Full-text search is used for searching text data efficiently.

Why We Need It:
Better search than LIKE operator.

Real Scenario:
E-commerce product search feature.
*/


/*=============================================================================
74. EVENTS SCHEDULER
=============================================================================*/

CREATE EVENT delete_logs
ON SCHEDULE EVERY 1 DAY
DO DELETE FROM Logs WHERE created_at < NOW() - INTERVAL 30 DAY;

/*
Interview Answer:
Events scheduler runs SQL queries automatically at scheduled intervals.

Why We Need It:
For automation tasks.

Real Scenario:
Auto-deleting old logs.
*/


/*=============================================================================
75. BACKUP
=============================================================================*/

-- mysqldump database_name > backup.sql

/*
Interview Answer:
Backup is used to export database data for recovery purposes.

Why We Need It:
To prevent data loss.

Real Scenario:
Daily production database backup.
*/


/*=============================================================================
76. RESTORE
=============================================================================*/

-- mysql database_name < backup.sql

/*
Interview Answer:
Restore is used to import backup data into database.

Why We Need It:
To recover lost or corrupted data.

Real Scenario:
Restoring production after failure.
*/


/*=============================================================================
77. INNODB VS MYISAM
=============================================================================*/

/*
Interview Answer:

InnoDB:
- Supports transactions
- Foreign keys supported
- Row-level locking

MyISAM:
- Faster reads
- No transactions
- Table-level locking

Why We Need It:
To choose correct storage engine.

Real Scenario:
InnoDB used in banking systems, MyISAM in read-heavy systems.
*/


/*=============================================================================
78. 2ND HIGHEST SALARY
=============================================================================*/

SELECT MAX(Salary)
FROM Employee
WHERE Salary < (
    SELECT MAX(Salary) FROM Employee
);

/*
Interview Answer:
Finds second highest salary using subquery.

Why We Need It:
Common interview question for SQL logic testing.

Real Scenario:
Payroll systems ranking salaries.
*/


/*=============================================================================
79. NTH HIGHEST SALARY
=============================================================================*/

SELECT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

/*
Interview Answer:
Fetches Nth highest salary using LIMIT OFFSET.

Why We Need It:
Used in ranking-based queries.

Real Scenario:
Leaderboards or ranking systems.
*/


/*=============================================================================
80. DUPLICATE RECORDS
=============================================================================*/

SELECT Email, COUNT(*)
FROM Users
GROUP BY Email
HAVING COUNT(*) > 1;

/*
Interview Answer:
Finds duplicate records using GROUP BY and HAVING.

Why We Need It:
Data cleaning and validation.

Real Scenario:
Detecting duplicate user registrations.
*/


/*=============================================================================
81. DELETE DUPLICATES
=============================================================================*/

WITH CTE AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Email ORDER BY ID) AS rn
    FROM Users
)
DELETE FROM Users WHERE ID IN (
    SELECT ID FROM CTE WHERE rn > 1
);

/*
Interview Answer:
Deletes duplicate records using window function.

Why We Need It:
To clean data while keeping one record.

Real Scenario:
Removing duplicate email entries.
*/


/*=============================================================================
82. EMPLOYEES HIGHER THAN MANAGER
=============================================================================*/

SELECT e.Name
FROM Employee e
JOIN Employee m
ON e.ManagerID = m.ID
WHERE e.Salary > m.Salary;

/*
Interview Answer:
Compares employee salary with manager using self join.

Why We Need It:
Used in hierarchical comparisons.

Real Scenario:
HR performance analysis.
*/


/*=============================================================================
83. RUNNING TOTAL
=============================================================================*/

SELECT Name, Salary,
SUM(Salary) OVER (ORDER BY ID) AS running_total
FROM Employee;

/*
Interview Answer:
Running total calculates cumulative sum over rows.

Why We Need It:
Used in financial and reporting systems.

Real Scenario:
Monthly sales accumulation.
*/


/*=============================================================================
84. TOP N PER GROUP
=============================================================================*/

WITH Ranked AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rn
    FROM Employee
)
SELECT * FROM Ranked WHERE rn <= 3;

/*
Interview Answer:
Fetches top N records per group using window functions.

Why We Need It:
Used in departmental rankings.

Real Scenario:
Top 3 highest paid employees per department.
*/


/*=============================================================================
85. GAPS AND ISLANDS
=============================================================================*/

SELECT * FROM Employee;

/*
Interview Answer:
Gaps and islands problem identifies consecutive sequences in data.

Why We Need It:
Used in time-series and sequence analysis.

Real Scenario:
Detecting continuous login streaks.
*/


/*=============================================================================
86. PIVOT
=============================================================================*/

SELECT Department,
SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS MaleCount,
SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS FemaleCount
FROM Employee
GROUP BY Department;

/*
Interview Answer:
Pivot converts rows into columns for reporting.

Why We Need It:
Used in dashboards and analytics.

Real Scenario:
Gender distribution per department.
*/


/*=============================================================================
87. DYNAMIC SQL
=============================================================================*/

SET @sql = 'SELECT * FROM Employee';
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

/*
Interview Answer:
Dynamic SQL builds queries at runtime.

Why We Need It:
For flexible query execution.

Real Scenario:
Custom report generation systems.
*/


/*=============================================================================
88. EXECUTION PLAN
=============================================================================*/

EXPLAIN SELECT * FROM Employee WHERE ID = 10;

/*
Interview Answer:
Execution plan shows how MySQL executes a query.

Why We Need It:
For query optimization.

Real Scenario:
Debugging slow queries in production.
*/


/*=============================================================================
89. QUERY CACHE
=============================================================================*/

/*
Interview Answer:
Query cache stores results of queries for faster reuse (deprecated in modern MySQL versions).

Why We Need It:
To improve read performance in older systems.

Real Scenario:
Frequently executed read-only queries.
*/


/*=============================================================================
90. DATABASE DESIGN
=============================================================================*/

/*
Interview Answer:
Database design is the process of structuring tables, relationships,
and constraints to ensure efficiency and scalability.

Key Components:
- Primary Keys
- Foreign Keys
- Normalization
- Indexing

Why We Need It:
Good design ensures performance and scalability.

Real Scenario:
E-commerce systems with Users, Orders, Products, Payments, Inventory.
*/
-- Important IMP
/*=============================================================================
MYSQL COMPLETE ROADMAP FOR INTERVIEWS + REAL PROJECTS
PART 5 : TOP INTERVIEW QUESTIONS + SQL CODING PROBLEMS
=============================================================================*/

/*=============================================================================
TOP 10 INTERVIEW QUESTIONS
=============================================================================*/

/*
1. Difference between DELETE, DROP, TRUNCATE?

Answer:
DELETE removes specific rows with WHERE clause and can be rolled back.
TRUNCATE removes all rows but keeps structure and is faster but not fully logged.
DROP removes the entire table structure permanently.

Real Scenario:
DELETE: remove a single user account
TRUNCATE: clear staging table
DROP: remove unused table permanently
*/


/*
2. Difference between WHERE and HAVING?

Answer:
WHERE filters rows before grouping.
HAVING filters after GROUP BY is applied.

Real Scenario:
WHERE: filter employees before aggregation
HAVING: filter departments after counting employees
*/


/*
3. Difference between INNER JOIN and LEFT JOIN?

Answer:
INNER JOIN returns only matching records.
LEFT JOIN returns all left table records + matched right table records.

Real Scenario:
INNER JOIN: only customers with orders
LEFT JOIN: all customers including those without orders
*/


/*
4. What is an Index?

Answer:
Index is a database structure that speeds up data retrieval by avoiding full table scans.

Real Scenario:
Searching users by email in large systems
*/


/*
5. What is Composite Index?

Answer:
An index created on multiple columns to optimize multi-column filtering.

Real Scenario:
Search employees by department and role together
*/


/*
6. What are ACID properties?

Answer:
Atomicity, Consistency, Isolation, Durability ensure reliable transactions.

Real Scenario:
Banking transactions
*/


/*
7. What causes Deadlock?

Answer:
When two transactions wait for each other’s locked resources.

Real Scenario:
Two users updating same accounts in different order
*/


/*
8. Difference between RANK and DENSE_RANK?

Answer:
RANK skips numbers after ties.
DENSE_RANK does not skip numbers.

Real Scenario:
Sports leaderboard ranking
*/


/*
9. Explain Normalization.

Answer:
Normalization organizes data into multiple tables to reduce redundancy.

Real Scenario:
Separate customer and order tables
*/


/*
10. How to optimize slow queries?

Answer:
Use indexes, avoid SELECT *, optimize joins, use LIMIT, analyze with EXPLAIN.

Real Scenario:
Improving dashboard load time
*/


/*=============================================================================
SQL CODING PROBLEMS
=============================================================================*/

/*
1. SECOND HIGHEST SALARY
*/

SELECT MAX(Salary)
FROM Employee
WHERE Salary < (
    SELECT MAX(Salary) FROM Employee
);


/*
2. NTH HIGHEST SALARY
*/

SELECT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;


/*
3. FIND DUPLICATE RECORDS
*/

SELECT Email, COUNT(*)
FROM Users
GROUP BY Email
HAVING COUNT(*) > 1;


/*
4. DELETE DUPLICATES USING ROW_NUMBER
*/

WITH CTE AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Email ORDER BY ID) AS rn
    FROM Users
)
DELETE FROM Users
WHERE ID IN (
    SELECT ID FROM CTE WHERE rn > 1
);


/*
5. EMPLOYEES EARNING MORE THAN MANAGER
*/

SELECT e.Name
FROM Employee e
JOIN Employee m
ON e.ManagerID = m.ID
WHERE e.Salary > m.Salary;


/*
6. RUNNING TOTAL
*/

SELECT Name, Salary,
SUM(Salary) OVER (ORDER BY ID) AS RunningTotal
FROM Employee;


/*
7. TOP N PER GROUP
*/

WITH Ranked AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rn
    FROM Employee
)
SELECT *
FROM Ranked
WHERE rn <= 3;


/*
8. GAPS AND ISLANDS (CONCEPT)
*/

SELECT * FROM Employee;


/*
9. PIVOT EXAMPLE
*/

SELECT Department,
SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS MaleCount,
SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS FemaleCount
FROM Employee
GROUP BY Department;


/*
10. EXPLAIN QUERY PLAN
*/

EXPLAIN SELECT * FROM Employee WHERE ID = 10;