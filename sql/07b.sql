/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select distinct title
from film
join inventory using(film_id)
left join (
    select distinct film_id
    from inventory
    join rental using(inventory_id)
    join customer using(customer_id)
    join address using(address_id)
    join city using(city_id)
    join country using(country_id)
    where country.country = 'United States'
) as t using(film_id)
where t.film_id is null
order by title;
