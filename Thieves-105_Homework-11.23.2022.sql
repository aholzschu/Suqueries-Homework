-- Week 5 - Wednesday
-- Questions

SELECT *
FROM address;
-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name, district
FROM customer
LEFT JOIN address
ON address.address_id=customer.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, amount
FROM customer
RIGHT JOIN payment
ON customer.customer_id=payment.customer_id
where amount >'6.99';

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
);
-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, last_name, city
FROM customer
INNER JOIN address
ON customer.address_id=address.address_id
INNER JOIN city
ON address.city_id=city.city_id
where country_id = '66';


-- 5. Which staff member had the most
-- transactions?
SELECT first_name, last_name, COUNT(payment_date)
FROM staff
RIGHT JOIN payment
ON staff.staff_id=payment.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(payment_date) DESC;

-- 6. How many movies of each rating are
-- there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;


-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT DISTINCT(last_name), amount, payment_id 
FROM (
    SELECT last_name, payment_id, amount
    FROM payment
    INNER JOIN customer
    ON customer.customer_id=payment.customer_id
) AS customer_payments
WHERE amount > 6.99;


-- 8. How many free rentals did our store give away?
SELECT COUNT (amount)
FROM payment
WHERE amount = 0;