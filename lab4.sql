--NUMBER 1--

SELECT city
FROM agents
WHERE aid IN (SELECT aid
	      FROM orders
	      WHERE cid = 'c006'
              );



--NUMBER 2--

SELECT DISTINCT pid
FROM orders
WHERE aid IN (SELECT aid
	      FROM orders
	      WHERE cid IN (SELECT cid
			    FROM Customers
			    WHERE city = 'Kyoto'
                            )
             )
ORDER BY pid DESC;


--NUMBER 3--

SELECT name, cid
FROM customers
WHERE cid  NOT IN (SELECT cid
	      	   FROM orders
	      	   WHERE aid IN (SELECT aid
		      	    	 FROM orders
			    	 WHERE aid = 'a01'
             		   	 )
             	   )


--NUMBER 4--

SELECT cid
FROM orders
WHERE pid = 'p07'
AND cid IN (SELECT cid
            FROM orders
            WHERE pid = 'p01'
	   )

--NUMBER 5--
              
SELECT pid
FROM products 
WHERE pid NOT IN (SELECT pid 
		  FROM orders
		  WHERE cid IN (SELECT cid
		  	        FROM orders
		  		WHERE aid = 'a08'
                 		)
		  )
ORDER BY pid DESC


--NUMBER 6--

SELECT name, discount, city
FROM Customers
WHERE cid IN (SELECT cid 
	      FROM orders
	      WHERE aid IN (SELECT aid 
			    FROM agents
			    WHERE city = 'Tokyo'
   			    OR city = 'New York'
                           )
             )


--NUMBER 7--
SELECT * 
FROM customers
WHERE discount IN (SELECT discount
				   FROM customers
				   WHERE city = 'London'
					  OR city = 'Duluth'
				  )

--NUMBER 8--
Check constraints are a limit placed on what the user can enter into a column. It only allows certain values to be entered for the column that the constraint is placed on. They are good for controlling what type of data can be entered, giving the database manager more control over their tables. A good example of a check constraint is for a CWID column, with the check being: check (CWID >= 10000000). This ensures that the CWID entered for a person cannot be any less than 8 numbers, or begin with anything less than 1. Not null is a check constraint placed on all primary keys because each row for a primary key column needs to have a value. A bad example of a check constraint is: Home Phone check (not null). This would not allow a row to be entered into the table if the user did not have a Home phone number, when it’s common to no longer use a landline and only use cellphones. Check constraints are advantageous when you want to limit the values that a user can enter, but if they are used incorrectly it becomes annoying for both the users and database manager. 
