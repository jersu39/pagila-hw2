/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

select title from film
inner join (
    select title, c
    from film, unnest(film.special_features) as c
    where c = 'Behind the Scenes'
) as t using(title)
inner join (
    select title, c
    from film, unnest(film.special_features) as c
    where c = 'Trailers'
) as t2 using(title)
order by title;
