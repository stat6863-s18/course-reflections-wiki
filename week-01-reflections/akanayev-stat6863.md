# Questions about Problems and Recipes



[Course Structure Quiz, Problem 1]
* Question (akanayev-stat6863): Can we use SAS University Edition instead of SAS Base installed in BayCloud as more convenient way to  to practice SAS programmiing?



[Course Structure Quiz, Problem 3]
* Question (akanayev-stat6863): Is the purpose of Weekly Reflection assignment to understand weekly assigned course quiz problems as well as to explore SAS Recipes to be prepared for final exam?



[Course Structure Quiz, Problem 4]
* Question (akanayev-stat6863): What should we focus on to prepare for regular Google Hangouts meeting with instructor? 



[Course Structure Quiz, Problem 5]
* Question (akanayev-stat6863): To prepare for final exam should we focus on primarily on SAS Recipes in Weekly Reflection assignment?
* Question (akanayev-stat6863): What would be the instructor's guidelines to initiate, plan, conduct, monitor of status and present team-based data analysis project?



[hello-world Week 1 SAS Recipe]
* Question (akanayev-stat6863): Can we always use double quotation instead of using the single quotation to avoid erros in SAS log when we want to output text and macro variables together?
* Question (akanayev-stat6863): When we want to separate macro variable from text should we always put "." at the end of macro variables as a rule? For instance, in this part of SAS recipe of the problem: "&className."?



[fizz-buzz Week 1 SAS Recipe]
* Question (akanayev-stat6863): Is there alternative way to solve FizzBuzz problem without using IF-THEN-ELSE statement?
* Question (akanayev-stat6863): How many numbers are divided both in 3 and 5 between 1 and 100? 


***



# Recipes Exploration Results




```
* Recipe: hello-world ;

* original recipe:
data _null_;
    put 'Hello, World!';
run;

* modified to print the content of a macro variable;
* note the need to switch to double-quote for the macro variable to render;
&let className = STAT 6863;
data _null_;
    put "Hello, &className.!";
run;





* Recipe: fizz-buzz ;

* original recipe:
data _null_;
    do i = 1 to 100;
        if mod(i,3) = 0 then put 'Fizz';
        else if mod(i, 5) = 0 then put 'Buzz';
        else put i=;
    end;
run;     

* modified to use macro variables to parametrize what's printed when;
* note the need to switch to double-quote for macro variables to render;
%let mod1 = 3;
&let mod1msg = Fizz;
&let mod2 = 5;
%let mod2msg = Buzz;
data _null_;
    do i = 1 to 100;
        if mod(i,& mod1.) = 0 then put "&mod1msg.";
        else if mod(i, &mod2.) = 0 then put "mod1msg.";
        else put i=;
    end;
run;


```


