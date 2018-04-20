
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

* original recipe:
proc means maxdec=1 missing data=FRPM1516_raw;
    class School_Type Charter_School;
    var Percent_Eligible_FRPM_K12 Enrollment_K12;
run;



*Recipe: recipe_for_summarizing_qualitative_values

* original recipe:
proc freq nlevels data=FRPM1516_raw;
    table
        Educational_Option_Type*Charter_School
        / missing norow nocol nopercent
    ;
run;

*Recipe: * recipe_for_temporarily_binning_values ;

* original recipe:
proc format;
    value $Educational_Option_Type_bins
         "Alternative Schools of Choice"
        ,"Community Day School"
        ,"Continuation School"
        ,"County Community School"
        ,"District Special Education Consortia School"
        ,"Home and Hospital"
        ,"Juvenile Court School"
        ,"Opportunity School"
        ,"Special Education School"
        ,"State Special School"
        ,"Youth Authority School"
        ="Non-traditional"
        other
        ="Traditional"
    ;
    value Enrollment_K12_bins
        low-262="Q1 Enrollment"
        263-510="Q2 Enrollment"
        511-740="Q3 Enrollment"
        741-high="Q4 Enrollment"
    ;
    value Percent_Eligible_FRPM_K12_bins
        low-<.36="Q1 FRPM"
        .36-<.67="Q2 FRPM"
        .67-<.86="Q3 FRPM"
        .86-high="Q4 FRPM"
    ;
run;
proc freq data=FRPM1516_raw;
    table
        Educational_Option_Type*Enrollment_K12*Percent_Eligible_FRPM_K12
        / missing list
    ;
    format
        Educational_Option_Type $Educational_Option_Type_bins.
        Enrollment_K12 Enrollment_K12_bins.
        Percent_Eligible_FRPM_K12 Percent_Eligible_FRPM_K12_bins.
    ;
run;





```