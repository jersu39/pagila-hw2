/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

select title from film,unnest(film.special_features) as spec_feat
where spec_feat = 'Trailers'
and rating = 'G'
order by title;
