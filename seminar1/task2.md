/*  
Выведите название, производителя и цену для товаров, количество которых превышает 2  
*/  
SELECT ProductName, Manufacturer, Price  
FROM products  
WHERE ProductCount > 2;