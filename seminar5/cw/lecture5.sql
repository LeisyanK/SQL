SELECT * FROM products;

create view copyprod as
select price, productcount, manufacturer
from products
where manufacturer = 'Apple';

select * from copyprod;
-- удаление виртуальной таблицы
drop view copyprod;