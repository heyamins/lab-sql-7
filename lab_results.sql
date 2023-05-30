use sakila;
select * from actor;

-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
select count(first_name) as count, last_name from actor
group by last_name
having count = 1;

-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
select count(first_name) as count, last_name from actor
group by last_name
having count >1
order by count desc;

-- Using the rental table, find out how many rentals were processed by each employee.
select count(rental_id), staff_id from rental
group by staff_id
order by staff_id;

-- Using the film table, find out how many films were released each year.
select count(*), release_year from film
group by release_year
order by release_year;

-- Using the film table, find out for each rating how many films were there.
select count(*), rating from film
group by rating
order by count(*);

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select round(avg(length),2) as "mean length", rating from film
group by rating
order by "mean length";

-- Which kind of movies (rating) have a mean duration of more than two hours?
select round(avg(length),2) as "mean length", rating from film
group by rating
having avg(length) > 120.00
order by "mean length" desc;




