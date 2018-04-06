
# Questions about Problems and Recipes



[Course Structure Quiz, Problem 1]
* Question (ttruong59-stat6863): How many weekly forum posts does a student need to complete in order to earn the Reading for Breath achievement for the course? 
* Answer (ttruong59-stat6863): Student needs to meet at least 8 out of 10 weekly forum posts to earn the Reading for Breath achievement.



[Course Structure Quiz, Problem 2]
* Question (ttruong59-stat6863): How many weekly quizzes does a student need to complete in order to earn the Reading for Depth achievement for the course?
* Answer (ttruong59-stat6863): Student needs to meet at least 8 out of 10 weekly quizzes to earn the Reading for Depth achievement.



[Course Structure Quiz, Problem 3]
* Question (ttruong59-stat6863): How many project steps does a student need to complete in order to earn the Team-based Problem Solving achievement for the course?
* Answer (ttruong59-stat6863): Student needs to complete 9 steps, beginning with the selection of a broad research interests.



[Course Structure Quiz, Problem 4]
* Question (ttruong59-stat6863): In order to earn a good grade, an A for example, in for this course, which achievements should be earned?
* Answer (ttruong59-stat6863): Students needs to complete all 5 professional practices throughout the course to earn an A.



[Course Structure Quiz, Problem 5]
* Question (ttruong59-stat6863): What is the best way or channel to reach out to the instruction with questions?
* Answer (ttruong59-stat6863): Slack


[hello-world Week 1 SAS Recipe]
* Question (ttruong59-stat6863): Is there any difference when using single quote (') and double quote (") mark with a PUT statement?
* Answer (ttruong59-stat6863): SAS recognizes both single and double quote marks and allows to have two deep quoting.



[fizz-buzz Week 1 SAS Recipe]
* Question (ttruong58-stat6863): What is the printout of numbers that are multiples of both three and five?
* Answer (ttruong59-stat6863): 15,30,45,60,75,90



***



# Recipes Exploration Results



```


* Recipe: hello-world ;
* original recipe:
data _null_;
    put "Hello , STAT 6863! This is <your-name >!";
run;

* modified to print the content of a macro variable;
* note the need to switch to double-quote for the macro variable to render;
%let your_name = Tuan Truong;
data _null_;
    put "Hello STAT 6863! This is &your_name.!";
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
%let mod1 = 15;
%let mod1msg = FizzBuzz;
%let mod2 = 3;
%let mod2msg = Fizz;
%let mod3 = 5;
%let mod3msg = Buzz;
data _null_;
    do i = 1 to 100;
        if mod(i,&mod1.) = 0 then put "&mod1msg.";
        else if mod(i,&mod2.) = 0 then put "&mod2msg";
        else if mod(i,&mod3.) = 0 then put "&mod3msg";
        else put i=;
    end;
run;



```

