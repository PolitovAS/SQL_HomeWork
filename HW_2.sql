DROP DATABASE IF EXISTS HW_2;
CREATE DATABASE IF NOT EXISTS HW_2;

USE HW_2;

# 1
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT);

INSERT INTO sales (order_date, count_product)
VALUES 
	("2022-01-01", 156),
    ("2022-01-02", 180),
    ("2022-01-03", 21),
    ("2022-01-04", 124),
    ("2022-01-05", 341);
    
SELECT * FROM sales;

# 2
SELECT
id "id заказа",
IF(count_product < 100, "Маленький заказ",
	IF(count_product >= 100 AND count_product < 300, "Средний заказ",
		IF(count_product >= 300, "Большой заказ", "Неопределенно"))) AS "Тип заказа"
FROM sales;

# 3
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(5) NOT NULL,
amount DECIMAL NOT NULL,
order_status VARCHAR(20) NOT NULL);

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
	("e03", 15.00, "OPEN"),
    ("e01", 25.50, "OPEN"),
    ("e05", 100.70, "CLOSED"),
    ("e02", 22.18, "OPEN"),
    ("e04", 9.50, "CANCELLED");
    
SELECT * FROM orders;

SELECT id AS "id заказа",
	CASE 
		WHEN order_status = "OPEN" THEN "Order is in open state"
        WHEN order_status = "CLOSED" THEN "Order is closed"
        WHEN order_status = "CANCELLED" THEN "Order is cancelled"
        ELSE "Ошибка"
	END "full_order_status"
FROM orders;

# 4. NULL соответствует понятию «пустое поле» null, то есть «поле, не содержащее никакого значения»