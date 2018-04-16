
# Questions about Problems and Recipes



[Chapter 9, Problem 1]
* Question (ajauregui-stat6863): Does the value of a macro variable ever realistically 
approach the 65,534 character limit? 
- Answer (ajauregui-stat6863):



[Chapter 9, Problem 2]
* Question (ajauregui-stat6863): What constitutes as a "delimter"? Is any sort of 
special character like periods, apostrophes, etc.?
- Answer (ajauregui-stat6863):



[Chapter 9, Problem 7]
* Question (ajauregui-stat6863): I'm not sure what answer b) is referring to. What exactly 
is a "DATA step function"?
- Answer (ajauregui-stat6863):



[Chapter 10, Problem 1]
* Question (ajauregui-stat6863): I'm not sure what is meant by "macro variable references." 
Do these refer to the values or to the built-in SAS macro variables?
- Answer (ajauregui-stat6863):



[Chapter 10, Problem 2]
* Question (ajauregui-stat6863): How would I include special characters in the 
call symput arguments?
- Answer (ajauregui-stat6863):



[Print-to-Log-with-Macro-Variables Week 2 SAS Recipe]
* Question (ajauregui-stat6863): Are there other uses for the "_user_" name? 
What exactly is it called? (string, name, etc.) 
- Answer (ajauregui-stat6863):



[Dry-Programming Week 2 SAS Recipe]
* Question (ajauregui-stat6863): Are there other uses for the macro shell 
recipe besides a do loop?
- Answer (ajauregui-stat6863):


***



# Recipes Exploration Results



```


Recipe:
%put <text to print to log>;

*/

*Example;

%let recipeName = print-to-log-with-macro-variable;
%put This is an example of the recipe &recipename.;
%put This is an example of &=recipeName.;
%put _user_;



* Recipe:
%macro <macro-name>;
    %let <macro-variable-name>1 = <value-1>;
    %let <macro-variable-name>2 = <value-2>;
    ...
    %let <macro-variable-name>n = <value-n>;

    %do i = 1 %to n;
        <code referencing &&<macro-variable-name>&i.>
    %end;
%mend;
%<macro-name>

*/

*Example;

option spool;
options mprint;
%macro splitDatasetAndPrintMeans;
	%let species1 = Setosa;
	%let species2 = Versicolor;
	%let species3 = Virginica;
	%put _user_;
	%put;

	%do i=1 %to 3;
		%let currentSpecies = &&species&i.;
		%put &=currentSpecies.;
		data iris_&currentSpecies.;
			set sashelp.iris;
			if species="&currentSpecies.";
		run;
		proc means n nmiss min q1 median q3 maxdec=1;
		run;
	%end;
%mend;
%splitDatasetAndPrintMeans



```
