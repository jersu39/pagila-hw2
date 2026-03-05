/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

select t2.t as special_feature, sum(payment.amount) as profit
from payment
join rental on payment.rental_id = rental.rental_id
join inventory on inventory.inventory_id = rental.inventory_id
join film on film.film_id = inventory.film_id
join (
    select title, t
    from film, unnest(film.special_features) as t
) as t2 using(title)
group by special_feature
order by special_feature;
