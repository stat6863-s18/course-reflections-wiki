
# Questions about Problems and Recipes

[Course Structure Quiz, Problem 1]
* Question (mcardoso3-stat6863): What is the most important component to understand in the Week 1 Setup?



[Course Structure Quiz, Problem 2]
* Question (mcardoso3-stat6863): Could we submit an additional weekly forum post for extra credit?



[Course Structure Quiz, Problem 3]
* Question (mcardoso3-stat6863):  Can weekly reflections be resubmitted if partially complete?



[Course Structure Quiz, Problem 4]
* Question (mcardoso3-stat6863): What are the different project steps that will be used in this course?



[Course Structure Quiz, Problem 5]
* Question (mcardoso3-stat6863): What should we study from to best prepare ourselves for the final exam? 



[Course Structure Quiz, Problem 6]
* Question (mcardoso3-stat6863): Which achievement requires the most time to prepare for?



[Course Structure Quiz, Problem 7]
* Question (mcardoso3-stat6863):  Why can incomplete submissions be eligibible for resubmission, but late assignments can't be?



[Course Structure Quiz, Problem 8]
* Question (mcardoso3-stat6863):  Are there any additional ways the instructor can give extra credit?



[Course Structure Quiz, Problem 9]
* Question (mcardoso3-stat6863):  If my Slack workspace isn't working properly, what would be the next best option to contact the instructor?



[Course Structure Quiz, Problem 10]
* Question (mcardoso3-stat6863):  Will there be any new technologies that we will be expected to use for this course?



[hello-world Week 1 SAS Recipe]
* Question (mcardoso3-stat6863): How is the put statement a helpful debugging statements?



[fizz-buzz Week 1 SAS Recipe]
* Question (mcardoso3-stat6863):  What makes the fizz-buzz challenge unique?
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
%let className = STAT 6863;
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
%let mod1msg = Fizz;
%let mod2 = 5;
%let mod2msg = Buzz;
data _null_;
    do i = 1 to 100;
        if mod(i,& mod1.) = 0 then put "&mod1msg.";
        else if mod(i, &mod2.) = 0 then put "&mod1msg.";
        else put i=;
    end;
run;
```
