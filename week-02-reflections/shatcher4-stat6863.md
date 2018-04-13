
# Questions about Problems and Recipes



[Chapter 9, Problem 2]
* Question (shatcher4-stat6863): Why does an ampersand need to be placed before the macro variable name in order to reference a macro variable?



[Chapter 9, Problem 7]
* Question (shatcher4-stat6863): What is the purpose of using automatic macro variables over user-defined macro variables?



[Chapter 9, Problem 9]
* Question (shatcher4-stat6863): Can the %LET statement be used for other purposes besides defining macro variables?



[Chapter 10, Problem 2]
* Question (shatcher4-stat6863): Why does it matter whether SYMPUT is used with a DATA step variable or with DATA step expressions?



[Chapter 10, Problem 4]
* Question (shatcher4-stat6863): Why would you reference macro variables indirectly rather than directly?



[print-to-log-with-macro-variables Week 2 SAS Recipe]
* Question (shatcher4-stat6863): What is the difference between dereferencing with & versus &=?



[basic-dry-programming-pattern Week 2 SAS Recipe]
* Question (shatcher4-stat6863): Why is it necessary to have an augment-less macro?



***



# Recipes Exploration Results



```



* Recipe: print-to-log-with-macro-variable;

* original recipe:
%let recipeName = print-to-log-with-macro-variables;
%put This is an example of the recipe &recipeName.;
%put This is an example of &=recipeName.;
%put _user_;



* Recipe: reference-basic-dry-programming-pattern;

*original recipe:
options mprint;
%macro splitDatasetAndPrintMeans;
    %let species1 = Setosa;
    %let species2 = Versicolor;
    %let species3 = Virginica;
    %put _user_;
    %put;
    
    %do i = 1 %to 3;
        %let currentSpecies = &&species&i.;
        %put &=currentSpecies.;
        data iris_&currentSpecies.;
            set sashelp.iris;
            if species = "&currentSpecies.";
        run;
        proc means n nmiss min q1 median q3 max maxdec=1;
        run;
    %end;
%mend;
%splitDatasetAndPrintMeans
    
   


```
