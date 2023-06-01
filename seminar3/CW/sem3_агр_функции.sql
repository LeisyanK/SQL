SELECT sum(daily_typing_pages)
FROM employee_tbl;

SELECT id, name, sum(daily_typing_pages)
FROM employee_tbl
GROUP BY id, name;

SELECT COUNT(*)
FROM employee_tbl;

SELECT COUNT(DISTINCT name)
FROM employee_tbl;

SELECT work_date, AVG(daily_typing_pages)
FROM employee_tbl
GROUP BY work_date;

SELECT AVG(daily_typing_pages),
SUM(daily_typing_pages) AS 'Сумма',
COUNT(*) AS 'Количество',
SUM(daily_typing_pages) / COUNT(*) AS 'Среднее'
FROM employee_tbl
-- GROUP BY work_date;