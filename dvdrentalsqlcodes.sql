-- write comments by using double dash
-- select all columns from a table
SELECT *
FROM actor;

SELECT * 
FROM category;

SELECT * 
FROM customer;

-- select specific columns from a table
SELECT first_name, last_name
FROM customer;

SELECT actor_id, first_name 
FROM actor;

-- select distinct/unique values from a column
SELECT DISTINCT (store_id)
FROM customer;

-- what are the distinct customers that made payment
SELECT DISTINCT (customer_id)
FROM payment;

-- select distinct ratings in film table
SELECT DISTINCT (rating)
FROM film;

-- limit is used to display a certain number of rows from the top
SELECT *
FROM actor
LIMIT 5;

-- the first 5 countries on the country table
SELECT country
FROM country
LIMIT 5;

-- order by used to arrange your output in ascending or descending order
SELECT *
FROM payment
ORDER BY amount;

SELECT DISTINCT (amount)
FROM payment
ORDER BY amount;

-- select all rows from customer table and sort them in descending order of first name
SELECT * 
FROM customer 
ORDER BY first_name DESC;

-- where clause used to filter the table
-- customer record for Wendy
SELECT * 
FROM customer
WHERE first_name = 'Wendy';

-- all customers named Jamie
SELECT * 
FROM customer
WHERE first_name = 'Jamie';

-- customers that paid above $5
SELECT * 
FROM payment
WHERE amount > 5.00;

-- select customer id, amount paid for those who paid more than $5 and less than $8
SELECT customer_id, amount
FROM payment
WHERE amount > 5.00 AND amount < 8.00;

-- between with where checks a range a values
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 5.00 AND 8.00;

-- find the phone number of the customer at address '259 Ipoh Drive'
select * from address;
SELECT phone, address
FROM address
WHERE address = '259 Ipoh Drive';

-- what is the movie 'Outlaw Hanky' about? what is the description?
select * from film;
SELECT title, description
FROM film
WHERE title = 'Outlaw Hanky';

-- in operator helps to filter using a specified list of values
-- what customers paid 5 and 8 usd
SELECT customer_id, amount
FROM payment
WHERE amount in (5.99, 8.99);

-- customer whose first name is Jane or Jamie
SELECT *
FROM customer
WHERE first_name = 'Jane' OR first_name = 'Jamie';
-- OR

SELECT *
FROM customer
WHERE first_name in ('Jane', 'Jamie');

-- what is the rental_id and return date for customer_id 1, 2, 3  and 4
SELECT rental_id, customer_id, return_date
FROM rental
WHERE customer_id in (1, 2, 3, 4);

-- how much was paid for rental 1520, 2461, 3382
SELECT rental_id, amount
FROM payment
WHERE rental_id in (1520, 2461, 3382);

-- like operator is used to extract values that follow a certain pattern, used in conjuction with wildcard
-- customers whose first name starts with J
SELECT *
FROM customer
WHERE first_name like 'J%';

-- customers whose first_name end with 'e'
SELECT *
FROM customer
WHERE first_name like '%e';

--customers whose last name starts with 'Jo'
SELECT *
FROM customer
WHERE last_name like 'Jo%';

-- customers whose last name end with 'er'
SELECT *
FROM customer
WHERE last_name like '%er';

-- customers with 'lk' in their last name
SELECT *
FROM customer
WHERE last_name like '%lk%';

-- aggregate/aggregator: is a single number used to represent a collection of numbers 
-- e.g total, sum, subtotal, average, max, min, count
SELECT SUM(amount) AS total_amount
FROM payment;

SELECT MIN(amount) AS minimum_amount
FROM payment;

SELECT MAX(amount) AS maximum_amount
FROM payment;

SELECT COUNT(amount) AS number
FROM payment;

-- what is the total amount paid by customer 341
select * from payment;
SELECT SUM (amount) AS total_amount
FROM payment
WHERE customer_id = 314;

-- number of cities in city table
SELECT COUNT (city) AS number_cities
FROM city;

-- number of distinct cities in city table
SELECT COUNT (DISTINCT city) AS number_cities
FROM city;

-- join
SELECT *
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id;

SELECT customer.first_name, payment.customer_id, payment.amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.customer_id = 341;

-- select
SELECT last_name, city
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id;

SELECT last_name, city
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
WHERE customer.customer_id = 341;

-- group by is used only with aggregates
SELECT customer_id, SUM (amount) AS total_amount
FROM payment
WHERE customer_id = 341
GROUP BY customer_id;

--
SELECT customer_id, SUM (amount) AS total_amount
FROM payment
GROUP BY customer_id;

-- how many locations are in each city
SELECT city_id, count (address)
FROM address
GROUP BY city_id;

-- HAVING is used to filter (like where) but is used only with GROUP BY
SELECT city_id, COUNT (address)
FROM address
GROUP BY city_id
HAVING COUNT (address) > 1;

-- customers that paid below 100 usd
SELECT customer_id, SUM (amount) AS total_amount
FROM payment
GROUP BY customer_id
HAVING SUM (amount) < 100;

-- average rental rate of these ratings: R, PG, G
SELECT rating, AVG(rental_rate) AS average_rental_rate
FROM film
WHERE rating IN ('R', 'PG', 'G')
GROUP BY rating;

-- average rental rate of these ratings: R, PG, G with average rental rate greater than 2,9
SELECT rating, AVG(rental_rate) AS average_rental_rate
FROM film
WHERE rating IN ('R', 'PG', 'G')
GROUP BY rating
HAVING AVG(rental_rate) > 2.9;


-- aggregators include SUM, AVG, MIN, MAX, COUNT
-- COUNT can be used to count number of rows
SELECT SUM(amount) AS total_amount
FROM payment;

SELECT MIN(amount) AS min_amount
FROM payment;

SELECT MAX(amount) AS max_amount
FROM payment;

SELECT COUNT(amount) AS number_times_amount
FROM payment;

-- how many unique districts are our customers from

SELECT COUNT (DISTINCT(district))
FROM address;

-- how many films have a rating of R and the replacement costs between $5 and $15
select * 
from film;
SELECT COUNT (DISTINCT(film_id))
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

-- first name, last name and address of customer. ps: join = inner join
SELECT first_name, last_name, address
FROM customer
JOIN address
ON customer.address_id = address.address_id;

-- inner join, returns the matching rows from 2 tables (inner join = join)
-- full join, returns the matching rows as well as non matching rows from both tables
/*right join, returns all rowns from the right table (first table you mention) as well as matching rows
from left table (second table you mention) */
/*left join, returns all rowns from the left table (second table you mention) as well as matching rows
from right table (first table you mention) */

-- return all columns from the join of film actor and film category tables
SELECT *
FROM film_actor
JOIN film_category
ON film_actor.film_id = film_category.film_id;

SELECT *
FROM film_actor
LEFT JOIN film_category
ON film_actor.film_id = film_category.film_id;

SELECT *
FROM film_actor
RIGHT JOIN film_category
ON film_actor.film_id = film_category.film_id;

SELECT *
FROM film_actor
FULL JOIN film_category
ON film_actor.film_id = film_category.film_id;

-- return a list of all the customers 
SELECT first_name, last_name, address
FROM customer
RIGHT JOIN address
ON customer.address_id = address.address_id;


-- creating a table
CREATE TABLE discount (discount_id integer primary key,
					   discount_percent integer not null,
					   description varchar not null);
					   
CREATE TABLE products (product_id integer primary key,
					   name varchar not null,
					   quantity_in_stock integer not null,
					   unit_price double precision not null);
					   
-- data type whole number = integer, text = varchar, double precision = decimal numbers, date = date
-- dropping a table
-- when you have created a table, if you want to change one of the columns, update or drop and create again
DROP TABLE discount;
DROP TABLE products;


-- inserting values into table
INSERT INTO products (product_id, name, quantity_in_stock, unit_price)
VALUES (1, 'Foam Dinner Plate', 70, 1.21);

select * from products;

INSERT INTO products (product_id, name, quantity_in_stock, unit_price)
VALUES (2, 'Pork - Bacon,back Peameal', 49, 4.65);

insert into products (product_id, name, quantity_in_stock, unit_price)
VALUES (3, 'Lettuce - Romain, Heart', 38, 3.35),
	   (4, 'Brocolinni - Gaylan, Chiness', 90, 4.53),
	   (5, 'Sauce - Ranch Dressing', 94, 1.63),
	   (6, 'Petit Baguette', 14, 2.39),
	   (7, 'Sweet Pea Sprouts', 98, 3.29),
	   (8, 'Island - Oasis Raspberry', 26, 0.74),
	   (9, 'Longan', 67, 2.26),
	   (10, 'Broom - Push', 6, 1.09);
	   
-- creating a database
CREATE DATABASE sample;