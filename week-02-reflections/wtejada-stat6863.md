# Questions about Problems and Recipes

[Chapter 9, Problem 1]
* Question (wtejada-stat6863): Can Macro variables be defined and referenced absolutely anywhere?
* Answer (wtejada-stat6863): Yes, except for in datalines statements.


[Chapter 9, Problem 4]
* Question (wtejada-stat6863): When you use the %LET statement to define a Macro variable, can you store any possible character in the Macro Variable?

[Chapter 9, Problem 9]
* Question (wtejada-stat6863): How far in could you nest Macro variables? Indefinitely? 

[Chapter 10, Problem 1]
* Question (wtejada-stat6863): Is it possible to have a Macro Variable run at execution of a PROC step just like SYMPUT does for the DATA step?

[Chapter 10, Problem 5]
* Question (wtejada-stat6863): Is there a limit to the number of ampersand signs you can use for the resolution of Macro variable references?

[basic-dry-programming Week 2 SAS Recipe]
* Question (wtejada-stat6863): Why is it that a Macro variable is only resolved within double quotations?

[print-to-log-with-macro-variables Week 2 SAS Recipe]
* Question (wtejada-stat6863): Is the put statement and symbolgen almost synonymous?


# Recipes
```
* Recipe: print-to-log-with-macro-variables ;
* original recipe;

%let recipeName = print-to-log-with-macro-variables;
%put This is an example of the recipe &recipeName.;
%put This is an example of &=recipeName.;
%put _user_;
```

```

* Recipe: basic-dry-programming ;
* original recipe;

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
