-- Question 1:
-- List all customers who live in Texas:
-- Answer: Kim Cruz, Jennifer Davis, Bryan Hardison, Ian Still, Richard Mccrary

SELECT customer.first_name, customer.last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- Question 2:
-- Get all payments above $6.99 with the customer's full name:

SELECT customer.first_name, customer.last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount DESC;

-- Question 3:
-- Show all customers' names who have made payments over $175:
-- Answer: Harold Martino, Jennifer Davis, Mildred Bailey

SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 175.00
);

-- Question 4:
-- List all customers that live in Nepal:
-- Answer: Kevin Schuler

SELECT customer.first_name, customer.last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- Question 5:
-- Which staff member had the most transactions?
-- Answer: Jon Stephens

SELECT staff.first_name, staff.last_name, COUNT(payment_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY COUNT(payment_id) DESC;

-- Question 6:
-- How many movies of each rating are there?
-- Answer: PG-13 = 223, NC-17 = 209, G = 179, PG = 194, R = 195

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- Question 7:
-- Show all customers who have made a single payment above $6.99:

SELECT customer.first_name, customer.last_name, customer_id
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id, amount
	HAVING amount = 6.99
);

-- Question 8:
-- How many free rentals did our stores give away?
-- Answer: None

SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;

