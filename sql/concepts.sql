-- char_length('🔥') = 1 (Because it is 1 character to a human)
-- length('🔥') = 4 (Because it takes 4 bytes of computer storage)


select city, length(city) from station order by length(city) asc, city asc limit 1;
select city, length(city) from station order by length(city) desc, city asc limit 1;



/*
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/
SELECT distinct city from station where city regexp '^[aeiou].*[aeiou]$' --using regex


SELECT DISTINCT city 
FROM station 
WHERE (city LIKE 'a%' OR city LIKE 'e%' OR city LIKE 'i%' OR city LIKE 'o%' OR city LIKE 'u%')
  AND (city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u');


-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city 
FROM station 
WHERE city NOT LIKE 'a%' 
  AND city NOT LIKE 'e%' 
  AND city NOT LIKE 'i%' 
  AND city NOT LIKE 'o%' 
  AND city NOT LIKE 'u%';

-- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT name from students where 
marks > 75 ORDER BY
right (name,3)  ASC,id ASC


like ,not like, regexp '^[]',regexp '[]$' ,right(columnname,how_mamny_characters) ,left (columnname,how_mamny_characters ) ,SUBSTRING(column, start_position, number_of_characters)


-- euclidean formula

-- MIN() and MAX(): Retrieve the boundary values from the table columns.
-- POWER(expression, 2): Squares the differences.
-- SQRT(): Computes the square root of the sum.
-- ROUND(expression, 4): Formats the final value to show 4 decimal digits
SELECT ROUND(
    SQRT(
        POWER(MAX(LAT_N) - MIN(LAT_N), 2) + 
        POWER(MAX(LONG_W) - MIN(LONG_W), 2)
    ), 4)
FROM STATION;



-- join questions
-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT sum(city.population)
from city INNER JOIN country
on CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = 'Asia';

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT city.name
 from city inner JOIN
country on  CITY.CountryCode = COUNTRY.Code 
WHERE country.continent='Africa';
-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT COUNTRY.Continent ,Floor(avg(CITY.Population))
from country  JOIN
city on CITY.CountryCode = COUNTRY.Code
GROUP by COUNTRY.Continent