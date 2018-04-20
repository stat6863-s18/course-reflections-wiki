# Questions about Problems and Recipes



[Chapter 9, Problem 1]
* Question (akanayev-stat6863): Can user-defined variables have only that are literal strings?



[Chapter 9, Problem 2]
* Question (akanayev-stat6863): what the following code do: %let t = Report First, not Last; %scan(&t,2);



[Chapter 9, Problem 3]
* Question (akanayev-stat6863): What type of tokens are SAS processing? 
* Question (akanayev-stat6863): What is format of macro variable &sysdate when it resolves to SAS log?
* Question (akanayev-stat6863): What is difference between global and local macro variables, where each of them are stored?



[Chapter 10, Problem 1] 
* Question (akanayev-stat6863): Can we use both positional and keyword parameters in macros, does the order of parameters matter?



[Chapter 10, Problem 2] 
* Question (akanayev-stat6863): How to output the content of macro that is stored work.sasmacr catalog?
* Question (akanayev-stat6863): When is SAS compling macro and when is SAS executing macro?



[print-to-log-with-macro-variables Week 2 SAS Recipe]
* Question (akanayev-stat6863): What is the value of the following macro variable: %let month1=June; %let p = &month1.Aug;
* Question (akanayev-stat6863): What is the value and the length of the following macro variable: %let a =       Azamat Kanayev      ; 



[Do-Not-Repeat Week 2 SAS Recipe]
* Question (akanayev-stat6863): Can we use PROC SQL and INTO: statement together to write alternative code for this SAS Recipe (create the list of speciesx to refer to further in data step)?



***



# Recipes Exploration Results




```
* Recipe: print-to-log-with-macro-variables;

* original recipe:
%let recipeName = print-to-log-with-macro-variables;
%put This is an example of the recipe &recipeName.;
%put This is an example of &=recipeName.;
%put _user_;

*modification:
%put User-defined macro variable &recipeName;



* Recipe: basic-dry-programming-pattern;

* original recipe with title of each proc means report:
&symdel recipeName;
option mprint;
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
		proc means n nmiss mean q1 median q3 maxdec=1;
        *title "The &currentSpecies.";
		run;
    %end;
%mend;
%splitDatasetAndPrintMeans
run;     




```


