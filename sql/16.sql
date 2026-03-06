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
    select title, cast(coalesce(sum(payment.amount),0) as numeric(10,2)) as revenue from film
    left join inventory using(film_id)
    left join rental using(inventory_id)
    left join payment using(rental_id)
    group by title
) as t
order by revenue desc, title;
