# Questions about Problems and Recipes



[Chapter 1, Problem 1]
* Question (mcardoso3-stat6863):  Why are commas required when using a SELECT statement?



[Chapter 1, Problem 2]
* Question (mcardoso3-stat6863):  What is the difference between a SAS statement and a clause?



[Chapter 1, Problem 4]
* Question (mcardoso3-stat6863):  What is the effect of using "sort" as a clause?



[Chapter 1, Problem 6]
* Question (mcardoso3-stat6863):  How would you input the product or quotient of two columns into a new column?
  


[Chapter 1, Problem 7]
* Question (mcardoso3-stat6863):  How is a GROUP BY clause automatically changed to an ORDER BY clause, and what is the purpose for it?



[Chapter 2, Problem 1]
* Question (mcardoso3-stat6863):  What does the DISTINCT keyword do in a SELECT statement?
* Answer (mcardoso3-stat6863):  DISTINCT removes rows that contain duplicate values, which helps clean up the dataset.


[Chapter 2, Problem 2]
* Question (mcardoso3-stat6863):  How many other conditional operators can WHERE can be used?
* Answer (mcardoso3-stat6863):  Along with IS MISSING or IS NULL, other conditional operators include BETWEEN-AND, CONTAINS or?, IN, LIKE (with %,_), and =*.


[Chapter 2, Problem 3]
* Question (mcardoso3-stat6863):  In what part of a PROC SQL query is the CALCUALTED keyword inputted? 
* Answer (mcardoso3-stat6863):  CALCULATED is used in the WHERE clause to refer to a calculated value.


[Chapter 2, Problem 4]
* Question (mcardoso3-stat6863):  Which statement or clause by the PROC SQL query generates rows of output? 



[Chapter 2, Problem 10]
* Question (mcardoso3-stat6863):  What is the main function for a HAVING expression?



[Summarize_data_using_sql SAS recipe]
* Question (mcardoso3-stat6863):  What would be the scenarios to which using PROC SQL would be preferred when using SAS?



***



# Recipes Exploration Results

```
Recipe:  Summarize_data_using_sql

*/

*Example;

proc sql outobs=3;
	select
		*
	from
		sashelp.iris
quit;

proc sql outobs=5 number;
	select
		*
	from
		sashelp.iris
	order by
		SepalLength
	;
quit;

proc sql
	select
		Species
		,count(*) as Number_of_Irises
	from
		sashelp.iris
	group by
		Species
	;

	select
		Species
		,min(SepalLength) as Minimum Sepal Length
		,median(SepalLength) as Median_Sepal_Length
		,max(SepalLength) as Maximum_Sepal_Length
	from
		sashelp.iris
	group by
		Species
	;
quit;


/*







```


