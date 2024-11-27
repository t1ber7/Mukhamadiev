#1 
Select * from books
order by Code_book asc;
#2
select Code_book, Title_book, Pages 
from books 
order by Title_book asc, Pages desc;
#3.
select Name_delivery, Phone, INN
from deliveries
order by INN desc;
#4. 
select Name_delivery, INN,Phone, Address, Code_delivery 
from deliveries;
#5. 
select Publish, City, Code_publish 
from publishing_house;
#6. 
select Title_book, Pages, Name_author 
from books join authors 
on authors.Code_author = books.Code_author;
#7. 
select Title_book, Pages, Name_delivery 
from books 
join purchases 
on purchases.Code_book=books.Code_book 
join deliveries 
on purchases.Code_delivery=deliveries.Code_delivery;
#8. 
select Title_book, Pages, Publish, City 
from books 
join publishing_house 
on publishing_house.Code_publish=books.Code_publish;
#9. 
select Name_company, Phone, INN 
from deliveries 
where Name_company like "ОАО%";
#10. 
select Title_book, Pages, Name_author 
from books 
join authors 
on authors.Code_author=books.Code_author 
where Title_book like "Капитанская%";
#11. 
select Name_author 
from authors 
where Name_author like "Толстой%";
#12. 
select Publish 
from publishing_house 
where City NOT LIKE "Москва";
#13. 
select Title_book, Publish 
from books 
join publishing_house 
on publishing_house.Code_publish=books.Code_publish 
where Publish NOT LIKE "Терра";
#14. 
select Name_author 
from authors 
where Birthday between '1970-01-01' and '1987-06-01';
#15. 
select Title_book, Amount 
from books 
join purchases 
on purchases.Code_book=books.Code_book 
where Date_order between '2003-12-23' and '2012-12-23';
#16. 
select Title_book, Pages 
from books 
where Pages between '200'and'300';
#17. 
select Name_author 
from authors
where Name_author between 'П' and 'Т';
#18. 
select Title_book, Amount
from books
join purchases
on purchases.Code_book=books.Code_book
where Code_delivery between '2' and '3';	
#19. 
select Title_book 
from books 
join publishing_house 
on publishing_house.Code_publish=books.Code_publish 
where Publish in ('Правда', 'Терра');
#20. 
select Title_book, Name_author 
from books 
join authors 
on authors.Code_author=books.Code_author 
where Name_author in ('Пушкин','Тургенев');
#21. 
select Name_author 
from authors 
where Name_author like "Т%";
#22. 
select Publish 
from publishing_house 
where Publish like "%ель%";
#23. 
select Name_company 
from deliveries 
where Name_company like "%грам";
#24. 
select Code_delivery, Date_order, Title_book, Amount, Cost 
from books 
join purchases 
on purchases.Code_book=books.Code_book 
where Amount>100 or Cost between '200' and '500';
#25. 
select authors.Code_author, Name_author, Title_book, Code_publish, Pages 
from books 
join authors 
on authors.Code_author=books.Code_author 
where Code_publish between '1' and '2'and Pages>120;
#26. 
select Publish, Title_book, City 
from publishing_house 
join books 
on books.Code_publish = publishing_house.Code_publish 
where Title_book like "Дым" and City like 'Санкт-Петербург';
#27. 
select Name_company, Title_book, Date_order 
from books 
join purchases 
on purchases.Code_book=books.Code_book 
join deliveries 
on deliveries.Code_delivery=purchases.Code_delivery 
where Date_order between '2003-12-23' and '2017-08-16';
#28. 
select Name_author, Publish 
from authors 
join books 
on books.Code_author=authors.Code_author 
join publishing_house 
on publishing_house.Code_publish=books.Code_publish 
where Publish like 'Астрель';
#29. 
select Name_company, Publish 
from deliveries 
join purchases 
on purchases.Code_delivery=deliveries.Code_delivery 
join books 
on books.Code_book=purchases.Code_book 
join publishing_house 
on publishing_house.Code_publish=books.Code_publish 
where Publish like 'Терра';
#30. 
select authors.Name_author, Title_book, Name_company 
from authors 
join books 
on books.Code_author=authors.Code_author 
join purchases 
on purchases.Code_book=books.Code_book 
join deliveries 
on deliveries.Code_delivery=purchases.Code_delivery 
where Name_company like 'ОАО Телеграм';
#31. 
select Title_book, sum(Cost*Amount) as "Общая сумма" 
from purchases 
join books 
on books.Code_book=purchases.Code_book 
group by Title_book;
#32. 
select Title_book, sum(Cost/Pages) as "Стоимость 1 страницы" 
from books 
join purchases 
on books.Code_book=purchases.Code_book 
group by Title_book;
#33. 
select Name_author, year(curdate())-year(Birthday) as "Год" 
from authors;
#34. 
select  Cost, sum(Cost) as "Cost ont" 
from purchases 
join deliveries 
on purchases.Code_delivery=deliveries.Code_delivery 
where Name_company like 'ОАО Телеграм' 
group by Cost;
#35. 
select count(*) AS "Кол-во поставок"
from purchases 
where Date_order between '2003-12-23' and '2012-09-19';
#36. 
select avg(Cost) as "Cредняя цена", avg(Amount) as "Среднее количество", authors.Name_author 
from purchases 
join books 
on purchases.Code_book=books.Code_book 
join authors 
on books.Code_author=authors.Code_author 
where Name_author like 'Толстой' 
group by authors.Name_author;
#37.
 select purchases.*, Books.Title_book 
 from purchases 
 join books 
on purchases.Code_book=books.Code_book 
where (purchases.Cost * purchases.Amount)=(select min(Cost*Amount) from purchases);
#38. 
select purchases.*, Title_book 
from purchases 
join books 
on purchases.Code_book=books.Code_book 
where (purchases.Cost * purchases.Amount)=(select max(Cost*Amount) from purchases);
#39. 
select Title_book, sum(Cost*Amount) as Itog 
from books 
join purchases 
on books.Code_book=purchases.Code_book 
where Date_order between '2003-12-23' and '2012-09-19' 
group by Title_book;
#40. 
select Title_book, sum(Cost/Pages) as One_page 
from books 
join purchases 
on books.Code_book=purchases.Code_book 
group by Title_book;
#41. 
select sum(cost) as "sum_cost", Name_company 
from purchases 
join deliveries 
on purchases.Code_delivery = deliveries.Code_delivery 
where Name_company like "ОАО Телеграм" 
group by Name_company;
#42. 
update books set Pages = 300, Title_book = "Мемуары" 
where Code_author = 3;
#43. 
update deliveries set Address = "нет сведений" 
where Address = "";
#44. 
update purchases set cost = cost*1.20 
where Date_order between '00-06-24' And '30-06-24'; 
#45. 
insert into purchases (Code_book, Date_order, Code_delivery, Type_purchase, Cost, Amount, Code_purchase, Itogo) 
Values(33, '2023-12-26', 1, "0", 1000, 6, null, 6000);
#46. 
insert into books (Code_book, Title_book, Code_author, Pages, Code_publish)
value(Code_book, "Наука. Техника. Инновации", 2, 250, 3);
#47. 
insert into publishing_house (Code_publish, Publish, City) 
values(Code_publish, "Москва", "Наука");
#48. 
delete from purchases 
where Amount = 0;
#49. 
delete from authors
where Name_author = "";
#50. 
delete from deliveries 
where INN = "";