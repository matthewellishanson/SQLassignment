use sakila;

-- 1a
select first_name, last_name from actor;

-- 1b
select first_name, last_name, upper(concat(first_name, ' ', last_name)) as actor_name
from actor;

-- 2a
select first_name
	, last_name
    , actor_id
from actor 
where first_name = "Joe";

-- 2b
select * from actor 
where last_name like '%gen%';

-- 2c
select * from actor
where last_name like '%li%'
order by last_name, first_name;

-- 2d
select country_id, country
from country
where country in ('Afghanistan', 'Bangladesh', 'China');

-- 3a
alter table actor
add description blob;

-- 3b
alter table actor
drop description;

-- 4a
select last_name, count(last_name) as name_count
from actor
group by last_name;

-- 4b
select last_name, count(last_name) as name_count
from actor
group by last_name
having name_count >= 2;

-- 4c
update actor set first_name = 'HARPO'
where last_name = 'WILLIAMS' and first_name = 'GROUCHO';

-- 4d
update actor set first_name = 'GROUCHO'
where last_name = 'WILLIAMS' and first_name = 'HARPO';

-- 5a
show create table address;

-- 6a
select first_name, last_name, address
from staff
inner join address on address.address_id = staff.address_id;

-- 6b
select first_name, last_name, sum(amount) as total_spent
from staff
join payment on payment.staff_id = staff.staff_id
and payment_date between '2005-08-01 00:00:00' and '2005-09-01 00:00:00'
group by first_name, last_name;

-- 6c
select title, count(actor_id) as actor_count
from film
inner join film_actor on film.film_id = film_actor.film_id
group by title;

-- 6d
select count(inventory.film_id) as film_inventory_count
from inventory
inner join film on film.film_id = inventory.film_id
where film.title = 'Hunchback Impossible'
group by title;

-- 6e
select first_name, last_name, sum(amount) as total_spent
from customer
join payment on customer.customer_id = payment.customer_id
group by first_name, last_name
order by last_name asc;


-- 7a 
# first, select * from language to identify language_id for English
select title
from film
where title like 'K%'
or title like 'Q%'
and language_id = 1;

-- 7b
select * from actor where actor.actor_id in (
	select actor_id from film_actor where film_actor.film_id in
		(
			select film_id from film where title = "Alone Trip"
		)
	);
    
-- 7c 
select first_name, last_name, email from customer 
inner join address on customer.address_id = address.address_id
inner join city on address.city_id = city.city_id
inner join country on city.country_id = country.country_id
where country = 'Canada';

-- 7d
select title from film
inner join film_category on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
where name= 'Family';

-- 7e
select count(rental_id) as rental_count, title
from rental
inner join inventory on inventory.inventory_id = rental.inventory_id
inner join film on film.film_id = inventory.film_id
group by title
order by rental_count desc;

-- 7f
select store.store_id, sum(payment.amount) as business_in_dollars
from store
inner join customer on customer.store_ID = store.store_ID
inner join payment on payment.customer_id = customer.customer_id
group by store.store_id;



