-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
order_date date NOT NULL,
bucket VARCHAR(50)NOT NULL
);

INSERT INTO sales (order_date, bucket)
VALUES
('2021-01-01', '101 to 300'),
('2021-01-02', '101 to 300'),
('2021-01-03', 'less than equal 100'),
('2021-01-04', '101 to 300'),
('2021-01-05', 'greater than 300');

SELECT * FROM sales;

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT *, 
CASE
	WHEN bucket = 'less than equal 100' THEN 'Маленький заказ'
    WHEN bucket = '101 to 300' THEN 'Средний заказ'
    WHEN bucket = 'greater than 300' THEN 'Большой заказ'
END AS orders
FROM sales;

ALTER TABLE sales
ADD COLUMN orders VARCHAR(100) NOT NULL;

UPDATE sales
SET orders=
CASE
	WHEN bucket = 'less than equal 100' THEN 'Маленький заказ'
    WHEN bucket = '101 to 300' THEN 'Средний заказ'
    ELSE 'Большой заказ'
END;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE.
CREATE TABLE orders
(
orderid INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
employeeid VARCHAR(10) NOT NULL,
amount FLOAT NOT NULL,
orderstatus VARCHAR(20)
);

INSERT INTO orders(employeeid, amount, orderstatus)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED'),
('e04', 99.99, 'OPEN');

SELECT * FROM orders;

SELECT orderid, orderstatus,
CASE
	WHEN orderstatus = 'OPEN' THEN 'Order is in open state.'
    WHEN orderstatus = 'CLOSED' THEN 'Order is closed.'
    -- WHEN orderstatus = 'CANCELLED' THEN 'Order is cancelled.'
    ELSE 'Order is cancelled.'
END AS order_summary
FROM orders;