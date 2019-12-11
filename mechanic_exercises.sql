-- EXERCISES
-- a.
SELECT * FROM storage WHERE price < 10 AND storage.code LIKE '@98@' OR storage.code LIKE '98@' OR storage.code LIKE '@98';

-- b.
SELECT plate FROM car, repair WHERE car.car_id = repair.car_id YEAR(repair.end_date) = 2010 AND MONTH(repair.end_date) = 9;

-- c.
SELECT customer.name, car.car_id, storage.part_id, storage.price FROM customer INNER JOIN customer_car ON customer_car.customer_id INNER JOIN car ON car.car_id INNER JOIN repair ON repair.car_id INNER JOIN used_parts_repair ON used_parts_repair.repair_id INNER JOIN storage ON storage.part_id WHERE storage.price > 10 ORDER BY storage.price DESC;

-- d.
SELECT DISTINCT * FROM customer INNER JOIN customer_car ON customer_car.customer_id;

-- e.
SELECT SUM(repair_id) FROM repair, car WHERE repair.car_id = car.car_id;

-- f.
SELECT repair_id, TIMESTAMPDIFF(DAY, begin_date, end_date) FROM repair;

-- g.
SELECT AVG(price), SUM(stock * price), MIN(price), MAX(price) FROM storage;
SELECT part_id, stock FROM storage;

-- h.
-- DOUBTS

-- i.
SELECT repair.repair_id, SUM(used_parts * (SELECT price FROM storage INNER JOIN used_parts_repair ON used_parts_repair.part_id)) as Total_Costs FROM used_parts_repair, repair WHERE repair.repair_id = used_parts_repair.repair_id GROUP BY repair_id;

-- j.
-- SELECT SUM(used_parts * cost) FROM used_parts_repair INNER JOIN repair ON repair.repair_id WHERE SUM(used_parts * cost) > 60 GROUP BY repair.repair_id;

-- k.

-- l.

-- m.

-- n.
SELECT * FROM customer INNER JOIN customer_car ON customer_car.customer_id WHERE customer_car.customer_id != customer_car.owner_id;

-- o.
SELECT * FROM city WHERE city.city_id = customer.city_id OR city.city_id = employee.city_id;

-- p.
SELECT * FROM city WHERE city.city_id = customer.city_id AND city.city_id = employee.city_id;

-- q.

-- r.

-- s.

-- t.

-- u.

-- v.

-- w.

-- x.