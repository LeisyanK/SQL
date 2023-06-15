-- Вывести N чисел Фибоначчи
DROP PROCEDURE fibo;	-- удаляем старую версию прпоцедуры, чтобы заново ее создать (перезаписать)

DELIMITER $$
CREATE PROCEDURE fibo(IN n INT)
BEGIN
	DECLARE n1 INT DEFAULT 0;
    DECLARE n2 INT DEFAULT 1;
    DECLARE temp INT;
    DECLARE result VARCHAR(100) DEFAULT '0 1';
    IF (n = 1) THEN SELECT CONCAT(n1);
    ELSEIF (n = 2) THEN SELECT CONCAT(n1, ' ', n2);
    ELSE
		WHILE n > 2 DO
			SET result := CONCAT(result, ' ', n1 + n2);
            SET temp := n2;
            SET n2 := n1 + n2;
            SET n1 := temp;            
			-- SELECT CONCAT(n1, n2, n2 + n1);
            SET n := n - 1;
		END WHILE;
        SELECT result;
    END IF;
END $$
DELIMITER ;

CALL fibo(10);

-- с помощью функции
DROP FUNCTION fibo;	-- удаляем старую версию прпоцедуры, чтобы заново ее создать (перезаписать)

DELIMITER $$
CREATE FUNCTION fibo(n INT)
RETURNS VARCHAR(100)
DETERMINISTIC 	-- добавила, т.к. была ошибка с кодом 1418
BEGIN
	DECLARE n1 INT DEFAULT 0;
    DECLARE n2 INT DEFAULT 1;
    DECLARE temp INT;
    DECLARE result VARCHAR(100) DEFAULT '0 1';
    IF (n = 1) THEN RETURN CONCAT(n1);
    ELSEIF (n = 2) THEN RETURN CONCAT(n1, ' ', n2);
    ELSE
		WHILE n > 2 DO
			SET result := CONCAT(result, ' ', n1 + n2);
            SET temp := n2;
            SET n2 := n1 + n2;
            SET n1 := temp;            
			-- SELECT CONCAT(n1, n2, n2 + n1);
            SET n := n - 1;
		END WHILE;
        RETURN result;
    END IF;
END $$
DELIMITER ;

SELECT fibo(10);