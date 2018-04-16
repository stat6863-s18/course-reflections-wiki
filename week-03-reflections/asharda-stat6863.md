
# Questions about Problems and Recipes



[Chapter 10, Problem 7]
* Question (asharda-stat6863):How to create a macro variable during the execution of a PROC SQL step?.
- Answer (asharda-stat6863): To create a macro variable during the execution of a PROC SQL step, use the INTO clause of the SELECT statement.



[Chapter 11, Problem 1]
* Question (asharda-stat6863):What should a macro definition begin and end with?.
- Answer (asharda-stat6863): A macro definition must begin with a %MACRO statement and must end with a %MEND statement. 



[Chapter 11, Problem 3]
* Question (asharda-stat6863):How do you call a macro that includes positional parameters?.
- Answer (asharda-stat6863): To call a macro that includes positional parameters, you precede the macro name with a percent sign. 



[Chapter 11, Problem 5]
* Question (asharda-stat6863)What happens when you submit a macro definition?.
- Answer (asharda-stat6863): When you submit a macro definition, the macro is compiled and is stored in a SAS catalog. 



[Chapter 11, Problem 10]
* Question (asharda-stat6863)What happens when you submit a call to compiled macro?.



[Advanced Dry Programming Pattern Week 02 SAS Recipe]
* Question (asharda-stat6863):How is SAS Macro different from functions in languages like R and Python?.



[Basic recipe for loading data from excel file  Week 02 SAS Recipe]
* Question (asharda-stat6863):Why is proc import important to learn?.



[Bonus Advanced Recipe recipe for loading data from excel file  Week 02 SAS Recipe]
* Question (asharda-stat6863):What are the main benefits of using macro

***



# Recipes Exploration Results



```


*Recipe :Advanced Dry Programming Pattern ;
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



* basic_recipe_for_loading_data_from_remote_Excel_file ;
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



* bonus_advanced_recipe_for_loading_data_from_remote_Excel_file ;
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
