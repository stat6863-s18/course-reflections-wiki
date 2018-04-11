
# Questions about Problems and Recipes



[Chapter 9, Problem 1]

* Question (lceballos-stat6863): Do SAS macros support recursions?
* Answer (lceballos-stat6863): SAS macros do support recursions.



[Chapter 9, Problem 5]

* Question (lceballos-stat6863): Can you designate the variable data type when using macros?



[Chapter 9, Problem 7]

* Question (lceballos-stat6863): When performing a function that is case insensitive, how can you do it while ignoring the case of the characters?
* Answer (lceballos-stat6863): Use upcase.



[Chapter 10, Problem 7]

* Question (lceballos-stat6863): Does SAS support global variables?



[Chapter 10, Problem 8]

* Question (lceballos-stat6863): Can you delay the resolution of a variable that isn't in a macro?



[print-to-log-with-macro-variables Week 2 SAS Recipe]

* Question (lceballos-stat6863): Instead of using an editor with SAS is there a command line option for SAS?



[basic-dry-programming-pattern Week 2 SAS Recipe]

* Question (lceballos-stat6863): How can I print delayed variables (&&), in one line instead of multiple lines when calling a macro?



***



# Recipes Exploration Results



```


* Recipe: basic-dry-programming-pattern;
* Original recipe: 

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


* modified to print a greeting using the delayed deassignment function;
* note there is no need for quotation marks when assigning text to variables;

options mprint;
%macro Greeting;
    %let Text1 = Hello;
    %let Text2 = how;
    %let Text3 = are;
	%let Text4 = you;
    %do i = 1 %to 4;
       	%let greet = &&Text&i.;
		%put &=greet.;
    %end;
%mend;
%Greeting

Recipe: print-to-log-with-macro-variables
Original Recipe:
%put <text to print to log>;


* Added text to variable to print out
* Note the need for a period to let SAS know when the variable name stops

%let Text1 = Hello;
%put &Text1. How are you;
%put This is a greeting;
%put _user_;

/*



```
