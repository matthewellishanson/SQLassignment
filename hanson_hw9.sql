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





