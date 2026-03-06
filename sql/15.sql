/*
 * Compute the total revenue for each film.
 */

select title, cast(coalesce(sum(payment.amount),0) as numeric(10,2)) as revenue
from film
left join inventory using(film_id)
left join rental using(inventory_id)
left join payment using(rental_id)
group by title
order by revenue desc, title;
