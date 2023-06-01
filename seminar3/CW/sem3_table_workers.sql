CREATE TABLE workers
(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(50) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL
);

DESC workers;

INSERT INTO workers (name, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Иван', 24, 2000);

SELECT * FROM workers

-- UPDATE `seminar3`.`workers` SET `age` = '24' WHERE (`id` = '3');
-- UPDATE `seminar3`.`workers` SET `age` = '25' WHERE (`id` = '5');