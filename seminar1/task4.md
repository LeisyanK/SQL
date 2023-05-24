-- Товары, в наименовании которых есть упоминание "Iphone"
SELECT * FROM products
WHERE ProductName like '%Iphone%';

-- Товары, в наименовании которых есть упоминание "Samsung"
SELECT * FROM products
WHERE ProductName like '%Samsung%';
-- WHERE Manufacturer like '%Samsung%';

-- Товары, в наименовании которых есть ЦИФРЫ
SELECT * FROM products
WHERE ProductName REGEXP '[0-9]';

SELECT * FROM products
WHERE ProductName rlike '[0-9]';

-- Товары, в наименовании которых есть ЦИФРА "8"
SELECT * FROM products
WHERE ProductName rlike '8';

SELECT * FROM products
WHERE ProductName like '%8%';