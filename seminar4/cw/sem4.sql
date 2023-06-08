-- Создание таблицы с товарами
   CREATE TABLE products (
     product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category INT NULL,
     product_name VARCHAR(100) NOT NULL
   );

-- Добавление данных в таблицу с товарами
   INSERT INTO products(category, product_name)
     VALUES (1, 'Системный блок'),
            (1, 'Монитор'),
            (2, 'Холодильник'),
            (2, 'Телевизор'),
            (NULL, 'Операционная система');



   -- Создание таблицы с категориями
   CREATE TABLE categories (
     category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category_name VARCHAR(100) NOT NULL
   );

   -- Добавление данных в таблицу с категориями
   INSERT INTO categories (category_name)
     VALUES ('Комплектующие компьютера'),
            ('Бытовая техника'),
            ('Мобильные устройства');

   SELECT * FROM products;
   SELECT * FROM categories;
   
   -- inner join
   select * from products
   join categories on category_id = category;
   
   -- left join
   select * from products
   left join categories on category_id = category;
   
   -- right join
   select * from products
   right join categories on category_id = category;
   
   select product_id, product_name, if (category_name is null, 'категория не найдена', category_name) 
   from products
   left join categories on category_id = category;
   
    select product_id, product_name, COALESCE(category_name, 'категория не найдена') -- if (category_name is null, 'категория не найдена', category_name) 
   from products
   left join categories on category_id = category;
   
select * from products
left join categories
on category_id = category
union
select * from products
right join categories
on category_id = category;

