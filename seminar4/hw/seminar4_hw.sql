select * from auto;
-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
SELECT mark, color, count(mark) AS 'количество'
FROM auto
WHERE mark IN ('LADA', 'BMW')
GROUP BY mark, color;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки
SELECT mark, count(mark) AS 'этой марки', 
	(SELECT count(*) 
     FROM auto b 
     WHERE b.mark <> a.mark
	) AS 'других марок'
FROM auto a
GROUP BY mark;


/*Задание №3.
Даны 2 таблицы, созданные следующим образом:
*/
create table test_a (id INT, data varchar(1));
create table test_b (id INT);
insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя 
-- ключевого слова NOT.
SELECT a.* -- , b.* 
FROM test_a a
LEFT JOIN test_b b ON a.id = b.id 
WHERE b.id IS NULL;

SELECT * FROM test_a
WHERE id NOT IN
	(SELECT a.id FROM test_a a
	 JOIN test_b b ON a.id = b.id
     );