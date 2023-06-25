CREATE DATABASE HW_1;

USE HW_1;

# 1. Создайте таблицу с мобильными телефонами.
CREATE TABLE smartphones
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
product_name VARCHAR(30) NOT NULL,
manufacturer VARCHAR(30) NOT NULL,
product_count INT,
price INT);

SELECT * FROM smartphones;

#  Заполните БД данными.
INSERT INTO smartphones(product_name, manufacturer, product_count, price)
VALUES
("iPhone X", "Apple", 3, 76000),
("iPhone 8", "Apple", 2, 51000),
("Galaxy S9", "Samsung", 2, 56000),
("Galaxy S8", "Samsung", 1, 41000),
("P20 Pro", "Huawei", 5, 36000);

# 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT product_name, manufacturer, price FROM smartphones
WHERE product_count > 2;

# 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM smartphones
WHERE manufacturer = "Samsung";

# 4.1 Найти товары, в которых есть упоминание "Iphone"
SELECT * FROM smartphones
WHERE product_name LIKE '%iPhone%';

# 4.2 Найти товары, в которых есть упоминание "Samsung"
SELECT * FROM smartphones
WHERE manufacturer LIKE '%Samsung%';

# 4.3 Найти товары, в которых есть ЦИФРА "8"  
SELECT * FROM smartphones
WHERE product_name LIKE '%8%';