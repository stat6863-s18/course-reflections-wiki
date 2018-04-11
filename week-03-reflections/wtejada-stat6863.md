
# Questions about Problems and Recipes


[Chapter 10, Problem 7]
* Question (wtejada-stat6863): Because a Macro variable in PROC SQL is always preceded by a colon, does that mean the name of variable cannot contain a colon? 

[Chapter 11, Problem 1]
* Question (wtejada-stat6863): Is there anything that a Macro Program defenition cannot include?

[Chapter 11, Problem 3]
* Question (wtejada-stat6863): Is there a limit to how many parameters you can include in a Macro program? 

[Chapter 11, Problem 5]
* Question (wtejada-stat6863): Is it possible to access the SAS Macro catalog through the explore tab?

[Chapter 11, Problem 10]
* Question (wtejada-stat6863): Can you nest Macro Programs within each other?

[advanced-dry-programming-pattern Week 3 SAS Recipe]
* Question (wtejada-stat6863): Are the 3 different options listed usually listed for a program that has been tested before? Or only for debugging purposes?

[basic-recipe-for-loading-data-from-remote-excel Week 3 SAS Recipe]
* Question (wtejada-stat6863): Is it possible to load data from a source other than an excel file?




***



# Recipes Exploration Results





* Recipe: advanced-dry-programming-pattern ;
* original recipe:
```
options
	mcompilenote=all
	mprint
	symbolgen
;
%macro splitDatasetAndPrintMeans(
	inputLibrary,
	dsn,
	column,
	outputLibrary=Work
);
 
	%let callDate = %sysfunc(today(),weekdate.);
 
	proc sql noprint;
    	select
        	distinct &column. into :iterationList separated by "|"
        	from &inputLibrary..&dsn.
    	;
	quit;
 
	%let numberOfIterations = %sysfunc(countw(&iterationList.,|));
 
	%do i = 1 %to %eval(&numberOfIterations.);
    	%let currentIteration = %scan(&iterationList.,&i.,|);
    	data &outputLibrary..&dsn._&currentIteration.;
        	set &inputLibrary..&dsn.;
        	if &column. = "&currentIteration.";
    	run;
    	footnote "Created on &callDate. using dataset &syslast.";
    	proc means n nmiss min q1 median q3 max maxdec=1;
    	run;
	%end;
%mend;
%splitDatasetAndPrintMeans(sashelp, iris, species)

```

* Recipe: basic-recipe-for-loading-data-from-remote-excel;
* original recipe:
```
filename tempfile TEMP;
proc http
	method="get"
	url="https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xls?raw=true"
	out=tempfile
	;
run;
proc import
	file=tempfile
	out=frpm_raw
	dbms=xls;
run;
filename tempfile clear;





```
