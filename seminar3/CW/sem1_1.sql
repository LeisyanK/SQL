use seminar3;

create table employee (id int, name varchar(100), surname varchar(100), speciality varchar(100), seniority int, salary int, age int);

DESC employee;

alter table employee
add primary key (id);

alter table employee
modify id int not null auto_increment;

select * from employee;

INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Вася', 'Васькин', 'начальник', '40', '100000', '60');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Петя', 'Петькин', 'начальник', '8', '70000', '30');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Катя', 'Каткина', 'инженер', '2', '70000', '25');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Саша', 'Сашкин', 'инженер', '12', '50000', '35');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Иван', 'Иванов', 'рабочий', '40', '30000', '59');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Петр', 'Петров', 'рабочий', '20', '25000', '40');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Сидор', 'Сидоров', 'рабочий', '10', '20000', '35');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Антон', 'Антонов', 'рабочий', '8', '19000', '28');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Юра', 'Юркин', 'рабочий', '5', '15000', '25');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Максим', 'Воронин', 'рабочий', '2', '11000', '22');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Юра', 'Галкин', 'рабочий', '3', '12000', '24');
INSERT INTO `seminar3`.`employee` (`name`, `surname`, `speciality`, `seniority`, `salary`, `age`) VALUES ('Люся', 'Люськина', 'уборщик', '10', '10000', '49');
