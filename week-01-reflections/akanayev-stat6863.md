
# Questions about Problems and Recipes

***
[Problem 1]
*SAS Macro variables example:

[Problem 2]
*Another SAS macro;

[Problem 3]
*What values can Automatic and user defined macro variables?
***

[Problem 4]
*What is value and length of %let name= Marie Hudson   ;?

[Problem 5]
What type of tokens is available in SAS?

# Recipes Exploration Results
```
1.
options symbolgen;
%let mod1=15;
%let mod2=3;
%let mod3=5;
%let a=FizzBuzz;
%let b=Fizz;
%let c=Buzz;
data _null_;
 do i=1 to 100;
   if mod(i,&mod1)=0 then put "&a";
   else if mod(i,&mod2)=0 then put "&b";
   else if mod(i,&mod3)=0 then put "&c";
   else put i=;
 end;
run;

2.
%let Class = STAT 6863;
%let Name=This is Azamat;
data _null_;
    put "Hello, &Class.! &Name";
run;
```






```
