SELECT age, SUM(salary) FROM workers
GROUP BY age;

SELECT age, MAX(salary) FROM workers
GROUP BY age;

SELECT age, MIN(salary) FROM workers
GROUP BY age;

SELECT age, 
MAX(salary) AS 'Максимальная', 
MIN(salary) AS 'Минимальная', 
AVG(salary) AS 'Средняя'
FROM workers
GROUP BY age;