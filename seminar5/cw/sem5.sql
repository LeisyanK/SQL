select * from employee;

-- Ранжирование
-- Вывести список всех сотрудников и указать место в рейтинге по зарплатам
SELECT
	DENSE_RANK() OVER(ORDER BY salary DESC) AS rank_salary,
    CONCAT(name, ' ', surname),
    speciality,
    salary
FROM employee;

-- Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но по какой должности
SELECT
	DENSE_RANK() OVER(PARTITION BY speciality ORDER BY salary DESC) AS rank_salary,
    CONCAT(name, ' ', surname),
    speciality,
    salary
FROM employee;

-- Найти самых высокооплачиваемых сотрудников по каждой должности
SELECT *
FROM (
	SELECT
		DENSE_RANK() OVER(PARTITION BY speciality ORDER BY salary DESC) AS rank_salary,
		CONCAT(name, ' ', surname) AS person   ,
		speciality,
		salary
	FROM employee) AS rating
WHERE rank_salary = 1
ORDER BY salary DESC;

-- Сравнение со смещением

-- Вывести список всех сотрудников, отсортировав по зарплатам в порядке убывания и 
-- указать, на сколько процентов ЗП меньше, чем у сотрудника со следующей (по значению) зарплатой 
SELECT 
	id,
	CONCAT(name, ' ', surname) AS person   ,
	speciality,
	salary,
	LEAD(salary, 1, 0) OVER(ORDER BY salary DESC) AS last_salary,
    ROUND(salary-LEAD(salary, 1, 0) OVER(ORDER BY salary DESC))*100/salary AS diff_persent
--    ROUND(salary-last_salary)*100/salary AS diff_persent1
FROM employee;

-- Агрегация

-- Вывести всех сотрудников, отсортировав по зарплатам в рамках каждой должности и рассчитать:
-- общую сумму зарплат для каждой должности
-- процентное соотношение каждой зарплаты от общей суммы по должности 
-- среднюю зарплату по каждой должности 
-- процентное соотношение каждой зарплаты к средней зарплате по должности 
SELECT 
	id,
	CONCAT(name, ' ', surname) AS person   ,
	speciality,
	salary,
    SUM(salary) OVER(PARTITION BY speciality ORDER BY salary) AS summa, -- непонятная сумма
    SUM(salary) OVER(PARTITION BY speciality) AS salary_group_sum, -- #1
    ROUND(salary*100/(SUM(salary) OVER(PARTITION BY speciality))) AS percent_sum, -- #2
    AVG(salary) OVER(PARTITION BY speciality) AS salary_group_avg, -- #3
    ROUND(salary*100/AVG(salary) OVER(PARTITION BY speciality)) AS percent_avg
FROM employee;

-- второй вариант
SELECT 
	id,
	CONCAT(name, ' ', surname) AS person   ,
	speciality,
	salary,
    SUM(salary) OVER(PARTITION BY speciality ORDER BY salary) AS summa, -- непонятная сумма
    SUM(salary) OVER w AS salary_group_sum, -- #1
    ROUND(salary*100/SUM(salary) OVER w) AS percent_sum, -- #2
    AVG(salary) OVER w AS salary_group_avg, -- #3
    ROUND(salary*100/AVG(salary) OVER w) AS percent_avg
FROM employee
WINDOW w AS (PARTITION BY speciality);  -- используем именованное окно

-- примеры использования оконных функций
SELECT 
	id,
	CONCAT(name, ' ', surname) AS person   ,
	salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS 'ROW_NUMBER',
    ROW_NUMBER() OVER(ORDER BY salary ASC) AS 'ROW_NUMBER',
    RANK() OVER(ORDER BY salary DESC) AS 'RANK',
    DENSE_RANK() OVER(ORDER BY salary DESC) AS 'DENSE_RANK',
    NTILE(3) OVER(ORDER BY salary DESC) AS 'NTILE'
FROM employee;