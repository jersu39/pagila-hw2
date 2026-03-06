/*
 * Compute the total revenue for each film.
 * The output should include a new column "rank" that shows the numerical rank
 *
 * HINT:
 * You should use the `rank` window function to complete this task.
 * Window functions are conceptually simple,
 * but have an unfortunately clunky syntax.
 * You can find examples of how to use the `rank` function at
 * <https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/>.
 */

select rank() over (order by revenue desc), title, revenue
from (
    select title, sum(payment.amount) as revenue
    from film
    join inventory using(film_id)
    join rental using(inventory_id)
    join payment using(rental_id)
    group by title
) as t
order by revenue desc;
