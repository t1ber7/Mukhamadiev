#1
SELECT ID_sup, details.City, ID_detail
FROM supplyers, details
where ID_sup Like ('S1') and details.City Like ("Лондон");

#2
SELECT count(product_number)
FROM shipment
where Supplyer_ID Like ('S1');

#3
SELECT count(Detail_number)
FROM shipment
where Supplyer_ID Like ('S1') and Detail_number Like ('P1');

#4
SELECT distinct (Rating), Surname
FROM details, supplyers
WHERE supplyers.City = 'Лондон'
AND details.ID_detail <> 'Красный';

#5
SELECT  Surname, City, Rating
FROM supplyers
Where Rating = (Select MAX(Rating) From supplyers);

#6
UPDATE supplyers s
INNER JOIN (SELECT ID_sup FROM supplyers ORDER BY Rating ASC LIMIT 1) AS min_rating_supplyer ON s.ID_sup = min_rating_supplyer.ID_sup
SET s.City = (SELECT City FROM details ORDER BY weight DESC LIMIT 1);

#7
UPDATE supplyers s
INNER JOIN (SELECT ID_sup, City FROM supplyers ORDER BY Rating ASC LIMIT 1) AS min_sup ON s.ID_sup = min_sup.ID_sup
INNER JOIN (SELECT ID_sup, City FROM supplyers ORDER BY Rating DESC LIMIT 1) AS max_sup ON s.ID_sup = max_sup.ID_sup
SET s.City = CASE
    WHEN s.ID_sup = min_sup.ID_sup THEN max_sup.City
    WHEN s.ID_sup = max_sup.ID_sup THEN min_sup.City
    ELSE s.City
END;

#8
SELECT *
FROM details
ORDER BY weight DESC
LIMIT 1;

#9
UPDATE supplyers s
INNER JOIN (SELECT ID_sup FROM supplyers ORDER BY Rating DESC LIMIT 1) AS max_supplier ON s.ID_sup = max_supplier.ID_sup
SET s.City = 'London';

#10
SELECT SUM(s.quantity) AS total_red_parts_shipped
FROM shipment s
JOIN details p ON s.Detail_number = p.ID_detail
WHERE p.color = 'Красный';


#11
UPDATE details d
INNER JOIN (SELECT detail_name, ID_detail FROM details ORDER BY weight DESC LIMIT 1) AS max_detail
SET d.detail_name = max_detail.detail_name
WHERE d.detail_name = 'Винт' and d.ID_detail=max_detail.ID_detail;


#12
SELECT p.*
FROM product p
JOIN (
    SELECT product_number, SUM(quantity) as total_quantity
    FROM shipment
    GROUP BY product_number
    ORDER BY total_quantity DESC
    LIMIT 1
) as max_shipment ON p.idProduct = max_shipment.product_number;




