/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */

select
    extract(year from rental_date) as "Year",
    extract(month from rental_date) as "Month",
    sum(payment.amount) as "Total Revenue"
from rental
join payment using(rental_id)
group by
    rollup("Year", "Month")
order by "Year", "Month";
