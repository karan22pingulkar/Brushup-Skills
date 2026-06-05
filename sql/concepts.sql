-- char_length('🔥') = 1 (Because it is 1 character to a human)
-- length('🔥') = 4 (Because it takes 4 bytes of computer storage)


select city, length(city) from station order by length(city) asc, city asc limit 1;
select city, length(city) from station order by length(city) desc, city asc limit 1;
