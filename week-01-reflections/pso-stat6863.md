
# Questions about Problems and Recipes



[Course Structure Quiz, Problem 1-4]
* Question (pso-stat6863): Was the magic numbers 8 and 10 and "met"? I'm not entirely sure I understood the first 4 questions.

[Course Structure Quiz, Problem 5]
* Question (pso-stat6863): How would weekly reflections prepare you for the final?

[Course Structure Quiz, Problem 6]
* Question (pso-stat6863): What exactly are these achievements? Can you give some examples?

[Course Structure Quiz, Problem 7]
* Question (pso-stat6863): Doesn't the sylabus say we can turn in late or incomplete submissions with your approval?

[Course Structure Quiz, Problem 8]
* Question (pso-stat6863): On average, how much extra credit have you given in a quarter?

[hello-world Week 1 SAS Recipe]
* Question (pso-stat6863): What is the difference between single and double quotes?
- Answer (pso-stat6863): Preference?

[fizz-buzz Week 1 SAS Recipe]
* Question (pso-stat6863): Is there a correct answer? Is the basis of the logic suppose to consist of 3 and 5?
- Answer (pso-stat6863): Maybe there are many answers.



***



# Recipes Exploration Results



```

* Recipe: hello-world example;

* original hello-world recipe:
data _null_;
    put 'Hello, World!';
run;

* modified hello-world recipe;
* create a table instead of showing in the log;

data hello;
    put "Hello, World!";
run;


* Recipe: fizz-buzz example;

* original fizz-buzz recipe:
data _null_;
    do i = 1 to 100;
        if mod(i,3) = 0 then put 'Fizz';
        else if mod(i, 5) = 0 then put 'Buzz';
        else put i=;
    end;
run;

* modified fizz-buzz example;
* changed numbers divisible by 15;

data _null_;
    do i = 1 to 100;
        if mod(i, 1) = 0 then put "FIZZ";
        else if mod(i, 15) = 0 then put "BUZZ";
        else put i=;
    end;
run;


```
