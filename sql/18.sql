/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */

select *, to_char(100*"total revenue"/(sum(revenue) over()), 'FM900D00') as "percent revenue"
from (
    select *, sum(revenue) over (order by rank) as "total revenue"
    from (
        select rank() over (order by revenue desc), title, revenue
        from (
            select title,
            cast(coalesce(sum(payment.amount),0) as numeric(10,2))
            as revenue from film
            left join inventory using(film_id)
            left join rental using(inventory_id)
            left join payment using(rental_id)
            group by title
        ) as t
        order by revenue desc, title
    ) as t2
) as t3
group by "rank", title, revenue, "total revenue"
order by "rank" asc, title;
