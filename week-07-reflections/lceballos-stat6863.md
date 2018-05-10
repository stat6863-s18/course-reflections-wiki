
# Questions about Problems and Recipes



[Chapter 2 Quiz, Problem 5]



* Question(lceballos-stat6863): Can you join a SQL table with a SAS table?



[Chapter 2 Quiz, Problem 6]



* Question(lceballos-stat6863): Can you convert the data type of a variable in proc SQL?



[Chapter 2 Quiz, Problem 7]



* Question(lceballos-stat6863): Can update a SAS table using the same method as updating a SQL table (update)?



[Chapter 2 Quiz, Problem 8]



* Question(lceballos-stat6863): Can you connect SAS with to an access database and access the data using SAS SQL?



[Chapter 3 Quiz, Problem 1]



* Question(lceballos-stat6863): Can you use this method to append another column to a table with identical values?



[combine-data-at-different-grains Week 7 SAS Recipe] 


* Question(lceballos-stat6863): How can we set up a drill up relationship using counts for groups?
- Answer(lceballos-stat6863): select count(*) from table group by group.



***



# Recipes Exploration Results



```


* original recipe: combine-data-at-different-grains
;
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



```
