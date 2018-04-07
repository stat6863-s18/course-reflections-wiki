
# Questions about Problems and Recipes



[Chapter 9, Problem 1]
* Question (asharda-stat6863):Are Macro variables independent of SAS data sets?
- Answer (asharda-stat6863): Macro variables are always text strings that are independent of SAS data sets.



[Chapter 9, Problem 2]
* Question (asharda-stat6863):What do you need to do to reference a macro variable?
- Answer (asharda-stat6863): To reference a macro variable, you precede the name with an ampersand.



[Chapter 9, Problem 3]
* Question (asharda-stat6863):In how many ways can you display the value of a macro variable in the SAS log?
- Answer (asharda-stat6863): There are two ways to display the value of a macro variable in the SAS log.



[Chapter 9, Problem 4]
* Question (asharda-stat6863):Why do you use  %LET statement?
- Answer (asharda-stat6863): You use the %LET statement to define a macro variable.



[Chapter 9, Problem 5]
* Question (asharda-stat6863)How are Macro variables stored?
- Answer (asharda-stat6863): Macro variables are stored as character strings.



[Chapter 9, Problem 7]
* Question (asharda-stat6863)What does Macro character functions such as %UPCASE and %SUBSTR do?
- Answer (asharda-stat6863): Macro character functions such as %UPCASE and %SUBSTR enable you to perform character manipulations on your macro variable values.



[Chapter 9, Problem 8]
* Question (asharda-stat6863)How many types of token does word scanner recognize?
- Answer (asharda-stat6863): The word scanner recognizes four types of tokens.



[Chapter 9, Problem 9]
* Question (asharda-stat6863)What happens when you precede a macro variable with text?.



[Chapter 10, Problem 1]
* Question (asharda-stat6863)How are most macro functions handled?
- Answer (asharda-stat6863): Most macro functions are handled by the macro processor before any SAS language statements in the DATA step are executed.



[Chapter 10, Problem 2]
* Question (asharda-stat6863)How do you create a macro variable?



[Chapter 10, Problem 4]
* Question (asharda-stat6863)What is the use of multiple ampersands?
- Answer (asharda-stat6863): You can use multiple ampersands to create an indirect reference when the value of one macro variable is the name of another.



[Chapter 10, Problem 5]
* Question (asharda-stat6863)What does the Forward Rescan rule describe?.



[Chapter 10, Problem 8]
* Question (asharda-stat6863)How can you  delay the resolution of a macro variable reference?.



[print-to-log-with-macro-variables Week 2 SAS Recipe]
* Question (asharda-stat6863)What does the macro command %put do?.



[basic-dry-programming-pattern Week 2 SAS Recipe]
* Question (asharda-stat6863)Can macro variable values be Integer?.



***



# Recipes Exploration Results



```
1:
options symbolgen;
%let mod1=15;
%let mod2=3;
%let mod3=5;
%let x=FizzBuzz;
%let y=Fizz;
%let z=Buzz;
data _null_;
 do i=1 to 100;
   if mod(i,&mod1)=0 then put "&x";
   else if mod(i,&mod2)=0 then put "&y";
   else if mod(i,&mod3)=0 then put "&z";
   else put i=;
 end;
run;



2:
%let Class = STAT 6863;
%let Name=This is Ashish Sharda;
data _null_;
    put "Hello, &Class.! &Name";
run;



```
