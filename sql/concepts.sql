-- =========================================================================
-- CHARACTER FUNCTIONS & STRINGS
-- =========================================================================

-- CHAR_LENGTH('🔥') = 1 (Because it is 1 character to a human)
-- LENGTH('🔥') = 4 (Because it takes 4 bytes of computer storage)

-- Query shortest and longest city names with their lengths (HackerRank: Weather Observation Station 5)
SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY ASC LIMIT 1;
SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY ASC LIMIT 1;


-- =========================================================================
-- REGEX & PATTERN MATCHING
-- =========================================================================

/*
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[aeiou].*[aeiou]$'; -- Using regex

SELECT DISTINCT CITY 
FROM STATION 
WHERE (CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%')
  AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');


-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT LIKE 'a%' 
  AND CITY NOT LIKE 'e%' 
  AND CITY NOT LIKE 'i%' 
  AND CITY NOT LIKE 'o%' 
  AND CITY NOT LIKE 'u%';


-- =========================================================================
-- ADVANCED STRING MANIPULATION & SORTING
-- =========================================================================

/*
Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/
SELECT NAME 
FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY RIGHT(NAME, 3) ASC, ID ASC;

-- Key String Functions Reminder:
-- LIKE , NOT LIKE
-- REGEXP '^[]' , REGEXP '[]$'
-- RIGHT(column_name, how_many_characters)
-- LEFT(column_name, how_many_characters)
-- SUBSTRING(column, start_position, number_of_characters)


-- =========================================================================
-- MATH FUNCTIONS & GEOMETRY
-- =========================================================================

/*
Euclidean Distance Formula Implementation:
- MIN() and MAX(): Retrieve the boundary values from the table columns.
- POWER(expression, 2): Squares the differences.
- SQRT(): Computes the square root of the sum.
- ROUND(expression, 4): Formats the final value to show 4 decimal digits.
*/
SELECT ROUND(
    SQRT(
        POWER(MAX(LAT_N) - MIN(LAT_N), 2) + 
        POWER(MAX(LONG_W) - MIN(LONG_W), 2)
    ), 4)
FROM STATION;


-- =========================================================================
-- STANDARD INNER JOINS & AGGREGATIONS
-- =========================================================================

/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT SUM(CITY.POPULATION)
FROM CITY 
INNER JOIN COUNTRY
  ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Asia';


/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT CITY.NAME
FROM CITY 
INNER JOIN COUNTRY 
  ON CITY.COUNTRYCODE = COUNTRY.CODE 
WHERE COUNTRY.CONTINENT = 'Africa';


/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM COUNTRY  
JOIN CITY 
  ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;


-- =========================================================================
-- ADVANCED JOIN & CONDITIONAL REPORTING (VERY IMPORTANT)
-- =========================================================================

/*
HackerRank: "The Report" Problem Notes:
- We used BETWEEN because we did not have a traditional key to join tables. 
- Use BETWEEN ... AND ... when matching records based on a numeric range available in a reference table.
- CASE statements create a brand new column in your output dataset for final report display. 
- It does not overwrite, change, or delete any data in your original underlying database tables. 
- The alias string you declare after the END statement (END AS student_name) becomes the structural column header.
*/
SELECT
    CASE 
        WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME
        ELSE NULL
    END AS STUDENT_NAME,
    GRADES.GRADE,
    STUDENTS.MARKS 
FROM STUDENTS 
JOIN GRADES 
  ON STUDENTS.MARKS BETWEEN GRADES.MIN_MARK AND GRADES.MAX_MARK 
ORDER BY 
    GRADES.GRADE DESC, 
    STUDENT_NAME ASC, 
    STUDENTS.MARKS ASC;

--PLacements problem hackerrank medium--easy to understand multiple inner joins
-- You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
-- Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
/*
Enter your query here.
*/
SELECT s.name
from students s
INNER join friends f
on s.id=f.id
inner join packages  as s_salary
on s.id=s_salary.id
inner join packages as f_salary
on f.friend_id=f_salary.id
where f_salary.salary > s_salary.salary
ORDER by f_salary.salary ASC

-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
-- advanced joins symmetric pairs imp go thtough
SELECT f1.x, f1.y
FROM functions f1
JOIN functions f2 
    ON f1.x = f2.y AND f1.y = f2.x
WHERE f1.x < f1.y

UNION 


SELECT x, y
FROM functions
WHERE x = y
GROUP BY x, y
HAVING COUNT(*) > 1

ORDER BY x;