SELECT DISTINCT name FROM employee;

SELECT * FROM employee
ORDER BY id  -- данные в БД не упорядочены, поэтому лучше использовать сортировку
LIMIT 2;

SELECT * FROM employee
ORDER BY id DESC
LIMIT 2, 3;

SELECT * FROM
(SELECT * FROM employee
ORDER BY id DESC
LIMIT 2, 3) AS t
ORDER BY id;