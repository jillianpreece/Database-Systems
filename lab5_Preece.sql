--Number 1
select city
from agents a inner join customers c on c.aid = a.aid
where cid = 'c006';

--Number 2
select pid
from orders o inner join customers c on o.cid = c.cid
where c.city = 'Kyoto'
order by pid DESC;

--Number 3
select name 
from customers
where cid not in (
		 select distinct cid
		 from orders
		 );

--Number 4
select name
from customers c left outer join orders o on o.cid = c.cid
where o.ordNumber is null;

--Number 5
select c.name, a.name
from orders o inner join customers c on o.cid = c.cid
	      inner join agents a on o.aid = a.aid
where a.city = c.city;

--Number 6
select c.name, 
       a.name, 
       c.city as "Shared City"
from agents a, 
     customers c
where a.city = c.city;

--Number 7
select name, city
from customers
where city in (
	      select city
	      from (
		   select city, count(*)
		   from products
		   group by city
		   order by count(*) ASC
		   limit 1
		   )table1
	      );