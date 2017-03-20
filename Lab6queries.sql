--Number 1
select name, city
from customers
where city in (
	      select city
	      from (
		   select city, count(*)
		   from products
		   group by city
		   order by count(*) DESC
		   limit 1
		   )table1
	      );

--Number 2
select p.name
from products p
where priceUSD > (select avg(priceUSD) 
      from products
     )

--Number 3
select c.name, o.pid as "PID Ordered", sum(o.totalUSD)as "Total"
from orders o inner join customers c on o.cid = c.cid
group by c.name, o.pid
order by sum(o.totalUSD) ASC;

--Number 4
select c.name, 
coalesce(sum(o.totalUSD), 0) as "Total Ordered"
from orders o full outer join customers c on o.cid = c.cid
group by c.name
order by c.name ASC

--Number 5
select c.name as "Customer Name" , p.name as "Product Name", a.name as "Agent Name"
from orders o inner join customers c on o.cid = c.cid
           inner join products p on o.pid = p.pid
           inner join agents a on o.aid = a.aid
where a.city = 'Newark'



--Number 6
select o.*, (o.qty * p.priceUSD * (1 - c.discount / 100)) as "Correct Total"
from orders o inner join customers c on o.cid = c.cid
           inner join products p on o.pid = p.pid
where o.totalUSD != (o.qty * p.priceUSD * (1 - c.discount / 100))

