CREATE TABLE employee_tbl
(
id INT NOT NULL,
name VARCHAR(100) NOT NULL,
work_date DATE NOT NULL,
daily_typing_pages INT NOT NULL
);

SELECT * FROM employee_tbl;

INSERT INTO `employee_tbl` (`id`,`name`, `work_date`, `daily_typing_pages`) 
VALUES (1, 'John', '2007-01-24', 250);
INSERT INTO `employee_tbl` (`id`,`name`, `work_date`, `daily_typing_pages`) 
VALUES (2, 'Ram', '2007-05-27', 220);
INSERT INTO `employee_tbl` (`id`,`name`, `work_date`, `daily_typing_pages`) 
VALUES (3, 'Jack', '2007-05-06', 170);
INSERT INTO `employee_tbl` (`id`,`name`, `work_date`, `daily_typing_pages`) 
VALUES (3, 'Jack', '2007-04-06', 100);
INSERT INTO `employee_tbl` (`id`,`name`, `work_date`, `daily_typing_pages`) 
VALUES (4, 'Jill', '2007-04-06', 220);
INSERT INTO `employee_tbl` (`id`,`name`, `work_date`, `daily_typing_pages`) 
VALUES (5, 'Zara', '2007-06-06', 300);
INSERT INTO `employee_tbl` (`id`,`name`, `work_date`, `daily_typing_pages`) 
VALUES (5, 'Zara', '2007-02-06', 350);