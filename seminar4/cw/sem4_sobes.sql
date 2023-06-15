-- Собеседования
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);


CREATE TABLE  CITY 
(	
    CITYCODE INT PRIMARY KEY,
	CITYNAME VARCHAR(50), 
	PEOPLES INT 
);


CREATE TABLE  MAN 
(	
	PHONENUM VARCHAR(15) PRIMARY KEY , 
	FIRSTNAME VARCHAR(50),
	LASTNAME VARCHAR(50),  
	CITYCODE INT, 
	YEAROLD INT	 
);


 -- AUTO
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);


 -- CITY
INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(1,'Москва', 10000000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(2,'Владимир', 500000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(3, 'Орел', 300000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(4,'Курск', 200000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(5, 'Казань', 2000000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(7, 'Котлас', 110000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(8, 'Мурманск', 400000);


INSERT INTO CITY (CITYCODE,CITYNAME,PEOPLES)
VALUES(9, 'Ярославль', 500000);

-- MAN
INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9152222289','Андрей','Ларионов', 1, 22);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9152222222','Максим','Москитов', 1, 31);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9153333333','Олег','Денисов', 3, 34);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9173333334','Алиса','Никина', 4, 31);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9173333335','Таня','Иванова', 4, 31);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9213333336','Алексей','Иванов', 7, 25);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9213333331','Андрей','Некрасов', 2, 27);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9213333332','Миша','Рогозин', 2, 21);


INSERT INTO MAN (PHONENUM,FIRSTNAME,LASTNAME,CITYCODE,YEAROLD)
VALUES('9214444444','Алексей','Галкин', 1, 38);

/* 1.	Выбрать код , название города и популяцию , код , города и популяцию где код города больше 
текущего кода города на 2
*/
select citycode, cityname, peoples
from city a, city b;

select a.citycode, a.cityname, a.peoples, b.citycode, b.cityname, b.peoples
from city a
join city b on a.citycode + 2 = b.citycode;

select a.citycode, a.cityname, a.peoples, b.citycode, b.cityname, b.peoples
from city a
left join city b on a.citycode + 2 = b.citycode;

-- 2.	Вывести марку авто - а так же сколько авто такой марки в таблице , вывести записи где 
-- количество авто такой марки больше 2, записи на должны дублироваться
select * from auto;
select mark, count(*) as c
from auto
group by mark
having c > 2;
-- подзапрос


-- 3.	Вывести Марку и цвет автомобиля - имя и фамилию покупателя, для всех покупателей, которые живут 
-- в городе с населением больше 1 млн человек.
select DISTINCT a.mark, a.color, m.firstname, m.lastname, m.PHONENUM, c.cityname from auto a, man m, city c
where m.PHONENUM = a.PHONENUM and c.CITYCODE = m.CITYCODE and c.peoples > 1000000;
select * from man;

-- 4.	Вывести на экран людей которые живут в городах с населением больше 1000000 , если людей с таким 
-- же именем нет в таблице MAN
select * from man;
select * from city;

select m.firstname from man m, city c
where m.citycode = c.citycode and c.peoples > 1000000;

select m.firstname -- , count(m.firstname) as C 
from man m, city c
where m.citycode = c.citycode and c.peoples > 1000000
group by m.firstname having count(m.firstname) = 1;

