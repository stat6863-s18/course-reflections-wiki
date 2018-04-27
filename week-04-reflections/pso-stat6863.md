
# Questions about Problems and Recipes



[Chapter 1, Question 1] 
* Question (pso-stat6863): What other types of operators can you use instead of >, <, or =?

[Chapter 1, Question 4] 
* Question (pso-stat6863): If you can “order by” columns numbers, then can you use numbers instead of listing field names (e.g. order by 1,2,3)?

[Chapter 1, Question 7] 
* Question (pso-stat6863): Is there any way to group a couple of fields and still select other character fields?

[Chapter 2, Question 1] 
* Question (pso-stat6863): Is there any way to use distinct and sorting in proc sql? For example, if you want to keep the latest date but distinct IDs.

[Chapter 2, Question 4] 
* Question (pso-stat6863): What is the difference between using “label” and “as” as a naming function?

[summarize-data-using-sql recipe] 
* Question (pso-stat6863): Can you order numeric fields (e.g. order SepalLength in descending order)?



***



# Recipes Exploration Results



```



* Example;

* imitating proc print;
proc sql outobs=3;
	select *
	from sashelp.iris
	;
quit;

* imitating proc sort and proc print;
proc sql outobs=5 number;
	select * 
	from sashelp.iris
	order by SepalLength
	;
quit;

proc sql;
	* imitating proc freq;
	select Species, count(*) as Number_of_Irises
	from sashelp.iris
	group by Species
	;
	* imitating proc means;
	select
		Species
		,min(SepalLength) as Minimum_Sepal_Length
		,median(SepalLength) as Median_Sepal_Length
		,max(SepalLength) as Maximun_Sepal_Length
	from
		sashelp.iris
	group by
		Species
	;
quit;



```
