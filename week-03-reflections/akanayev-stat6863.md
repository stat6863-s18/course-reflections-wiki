
# Questions about Problems and Recipes



[Chapter 10, Problem 1]
* Question (akanayev-stat6863): What the name of the macro variable for this proc sql? select distinct location into:sites separated by ' ';



[Chapter 11, Problem 2]
* Question (akanayev-stat6863): If you use mixed parameter whci parameter should list first (positional or keyword)?



[Chapter 11, Problem 3]
* Question (akanayev-stat6863): Which system option can you use to monitor macro execution? 



[Chapter 10, Problem 4] 
* Question (akanayev-stat6863): Does SAS resolve references to macro variable within %IF %THEN when it executes macro?



[Chapter 10, Problem 5] 
* Question (akanayev-stat6863): What type of expression we can use %eval macro function for?



[Advanced-Dry-Programming-Pattern Week 3 SAS Recipe]
* Question (akanayev-stat6863): Does "." at the end of macro variable act as separator of another macro variable or text?
* Question (akanayev-stat6863): When %scan macro function is appropriate to use?
* Question (akanayev-stat6863): What value does countw function resolve for this recipe?
* Question (akanayev-stat6863): Which catalogue is SAS macro definition saved after execution?



[Basic_Recipe_for_Loading_Data_from_Remote_Excel_file  Week 3 SAS Recipe]
* Question (akanayev-stat6863): What does that mean the message: NOTE 200 OK in SAS log?


[Bonus_Advanced_Recipe_For_Loading_Data_From_Remote_Excel_File Week 3 SAS Recipe]
* Question (akanayev-stat6863): What does exist function return in this SAS recipe?


***



# Recipes Exploration Results




```
* Recipe: basic_recipe_for_loading_data_from_remote_Excel_file ;

* original recipe:
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



* Recipe: bonus_advanced_recipe_for_loading_data_from_remote_Excel_file ;

* original recipe:
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




* Recipe: advanced-dry-programming-pattern ;

* original recipe:
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
    %let callDate = %sysfunc(today(), weekdate.);

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




```