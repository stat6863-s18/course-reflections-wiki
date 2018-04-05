
# Questions about Problems and Recipes



[Course Structure Quiz, Problem 1]
* Question (asharda-stat6863):Is it common  to abbreviate the word "repository" as "repo"?



[Course Structure Quiz, Problem 2]
* Question (asharda-stat6863):How many minimum forum posts need to be completed?
- Answer (asharda-stat6863): 8 out of 10 forum posts need to be completed.



[Course Structure Quiz, Problem 3]
* Question (asharda-stat6863): What are reflections?



[Course Structure Quiz, Problem 4]
* Question (asharda-stat6863): How do you make sure your code review doesn't involve lot of back and forth?



[Course Structure Quiz, Problem 5]
* Question (asharda-stat6863): How will the final exam look like ?



[Course Structure Quiz, Problem 9]
* Question (asharda-stat6863): Can you direct message instructor through Slack?
- Answer (asharda-stat6863): Yes you can direct message instructor through Slack.



[Course Structure Quiz, Problem 10]
* Question (asharda-stat6863):Why do you need to check github daily?



[hello-world Week 1 SAS Recipe]
* Question (asharda-stat6863):Why are single quotes used in the example?.



[fizz-buzz Week 1 SAS Recipe]
* Question (asharda-stat6863):What is the use of mod function



***



# Recipes Exploration Results



```
* Recipe: hello-world ;

*original recipe
data _null_;
        put "Hello Guys! This is Ashish Sharda!";
run;

*modified to print the content of a macro variable;
%let className = STAT 6863;
%let studentName = Ashish Sharda;
data _null_;
    put "Hello, &className.!";
    put "My name is &studentName."
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

* modified code so that the word 'FizzBuzz' is printed if the index variable i is divisible by 15;
+data _null_;
    do i = 1 to 100;
        if mod (i,15) = 0 then put 'FizzBuzz';
        else if mod (i, 3) = 0 then put 'Fizz';
        else if mod (i,5) = 0 then put 'Buzz';
        else put i=;
    end;
run;



```
