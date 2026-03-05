/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

select special_features.special_features, count(*) from film, unnest(film.special_features) as special_features
group by special_features.special_features
order by special_features.special_features;
