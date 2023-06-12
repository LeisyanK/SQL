SELECT * FROM Cars;

-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW Cars2 AS 
	SELECT * 
    FROM Cars 
    WHERE Cost < 25000;
    
-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
ALTER VIEW Cars2 AS 
	SELECT *
    FROM Cars
    WHERE Cost < 30000;
    
-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW Cars3 AS 
	SELECT * 
    FROM Cars 
    WHERE Name = 'Skoda' OR Name = 'Audi';

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю
SELECT o.ord_datetime, a.an_name, a.an_price FROM Orders o
	LEFT JOIN Analysis a
    ON o.ord_an = an_id
WHERE o.ord_datetime > '2020-02-05' AND o.ord_datetime < '2020-02-12'
ORDER BY ord_datetime;

-- Добавьте новый столбец под названием «время до следующей станции»
SELECT * FROM Shedule;
SELECT *,
	LEAD(Station_Time) OVER(PARTITION BY Train_Id) AS Next_Time,
    -- LEAD(Station_Time) OVER(PARTITION BY Train_Id) - Station_Time AS Next_Time,
    TIMEDIFF(LEAD(Station_Time) OVER(PARTITION BY Train_Id), Station_Time) AS "время до следующей станции"
FROM Shedule;