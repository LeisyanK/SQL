SELECT city, sname FROM salespeople
UNION
SELECT city, cname FROM customers
ORDER BY city;

SELECT city, cname FROM customers
ORDER BY city;

SELECT * FROM customers
INNER JOIN salespeople
ON customers.city = salespeople.city;