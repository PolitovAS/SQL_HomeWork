DROP DATABASE IF EXISTS HW_4;
CREATE DATABASE IF NOT EXISTS HW_4;

USE HW_4;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT * FROM cars;

# 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW v1 AS
SELECT name, cost
FROM cars
WHERE cost < '25000';

SELECT * FROM v1;

# 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW v1 AS
SELECT name, cost
FROM cars
WHERE cost < '30000';

SELECT * FROM v1;

# 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE OR REPLACE VIEW v2 AS
SELECT *
FROM cars
WHERE name = 'Skoda' OR name = 'Audi';

SELECT * FROM v2;

-- Доп задания
# 1. Получить ранжированный список автомобилей по цене в порядке возрастания
SELECT name, cost,
DENSE_RANK() OVER(ORDER BY cost) AS `dense_rank`
FROM cars;

# 2. Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
SELECT name, cost, `dense_rank`, SUM(cost) OVER() AS `sum`
FROM
(SELECT name, cost,
DENSE_RANK() OVER(ORDER BY cost DESC) AS `dense_rank`
FROM cars) AS top_list
WHERE `dense_rank` <= 3;

# 3. Получить список автомобилей, у которых цена больше предыдущей цены 
SELECT name, cost
FROM
(SELECT name, cost,
LAG(cost) OVER() AS prev_cost
FROM cars) AS new_list
WHERE cost > prev_cost;

# 4. Получить список автомобилей, у которых цена меньше следующей цены 
SELECT name, cost
FROM
(SELECT name, cost,
LAG(cost) OVER() AS prev_cost
FROM cars) AS new_list
WHERE cost < prev_cost;

 # 5. Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля
SELECT name, cost, 
LEAD(cost) OVER (ORDER BY cost) - cost AS price_difference
FROM cars
ORDER BY cost;
