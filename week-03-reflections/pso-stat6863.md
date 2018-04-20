
# Questions about Problems and Recipes



[Chapter 10, Question 7] 
* Question (pso-stat6863): Can you combine “:macro” with “%let macro=:macro”?

[Chapter 11, Question 1] 
* Question (pso-stat6863): What are some different spaces (folders, directory, etc.) in where you can store macros?

[Chapter 11, Question 3] 
* Question (pso-stat6863): Are you macro punctuation marks such as brackets when using parentheses?

[Chapter 11, Question 5] 
* Question (pso-stat6863): Can you permanently define a macro? What are ALL ways to call a macro? 

[Chapter 11, Question 10] 
* Question (pso-stat6863): Why doesn’t SAS check for syntax errors before running the macro?

[advanced_dry_programming_pattern recipe] 
* Question (pso-stat6863): What are the limitations of %sysfunc?

[basic_recipe_for_loading_data_from_remote_Excel_file recipe] 
* Question (pso-stat6863): Can you load different versions of Excel? CSV?

[bonus_advance_recipe_for_loading_data_from_remote_Excel_file recipe] 
* Question (pso-stat6863): Can you add replace to the proc import statement to replace any existing datasets?



***



# Recipes Exploration Results



```


* advanced_dry_programming_pattern recipe Example;

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
	%let callDate =%sysfunc(today(), weekdate.);

	proc sql noprint;
		select
			distinct &column. into :iterationList separated by "|"
		from
			&inputLibrary..&dsn.
		;
	quit;

	%let numberOfIterations = %sysfunc(countw(&iterationList., |));

	%do i = 1 %to %eval(&numberOfIterations.);
		%let currentIteration = %scan(&iterationList., &i., |);
		data &outputLibrary..&dsn._&currentIteration.;
			set &inputLibrary..&dsn.;
			if &column. = "&currentIteration.";
		run;
		footnote "Created on &callDate. using dataset &syslast.";
		proc means n nmiss min q1 median q3 max maxdec=1;
		run;
	%end;
%mend;
%splitDatasetAndPrintMeans(
	sashelp,
	iris,
	species
)

* basic_recipe_for_loading_data_from_remote_Excel_file recipe Example (which can be run as is to create Work.FRPM1516_raw);
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

* bonus_advance_recipe_for_loading_data_from_remote_Excel_file recipe Example (which can be run as is to create Work.FRPM1516_raw);
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
    https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xls?raw=true,
    xls
)



```
