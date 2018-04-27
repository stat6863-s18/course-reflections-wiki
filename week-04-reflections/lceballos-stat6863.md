
# Questions about Problems and Recipes



[Chapter 1, Problem 1]


* Question (lceballos-stat6863): Can you use more than one element in the WHERE clause?
* Answer (lceballos-stat6863): Yes, instead of "=" use "in" ("element1","element2",...,"elementn")



[Chapter 1, Problem 2]

* Question (lceballos-stat6863): Does PROC SQL support subqueries?



[Chapter 1, Problem 4]

* Question (lceballos-stat6863): How do you order by date?



[Chapter 2, Problem 1]

* Question (lceballos-stat6863): What is the SQL statement to remove duplicates with more than one distinct column?



[Chapter 2, Problem 1]

* Question (lceballos-stat6863): Can you use SAS statements inside a PROC SQL statement?



[summarize-data-using-sql Week 04 SAS Recipe]
* Question (lceballos-stat6863): How do we make a where clause in a SQL Query that will only return a range of dates?



***



# Recipes Exploration Results



```


* print the first 3 rows from sashelp.iris;
proc sql outobs=3;
	select 
		*
	from 
		sashelp.iris
;
quit;

* print the first 5 rows of sashelp.iris after sorting by SepalLength;
proc sql outobs=5 number;
	select
		*
	from
		sashelp.iris
	order by
		SepalLength
;
quit;

* summarize values for qualitative and quantitative variables;



proc sql;
* print frequency of each Species in sashelp.iris;
	select
 		Species
		,count(*) as Number_of_Irises
	from
		sashelp.iris
	group by
		Species
;
* print median of SepalLength by Species in sashelp.iris;
	select
Species
		,min(SepalLength) as Minimum_Sepal_Length
		,median(SepalLength) as Median_Sepal_Length
		,max(SepalLength) as Maximum_Sepal_Length
	from
		sashelp.iris
	group by
		Species
;
quit;




```
