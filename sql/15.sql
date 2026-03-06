/*
 * Compute the total revenue for each film.
 */

select title, sum(payment.amount) as revenue
from film
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
group by title
order by revenue desc;
