# Questions about Problems and Recipes



[Chapter 2, Problem 5]
* Question (mcardoso3-stat6863):  When PROC SQL produces a query, are there other operators that can be used aside from ANY and ALL?



[Chapter 2, Problem 6]
* Question (mcardoso3-stat6863):  Since it is executed independently of the outer query, can a noncorrelated subquery be evaluated last?
* Answer (mcardoso3-stat6863):  No, PROC SQL always evaluates a nonorrelated subquery before the outer query.


[Chapter 2, Problem 7]
* Question (mcardoso3-stat6863):  What will the SAS log display if a query does not have valid syntax?
* Answer (mcardoso3-stat6863):  SAS will display the standard error message in the log if there are errors in the query.


[Chapter 2, Problem 8]
* Question (mcardoso3-stat6863):  Does a correlated subquery have to include a WHERE clause?



[Chapter 2, Problem 9]
* Question (mcardoso3-stat6863):  How many tables can be combined when PROC SQL remerges data?



[Chapter 3, Problem 1]
* Question (mcardoso3-stat6863):  What is specified when a Cartesian product is included in PROC SQL?



[Chapter 3, Problem 7]
* Question (mcardoso3-stat6863):  Why can't an in-line-view be referenced for any PROC SQL query within the current SAS session?



[Chapter 3, Problem 9]
* Question (mcardoso3-stat6863):  Why is the table limit for a PROC SQL inner join set at 256?



[Sas_recipe-combine-data-at-different-grains SAS recipe]
* Question (mcardoso3-stat6863):  What does it mean when a dataset has a different or finer grain?
* Answer (mcardoso3-stat6863):  Grain is another way of saying 'level of aggregation', so having a different grain results towards one dataset having a greater level of aggregation.


***



# Recipes Exploration Results



```
*Recipe:  Sas_recipe-combine-data-at-different-grains

/*

*Example;

proc sql number;
	select
		coalesce(A.statename, B.statename) as statename
		,A.region
		,A.division
		,B.number_of_zipcodes
	from
		sashelp.us_data as A
		full join
		(
			select
				statename
				,count(*) as number_of_zipcodes format comma12.
			from
				sashelp.zipcode
			group by
				statename
		) as B
		on
			A.statename = B.statename
	order by
		number_of_zipcodes desc
	;
quit;

*/


```


