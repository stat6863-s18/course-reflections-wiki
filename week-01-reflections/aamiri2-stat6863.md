
# Questions about Problems and Recipes



[Course Structure Quiz, Problem 4]
* Question (aamiri2-stat6863): Are Weekly Project Steps collaborative? Will we have the opportunity to work with a group of similar interests?


[Course Structure Quiz, Problem 5]
* Question (aamiri2-stat6863): Is the final course exam similar to the SAS certification exam?


[Course Structure Quiz, Problem 6]
* Question (aamiri2-stat6863): How will student grades be affected if they are missing one or two achievements?


[Course Structure Quiz, Problem 7]
* Question (aamiri2-stat6863): How many times can a student resubmit assignments with full credit?


[Course Structure Quiz, Problem 8]
* Question (aamiri2-stat6863): If a student completes all achievements and extra credit, do they  receive an A+ in the class?


[hello-world Week 1 SAS Recipe]
* Question (aamiri2-stat6863): When using SAS is there a way to change the font and font size in the output log?


[fizz-buzz Week 1 SAS Recipe]
* Question (aamiri2-stat6863): What is the difference between cpu time and real time? Do longer codes take more time to run?




***



# Recipes Exploration Results



```


* Recipe: hello-world ;

*original recipe
data _null_;
        put "Hello, STAT 6863! This is Arzoo Amiri!";
run;

*modified to print the content of a macro variable;
%let className = STAT 6863;
%let studentName = Arzoo Amiri;
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
data _null_;
    do i = 1 to 100;
        if mod (i,15) = 0 then put 'FizzBuzz';
        else if mod (i, 3) = 0 then put 'Fizz';
        else if mod (i,5) = 0 then put 'Buzz';
        else put i=;
    end;
run;



```
