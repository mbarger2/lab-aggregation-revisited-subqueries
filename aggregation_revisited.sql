# Aggregation Revisited
Use sakila;

#1) Select the first name, last name, and email address of all the
# customers who have rented a movie.
select f.email, concat(f.first_name,' ', f.last_name) as full_name from sakila.payment e 
join sakila.customer f on f.customer_id=e.customer_id;



#2) What is the average payment made by each customer 
#(display the customer id, customer name (concatenated), and the average payment made).

select f.customer_id, concat(f.first_name,' ', f.last_name) as full_name, round(avg(e.amount),0) as avg_pay
 from  sakila.payment e join sakila.customer f on f.customer_id=e.customer_id;



#3) Select the name and email address of all the customers who have rented the "Action" movies.
# Write the query using multiple join statements
# Write the query using sub queries with multiple WHERE clause and IN condition
# Verify if the above two queries produce the same results or not

select f.email, concat(f.first_name,' ', f.last_name) as full_name from sakila.category a
join sakila.film_category b using (category_id)
join sakila.inventory c using (film_id)
join sakila.rental d using (inventory_id)
join sakila.payment e using (rental_id)
join sakila.customer f on f.customer_id=e.customer_id
where a.name = 'Action';

#4) Use the case statement to create a new column classifying existing columns as 
# either or high value transactions based on the amount of payment. 
# If the amount is between 0 and 2, label should be low and 
# if the amount is between 2 and 4, the label should be medium, 
# and if it is more than 4, then it should be high.

Select *,
case when amount >0 and amount <=2 then 'low'
when amount >2 and amount <=4 then 'medium'
when amount >4 then 'high'
end as trans_amount
from sakila.payment;



