create table salesdata_example(
order_no integer,
product_no integer,
price real,
quantity integer,
sales float,
qtr_id integer,
month_id integer,
year_id integer);


alter table salesdata_example add constraints qtr_idchck check(qtr_id IN ('1','2','3','4'));


alter table salesdata_example add constraints month_chck check(month_id IN ('1','2','3','4','5','6','7','8','9','10','11','12'));


insert into salesdata_example values ('001','010','35.49','2','0101','5','12','2002');

insert into salesdata_example values ('10107','2','85.7','30','2587','1','2','2003');
insert into salesdata_example values ('10107','5','95.8','39','3879.49','1','2','2003');
insert into salesdata_example values ('10121','5','71.5','34','2700','1','2','2003');
insert into salesdata_example values ('10134','2','94.74','41','3884.34','3','7','2004');
insert into salesdata_example values ('10134','5','100','27','3307.77','3','7','2004');
insert into salesdata_example values ('10159','14','100','49','5205.27','4','10','2005');
insert into salesdata_example values ('10168','1','96.66','36','3479.66','4','10','2006');
insert into salesdata_example values ('10180','12','100','42','4695.6','4','11','2006');

select * from salesdata_example;


--SELECT product_no, year_id, month_id, SUM(quantity) AS units_sold
--FROM (
--  SELECT product_no, year_id, 
--    ((CASE WHEN month_id <= 3 THEN 1
--           WHEN month_id <= 6 THEN 4
--           WHEN month_id <= 9 THEN 7
--           ELSE 10 END) - 1) * 3 + 
--    (month_id - 1) % 3 + 1 AS month_id, 
--    quantity/3 AS monthly_quantity, 
--    sales/3 AS monthly_sales 
--  FROM salesdata_example
--) monthly_data
--GROUP BY product_no, year_id, month_id;

SELECT product_no, year_id, qtr_id, SUM(quantity) AS units_sold
FROM salesdata_example
GROUP BY product_no, year_id, qtr_id;










