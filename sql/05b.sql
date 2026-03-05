/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select actor.last_name, actor.first_name from actor
left join customer on customer.first_name = actor.first_name
    and customer.last_name = actor.last_name
where customer.first_name is null
order by last_name, first_name;
