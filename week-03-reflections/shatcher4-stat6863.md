
# Questions about Problems and Recipes



[Chapter 10,Problem 7]
* Question (shatcher4-stat6863): What is the purpose of having an alternate form of INTO during the execution of a PROC SQL step?



[Chapter 11,Problem 1]
* Question (shatcher4-stat6863): Why does a macro program have to begin with a %MACRO statement and end with a %MEND statement?



[Chapter 11,Problem 3]
* Question (shatcher4-stat6863): How would a macro compile while still containing errors?



[Chapter 11,Problem 5]
* Question (shatcher4-stat6863): What is the purpose of the three different styles of macros?



[Chapter 11,Problem 10]
* Question (shatcher4-stat6863): Why is a non-executable (dummy) macro created when there are syntax errors during macro compilation?



[advanced-dry-programming-pattern Week 3 SAS Recipe]
* Question (shatcher4-stat6863): Why do you need the three global system options?



***



# Recipes Exploration Results



```


* Recipe: advanced-dry-programming-pattern;

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
