
# Questions about Problems and Recipes



[Chapter 10, Problem 7]



* Question (lceballos-stat6863): Instead of using SYMPUT, can you use %LET instead?



[Chapter 10, Problem 1]



* Question (lceballos-stat6863): If you needed to use multiple ampersands in a string for a macro, how would you do that without making SAS resolve it unintentionally?



[Chapter 10, Problem 3]



* Question (lceballos-stat6863): Can you call a macro using another macro as one of it's hinputs?



[Chapter 10, Problem 5]



* Question (lceballos-stat6863): Can you store Macros in SAS permanently?



[Chapter 10, Problem 10]



* Question (lceballos-stat6863):  Can SAS run on other notable programming languages 
like python?

* Answer (lceballos-stat6863): In Python, you can use SASpy



[Advanced-dry-programming-pattern Week 3 Recipe]


* Question (lceballos-stat6863): Instead of iterating through a range of numbers, can you iterate from a list?



[basic_recipe_for_loading_data_from_remote_Excel_file Week 3 Recipe]

* Question (lceballos-stat6843): Can you import from an Access Database table?



[bonus_advanced_recipe_for_loading_data_from_remote_Excel_file Week 3 Recipe]

* Question (lceballos-stat6843): Can you use this macro to download SAS code from a remote server?



***



# Recipes Exploration Results



```


* Recipe 1: advanced-dry-programming-pattern;
* original recipe:

*Example;

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
			from &inputLibrary..&dsn.;
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

* Recipe 2: basic_recipe_for_loading_data_from_remote_Excel_file;
* original recipe:

* Example;

filename <filename1: 8-character filename> TEMP;
proc http
    method="get" 
    url="<URL for Excel file on web server>" 
    out=<filename1: 8-character filename>
    ;
run;
proc import
	file=<filename1: 8-character filename>
	out=<output dataset name>
	dbms=<choose one: xls|xlsx>
        replace
    ;
    sheet="<Excel file worksheet name to load; can be excluded in most cases>";
run;

proc http
	method="get"
	url="https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xlsraw=true"
	out=tempfile
;
run;
proc import
	file=tempfile
	out=frpm_raw
	dbms=xls;
run;



* Recipe 3: bonus_advanced_recipe_for_loading_data_from_remote_Excel_file;

%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=filetype;
    %if
	%sysfunc(exist(&dsn.)) = 0
    %then
	%do;
            %put Loading dataset &dsn. over the wire now...;
            filename tempfile TEMP;
            proc http
                method="get"
                url="&url."
                out=tempfile
                ;
            run;
            proc import
                file=tempfile
                out=&dsn.
                dbms=&filetype.;
            run;
            filename tempfile clear;
  %end;
  %else
   %do;
	   %put Dataset &dsn. already exists. Please delete and try again.;
     %end;
%mend;
%loadDataIfNotAlreadyAvailable(
	frpm_raw,
	https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xls?raw=true,xls)



```
