/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 05b you will use the LEFT JOIN clause.
 */

select actor.last_name, actor.first_name from actor
where actor.first_name || actor.last_name not in (
    select customer.first_name || customer.last_name from customer
)
order by actor.last_name, actor.first_name;
