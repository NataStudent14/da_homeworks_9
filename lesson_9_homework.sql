--task1  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem

SELECT
    CASE WHEN g.Grade < 8 THEN NULL ELSE s.Name END AS Name,
    g.Grade,
    s.Marks
FROM
    Students s JOIN Grades g ON s.Marks BETWEEN g.Min_Mark and g.Max_Mark
ORDER BY
    g.Grade DESC,
    Name,
    s.Marks;

--task2  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/occupations/problem

SELECT Doctor, Professor, Singer, Actor 
FROM 
(
SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rn, name, occupation FROM occupations) 
PIVOT 
(MAX(name) FOR occupation IN ('Doctor' as Doctor,'Professor' as Professor, 'Singer' as Singer, 'Actor' as Actor)) 
ORDER BY rn;

--task3  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-9/problem

SELECT DISTINCT city FROM station WHERE NOT (city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%');

--task4  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-10/problem

SELECT DISTINCT city FROM station WHERE NOT (city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u');  

--task5  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-11/problem

SELECT DISTINCT city FROM station WHERE 
(NOT (city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%') 
OR NOT(city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u')); 

--task6  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-12/problem

SELECT DISTINCT city FROM station WHERE NOT 
((city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR city LIKE 'U%')  
OR (city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u'));

--task7  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/salary-of-employees/problem

SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;

--task8  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem

SELECT
    CASE WHEN G.Grade > 7 THEN S.Name ELSE 'NULL' END AS NameOrNull
    , G.Grade
    , S.Marks
FROM Students S
JOIN Grades G ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
ORDER BY G.Grade DESC, NameOrNull ASC, S.Marks ASC;