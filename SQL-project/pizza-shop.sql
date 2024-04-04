CREATE TABLE customers (
  cus_id INT UNIQUE,
  cus_firstname VARCHAR(20),
  cus_lastname VARCHAR(20),
  cus_phone INT(10)
  );

INSERT INTO customers VALUES 
  (1, 'Eleven', 'Hopper' , 0812345678),
  (2, 'Mike' , 'Wheeler' , 0823456789),
  (3, 'Will' , 'Byers' ,0834567890),
  (4, 'Dustin' , 'Henderson' , 0845678901),
  (5, 'Lucas' , 'Sinclair' ,0856789012),
  (6, 'Steve' , 'Harrington' , 0867890123),
  (7, 'Nancy' , 'Wheeler' , 0878901234),
  (8, 'Jonathan' , 'Byers' , 0890123456);
  

CREATE TABLE menus (
  pizza_id INT UNIQUE,
  pizza_Crust VARCHAR(10),
  pizza_topping VARCHAR(20),
  pizza_size VARCHAR(1),
  pizza_price REAL
);

INSERT INTO menus VALUES
  (101, 'Thin', 'Pepperoni', 'S', 199),
  (102, 'Pan', 'Pepperoni', 'S', 199),
  (111, 'Thin', 'Cheese', 'S', 199),
  (112, 'Pan', 'Cheese', 'S', 199),
  (121, 'Thin', 'Ham', 'S', 199),
  (122, 'Pan', 'Ham', 'S', 199),
  (131, 'Thin', 'Hawaiian', 'S', 199),
  (132, 'Pan', 'Hawaiian', 'S', 199),
  (201, 'Thin', 'Pepperoni', 'M', 299),
  (202, 'Pan', 'Pepperoni', 'M', 299),
  (211, 'Thin', 'Cheese', 'M', 299),
  (212, 'Pan', 'Cheese', 'M', 299),
  (221, 'Thin', 'Ham', 'M', 299),
  (222, 'Pan', 'Ham', 'M', 299),
  (231, 'Thin', 'Hawaiian', 'M', 299),
  (232, 'Pan', 'Hawaiian', 'M', 299),
  (301, 'Thin', 'Pepperoni', 'L', 399),
  (302, 'Pan', 'Pepperoni', 'L', 399),
  (311, 'Thin', 'Cheese', 'L', 399),
  (312 , 'Pan', 'Cheese', 'L', 399),
  (321, 'Thin', 'Ham', 'L', 399),
  (322, 'Pan', 'Ham', 'L', 399),
  (331, 'Thin', 'Hawaiian', 'L', 399),
  (332, 'Pan', 'Hawaiian', 'L', 399);

CREATE TABLE branches (
  branch_id INT UNIQUE,
  branch_locate VARCHAR(20)
);

  INSERT INTO branches VALUES
  (1, 'Bangkok'),
  (2, 'Chiang Mai'),
  (3, 'Phuket'),
  (4, 'Nakhon Ratchasima'),
  (5, 'Pattaya');

CREATE TABLE orders (
  order_id INT UNIQUE,
  order_date DATE,
  branch_id INT,
  cus_id INT,
  pizza_id INT,
  quantity INT
);

INSERT INTO orders VALUES
  (1, '2023-01-30', 5 , 1, 101, 1),
  (2, '2023-02-27', 3 , 3, 121, 2),
  (3, '2023-03-24', 1 , 5, 312, 1),
  (4, '2023-04-21', 2 , 7, 211, 1),
  (5, '2023-05-18', 4 , 8, 221, 2),
  (6, '2023-06-15', 1 , 2, 311, 1),
  (7, '2023-07-12', 2 , 4, 322, 1),
  (8, '2023-08-09', 3 , 6, 231, 3),
  (9, '2023-09-06', 4 , 8, 102, 1),
  (10, '2023-10-03', 5 , 3, 321, 2);

.mode box

-- Query 1 What are the customers' fullname who have the top 3 spendors in 2023 and how much they're spends?

SELECT 
  t1.cus_firstname || ' ' || t1.cus_lastname AS fullname,
    pizza_price*t2.quantity AS total_price
FROM (
      SELECT * FROM orders 
      JOIN customers 
      ON orders.cus_id = customers.cus_id
  ) AS t1
JOIN (
      SELECT * FROM orders
      JOIN menus
      ON orders.pizza_id = menus.pizza_id
  ) AS t2
ON t1.order_id = t2.order_id
ORDER BY 2 DESC
LIMIT 3;

-- Query 2 If we should closed 1 branches , which branches we should choose? (Having the least revenue)

SELECT 
  branch_locate,
    SUM(pizza_price*quantity) AS total_rev
FROM (
        SELECT * FROM orders AS ord , branches AS bra , menus AS men
        WHERE ord.branch_id = bra.branch_id 
        AND ord.pizza_id = men.pizza_id
  ) AS branch_rev
GROUP BY 1
ORDER BY 2
LIMIT 1;

-- Query 3 Which size is the most popular?

SELECT 
        pizza_size,
        SUM(quantity)
FROM orders AS ord
JOIN menus as men
ON ord.pizza_id = men.pizza_id
GROUP by 1
ORDER BY 2 DESC;

/* Query4 If we should have a new membership program 
by giving a membership for customers who have at least spend 500 in all purchase 
and give them new exclusive email
Who should get the new membership?*/

SELEct 
    cus_firstname || ' ' || cus_lastname AS fullname, 
        SUM(pizza_price*quantity) AS total_spend
FROM orders ord , customers cus, menus men
WHERE ord.cus_id = cus.cus_id
AND ord.pizza_id = men.pizza_id
GROUP BY 1
HAVING SUM(pizza_price*quantity) >= 500;
