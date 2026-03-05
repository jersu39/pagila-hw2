/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select distinct title from film
left join (
    select film_id from inventory
    left join rental using(inventory_id)
    left join customer using(customer_id)
    left join address using(address_id)
    left join city using(city_id)
    left join country using(country_id)
    where country = 'United States'
) as country using(film_id)
where country is null;
