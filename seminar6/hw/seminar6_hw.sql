-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
DROP PROCEDURE sec;

DELIMITER $$
CREATE PROCEDURE sec(IN sec INT)
BEGIN
	DECLARE days INT;	-- 60sec * 60min * 24hours = 86400 sec in a day
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    SET days := sec div 86400;
    -- SET hours := (sec - days * 86400) div 3600;
    SET hours := sec mod 86400 div 3600;
    -- SET minutes := (sec - days * 86400 - hours * 3600) div 60;
    SET minutes := sec mod 86400 mod 3600 div 60;
    SET seconds := sec mod 86400 mod 3600 mod 60;
    SELECT CONCAT(days, ' дней, ', hours, ' часов, ', minutes, ' минут, ', seconds, ' секунд.') AS Times;    
END $$
DELIMITER ;

CALL sec(123456);

-- функция 
DROP FUNCTION sec;

DELIMITER $$
CREATE FUNCTION sec(sec INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE days INT;	-- 60sec * 60min * 24hours = 86400 sec in a day
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    SET days := sec div 86400;
    -- SET hours := (sec - days * 86400) div 3600;
    SET hours := sec mod 86400 div 3600;
    -- SET minutes := (sec - days * 86400 - hours * 3600) div 60;
    SET minutes := sec mod 86400 mod 3600 div 60;
    SET seconds := sec mod 86400 mod 3600 mod 60;
    RETURN CONCAT(days, ' дней, ', hours, ' часов, ', minutes, ' минут, ', seconds, ' секунд.');    
END $$
DELIMITER ;

SELECT sec(123456) AS Times;

---------------------------------------------------------------------------------------------------------
-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS even;

DELIMITER $$
CREATE PROCEDURE even(IN num INT)
BEGIN
	DECLARE i INT DEFAULT 4;
    DECLARE result VARCHAR(100) DEFAULT 'Нет четных чисел до 1.';
    IF (num > 1) THEN
		SET result := '2 ';
		WHILE i <= num DO
			SET result := CONCAT(result, i, ' ');
			SET i := i + 2;
        END WHILE;
        -- SELECT result;
    END IF;
    SELECT result;
END $$
DELIMITER ;

CALL even(10);

-- используем функцию 

DROP FUNCTION IF EXISTS even;

DELIMITER $$
CREATE FUNCTION even(num INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 4;
    DECLARE result VARCHAR(100) DEFAULT 'Нет четных чисел до 1.';
    IF (num > 1) THEN
		SET result := '2 ';
		WHILE i <= num DO
			SET result := CONCAT(result, i, ' ');
			SET i := i + 2;
        END WHILE;
        -- SELECT result;
    END IF;
    RETURN result;
END $$
DELIMITER ;

SELECT even(15);