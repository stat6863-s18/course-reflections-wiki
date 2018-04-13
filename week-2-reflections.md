#Week 2 Reflections



[Chapter 9, Problem 1]
* Question (mcardoso3-stat6863):  What other type of macro variable is there besides user-defined macro variables?
- Answer (mcardoso3-stat6863):  There are also automatic macro variables, which are provided by SAS.


[Chapter 9, Problem 2]
* Question (mcardoso3-stat6863):  Why are double quotation marks needed to reference a macro variable in a title?



[Chapter 9, Problem 3]
* Question (mcardoso3-stat6863):  Which is more preferable to verify the value of a macro variable:  the SYMBOLGEN option, or the %PUT statement?



[Chapter 9, Problem 4]
* Question (mcardoso3-stat6863):  What is the difference between using % or & before a name token when processing a macro variable?



[Chapter 9, Problem 5]
* Question (mcardoso3-stat6863):  What is the significance to having an asterisk in a statement?



[Chapter 9, Problem 7]
* Question (mcardoso3-stat6863):  How can macro character functions manipulate character strings in macro variable values?
- Answer (mcardoso3-stat6863):  This can be done in many ways, including changing lowercase letters to uppercase, producing a substring of a character string, extracting a word from a character string, and determining the length of a character string.


[Chapter 9, Problem 8]
* Question (mcardoso3-stat6863):  Why can't SAS recognize expressions as a type of token?




[Chapter 9, Problem 9]
* Question (mcardoso3-stat6863):  What other delimeters, aside from a period, can be used to separate text within a macro variable?



[Chapter 10, Problem 1]
* Question (mcardoso3-stat6863):  In what applications would you not need to create macro variables during DATA step execution?



[Chapter 10, Problem 2]
* Question (mcardoso3-stat6863):  How many ways can you use SYMPUT in DATA steps?
- Answer (mcardoso3-stat6863):  You can use SYMPUT with a literal, DATA Step variable, and DATA Step expressions.


[Chapter 10, Problem 4]
* Question (mcardoso3-stat6863):  When refrencing macro variables indirectly, is it necessary to include a space between the step of creating the the macro variables and the step of indirectly referencing them?



[Chapter 10, Problem 5]
* Question (mcardoso3-stat6863):  What happens when you use more than four consecutive ampersands to precede a name token?



[Chapter 10, Problem 8]
* Question (mcardoso3-stat6863):  How would you reference other variables or values in a DATA step?



[Recipe]
* Question (mcardoso3-stat6863):  What is the difference between using an ampersand or percent sign for referencing macro variables?



[Recipe]
* Question (mcardoso3-stat6863):  How important are do loops for macro SAS programming?



***



# Recipes Exploration Results

Recipe:
%put <text to print to log>;

*/

*Example;
%let recipeName = print-to-log-with-macro-variables;
%put This is an example of the recipe &recipeName.;
%put This is an example of &=recipeName.;
%put _user_;

/*

Recipe:
%macro <macro-name>;

*/

options mrpint;
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
		if species = "currentSpecies.";
	run;
	proc means n nmiss min q1 median q3 max maxdec=1;
	run;
	%end;
%mend;
%splitDatasetAndPrintMeans

/*




```


