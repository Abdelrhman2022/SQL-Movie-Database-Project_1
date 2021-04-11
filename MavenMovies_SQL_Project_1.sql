use mavenmovies;

/*
1. List of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 

SELECT 
	first_name, 
    last_name, 
	email, 
    store_id
FROM staff;

/*
2.	Separate counts of inventory items held at each of the two stores. 
*/ 

SELECT 
	store_id, 
	COUNT(inventory_id) AS inventory_items
FROM inventory
GROUP BY 
	store_id;

/*
3. A separate count of active customers for each of the stores.
*/

SELECT 
	store_id, 
    COUNT(customer_id) AS active_customers
FROM customer
WHERE active = 1
GROUP BY 
	store_id;

/*
4.	A count of all customer email addresses stored in the database to
assess the liability of a data breach. 
*/

SELECT 
	COUNT(email) AS emails
FROM customer;

/*
5.	A count of unique film titles held in the inventory list at each 
store and a count of the unique film categories of films to satisfy an 
interest in diversifying film offering as a means of understanding how likely 
to keep customers engaged in the future. 
*/

SELECT 
	store_id, 
    COUNT(DISTINCT film_id) AS unique_films
FROM inventory
GROUP BY 
	store_id; 
	
SELECT 
	COUNT(DISTINCT name) AS unique_categories
FROM category;

/*
6. Analysis of the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films so as to understand
the replacement cost of all the films. 
*/

SELECT 
	MIN(replacement_cost) AS least_expensive, 
    MAX(replacement_cost) AS most_expensive, 
    AVG(replacement_cost) AS average_replacement_cost
FROM film;

/*
7.	The average payment processed, as well as the maximum payment processed in 
order to put in place payment monitoring systems and maximum payment 
processing restrictions to minimize the future risk of fraud by the store staff. 

*/

SELECT
	AVG(amount) AS average_payment, 
    MAX(amount) AS max_payment
FROM payment;

/*
8. A list of all customer identification values, with a count of all-time rentals 
made by them with the highest volume customers at the top of the list for better
understanding what the customer base looks like. 
*/

SELECT 
	customer_id, 
    COUNT(rental_id) AS number_of_rentals
FROM rental
GROUP BY 
	customer_id
ORDER BY 
	COUNT(rental_id) DESC;


