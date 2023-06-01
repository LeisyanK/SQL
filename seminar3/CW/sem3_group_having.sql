SELECT age, SUM(salary) AS sum_salary 
FROM workers
GROUP BY age HAVING sum_salary >= 1000;

SELECT age, COUNT(*) AS schet 
FROM workers
GROUP BY age HAVING schet <= 2;

SELECT age, COUNT(*) AS schet 
FROM workers
GROUP BY age HAVING schet BETWEEN 0  AND 2;

SELECT age, COUNT(*) AS schet 
FROM workers
GROUP BY age HAVING schet IN (1, 2);