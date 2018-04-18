
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 1, Problem 1.1]
* Question(crai-stat6863): How to write multiple columns in the Select statement?
* Answer(crai-stat6863): separated by,.

[SAS Certification Prep Guide, Chapter 1, Problem 1.2]
* Question(crai-stat6863): How many statements are in this example?
* Answer( crai-stat6863): Statements include; at the end of the line.

[SAS Certification Prep Guide, Chapter 1, Problem 1.4]
* Question(crai-stat6863): How to use order clause is SQL?
* Answer(crai-stat6863):order by price,sqfeet. column name separated by,.

[SAS Certification Prep Guide, Chapter 1, Problem 1.6]
* Question(crai-stat6863): How to rename calculated column?
* Answer(crai-stat6863): by using as renamed_column.Example price-cost as Profit 

[SAS Certification Prep Guide, Chapter 1, Problem 1.7]
* Question(crai-stat6863): What happens if you use a GROUP BY clause in a PROC SQL step without a summary function? 
* Answer(crai-stat6863): The GROUP BY clause is changed to an ORDER BY clause. 

[SAS Certification Prep Guide, Chapter 2, Problem 1.2]
* Question(crai-stat6863): what is the use of WHERE address is missing? 

[SAS Certification Prep Guide, Chapter 2, Problem 1.4]
* Question(crai-stat6863):What is the use of having avg(boarded) > 150;?
* Answer(crai-stat6863): It is looking for average which is greater than 150.

[Summarize-data-using-sql]
* Question(crai-stat6863): What is the use of outobs in proc sql statement?
* Answer(crai-stat6863):outobs is similarly to obs in SAS statement.


***


# Recipes Exploration Results


```


*Example;
*Immitating proc print;

proc sql outobs=3;
	select *
	from sashelp.iris
	;
quit;

*Immitating proc sort and proc sql;
proc sql outobs=5 number;
	select *
	from sashelp.iris
	Order by SepalLength
	;
quit;

*Multiple query;
proc sql;
	* Proc freq;
	select Species, count(*) as Number_of_irises
	from sashelp.iris
	order by Species 
	;
	*proc mean;
	select 
		 Species 
		 ,min(SepalLength) as Minimun_Sepal_Length
		 ,median(SepalLength) as Median_Sepal_Length
		 ,max(SepalLength) as Max_Sepal_Length 
	from 
		sashelp.iris
	group by 
		Species

	;
quit;



```
