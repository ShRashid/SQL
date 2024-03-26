-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP FUNCTION IF EXISTS format_seconds;

DELIMITER $$

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
	DECLARE result VARCHAR(255);
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;

    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds % 86400;
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

    RETURN result;
END$$

DELIMITER ;

SELECT format_seconds(123456);

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS Numbers;
DELIMITER $$
CREATE PROCEDURE Numbers(n INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    
    WHILE i <= n DO
		IF i % 2 = 0  THEN
			SELECT i ;
		END IF;		
		SET i = i + 1;        
	END WHILE ;   
END $$
DELIMITER ;

Call Numbers(10)
