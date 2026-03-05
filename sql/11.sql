/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select distinct actor.first_name || ' ' || actor.last_name as "Actor Name"
from actor
join film_actor using(actor_id)
join (
    select film_id, c
    from film, unnest(film.special_features) as c
) as t using(film_id)
where c = 'Behind the Scenes'
order by "Actor Name";
