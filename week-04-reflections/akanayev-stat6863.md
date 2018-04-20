
# Questions about Problems and Recipes



[Chapter 1, Problem 1]
* Question (akanayev-stat6863): How to check query syntax without executing PROC SQL;



[Chapter 2, Problem 2]
* Question (akanayev-stat6863): Will column appear in the resulted output if it is used in Where clause in PROC SQL?



[Chapter 2, Problem 3]
* Question (akanayev-stat6863): What is purpose of using Contain statement in Where clause? 



[Chapter 2, Problem 4] 
* Question (akanayev-stat6863): How to create colums conditionally in PROC SQL?



[Chapter 2, Problem 5] 
* Question (akanayev-stat6863): Which symbol in comparison operator does not comply ANSI standard for SQL?



[Summarize_Data_Using_Sql Week 4 SAS Recipe]
* Question (akanayev-stat6863): Can we use CASE END Clause within PROC SQL as an alternative to use IF ELSE statement in DATA step?
* Question (akanayev-stat6863): Is outobs option equivalent to obs option in PROC PRINT?
* Question (akanayev-stat6863): What is main difference between Having and Where clause in PROC SQL?





***



# Recipes Exploration Results




```
* Recipe: summarize-data-using-sql ;

* original recipe:
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
		,max(SepalLength) as Maximum_Sepal_Length
	from
	    sashelp.iris
	group by 
	    Species
	;
quit;



* Recipe: recipe_to_check_for_duplicates ;

* original recipe:
proc sort
        data=FRPM1516_raw
        out=FRPM1516_raw_sorted
    ;
    by
        descending County_Code
        District_Code
        School_Code
    ;
run;



* Recipe: recipe_for_printing_values  ;

* original recipe:
proc print data=FRPM1516_raw(obs=20);
    id County_Name District_Name;
    var Percent_Eligible_FRPM_K12;
run;



* Recipe: recipe_for_summarizing_quantitative_values ;
proc means maxdec=1 missing data=FRPM1516_raw;
    class School_Type Charter_School;
    var Percent_Eligible_FRPM_K12 Enrollment_K12;
run;



*Recipe: recipe_for_summarizing_qualitative_values
proc freq nlevels data=FRPM1516_raw;
    table
        Educational_Option_Type*Charter_School
        / missing norow nocol nopercent
    ;
run;




```