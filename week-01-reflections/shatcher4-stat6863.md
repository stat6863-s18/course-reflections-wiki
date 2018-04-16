
# Questions about Problems and Recipes



[Course Structure Quiz, Problem 3]
* Question (shatcher4-stat6863): Why are only 8 of the 10 weekly reflections required, wouldn't it be beneficial for the students just have them all required?



[Course Structure Quiz, Problem 4]
* Question (shatcher4-stat6863): Why is the project broken up into so many steps rather than allowing the students to work towards an end goal and deciding how to break up the project themselves?



[Course Structure Quiz, Problem 5]
* Question (shatcher4-stat6863): How is the material to be included on the final exam determined?



[Course Structure Quiz, Problem 6]
* Question (shatcher4-stat6863): What is the benefit of the achievement structure of this class versus the normal grading structure of other classes?



[Course Structure Quiz, Problem 7]
* Question (shatcher4-stat6863): What makes an incomplete submission eligible for resubmission?



[hello-world Week 1 SAS Recipe]
* Question (shatcher4-stat6863): Since double quotes need to be used when macro variables are invovled, why are single quotes even used instead of using double quotes for everything?



[fizz-buzz Week 1 SAS Recipe]
* Question (shatcher4-stat6863): What is the benefit of using macro variables to do this challenge?



***



# Recipes Exploration Results



```


* Recipe: hello-world ;

* original recipe:
data _null_;
    put "Hello , STAT 6863! This is <your -name >!";
run;

* modified to print my full, legal name in place of “<your-name>”;
data _null_;
    put "Hello , STAT 6863! This is Sara Hatcher!";
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

* modified so that the word “FizzBuzz” is printed if the index variable i is divisible by 15
data _null_;
    do i = 1 to 100;
        if mod (i, 15) = 0 then put 'FizzBuzz';
        else if mod (i ,3) = 0 then put 'Fizz';
        else if mod (i , 5) = 0 then put 'Buzz';
        else put i =;
    end;
run;



```
