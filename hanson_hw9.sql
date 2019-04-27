use sakila;

-- 1a
select first_name, last_name from actor;

-- 1b
select first_name
	,last_name
    ,upper(concat(first_name, ' ', last_name)) as actor_name
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

alter table actor
add description blob;

alter table actor
drop description;

