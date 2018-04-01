
# Questions about Problems and Recipes



[Course Structure Quiz, Problem 1]
* Question (lceballos-stat6863): What is the difference between forking and branching?



[Course Structure Quiz, Problem 2]
* Question (lceballos-stat6863): For the weekly forum posts, can we use other sources that are not on the weekly forum post instruction sheet?



[Course Structure Quiz, Problem 4]
* Question (lceballos-stat6863): For the code reviews, do we need a webcam or can we just screen share?



[Course Structure Quiz, Problem 6]
* Question (lceballos-stat6863): Can we use different website sources for the weekly forum posts?



[Course Structure Quiz, Problem 8]
* Question (lceballos-stat6863): How will extra credit be given if grade is dependent on acheivements?


[hello-world Week 1 SAS Recipe]
* Question (lceballos-stat6863): How can you import external modules or libraries in SAS?



[fizz-buzz Week 1 SAS Recipe]
* Question (lceballos-stat6863): Can you use lists or arrays in SAS?



***



# Recipes Exploration Results



```


* Recipe: hello-world;
* original recipe:

data _null_;
    put "Hello , STAT 6863! This is Luis Ceballos!";
run;

* modified to print the content of the macro variable name;
* note the need to switch to double-quote for the macro variable to render;
%let name = Luis Ceballos;
data _null_;
    put "Hello STAT 6863! This is &name.!";
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

* modified so that the word “FizzBuzz” is printed when the index variable i is divisible by 15

data _null_;
    do i = 1 to 100;
        if mod (i, 15) = 0 then put 'FizzBuzz';
        else if mod (i ,3) = 0 then put 'Fizz';
        else if mod (i , 5) = 0 then put 'Buzz';
        else put i =;
    end;
run;



```
