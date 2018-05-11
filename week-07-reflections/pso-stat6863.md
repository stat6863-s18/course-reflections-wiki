
# Questions about Problems and Recipes



[Chapter 2, Question 5] 
* Question (pso-stat6863): Can you join two tables using two variables (e.g. select name, check from table_1 where name in (select name in table_2) and check in (select check in table_2)?

[Chapter 2, Question 7] 
* Question (pso-stat6863): Can you perform a double nested query using the first table (e.g. select name from table_1 where name in (select name from table_2 where check in (select check from table_1))?

[Chapter 2, Question 9] 
* Question (pso-stat6863): How is data remerging different from Cartesian product?

[Chapter 3, Question 1] 
* Question (pso-stat6863): Is having a Cartesian product message always bad?

[Chapter 3, Question 9] 
* Question (pso-stat6863): Are there any special cases you would use in-line views vs inner joins or is it just for preference?

[combine-data-at-different-grains recipe] 
* Question (pso-stat6863): Can you use aliases within in-line joins?



***



# Recipes Exploration Results



```


*Combine-data-at-different-grains recipe:

proc sql <any desired proc-sql options>;
    select
        <columns from result of join to include>
    from
        <courser-grained table>
        <join operation>
        <in-line view aggregating finer-grained table>
    <additional query clauses, as needed>
    ;
quit;


*combine-data-at-different-grains Example;

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
