
# Questions about Problems and Recipes


[Course Structure Quiz, Problem 5]
- Question (lsilveirajunior-stat6863): Will the final exam have multiple choice questions similar to the exercises done during the 10-week program or new material will be added to it?

  
[Course Structure Quiz, Problem 8]
- Question (lsilveirajunior-stat6863): Will extra credits be provided for implemented suggestions and corrections or just the participation and interaction will allow the student to get better grades?
  
[Course Structure Quiz, Problem 9]
- Question (lsilveirajunior-stat6863): After using Slack, I feel that it's a much easier interface to communicate than through emails. DMing through Slack would be an appropriate tool in a workplace environment or emails are more recommended? 
  
[Course Structure Quiz, Problem 2]
- Question (lsilveirajunior-stat6863): As a question and also a suggestion, wouldn't it be easier to send the weekly forum post through Slack or GitHub as a way of concentrating our submissions in a single platform?
  
[Course Structure Quiz, Problem 6]
- Question (lsilveirajunior-stat6863): How much weight will Team-based Problem Solving Achievement affect the final grade? If the group doesn't perform well, is it possible to perform other tasks to achieve better grades?

***



# Recipes Exploration Results



```


**Recipe: Class greeting;

%let className = STAT 6863;
%let studentName = Luiz Silveira;
data _null_;
    put "Hello, &className.!";
    put "My name is &studentName."
run;



** Recipe: FizzBuzz print when divisible by 15;

data _null_;
    do i = 1 to 100;
        if mod (i,15) = 0 then put "FizzBuzz";
        else if mod (i, 3) = 0 then put "Fizz";
        else if mod (i,5) = 0 then put "Buzz";
        else put i=;
    end;
run;


[Course Structure Quiz, Problem 5]
- Question (lsilveirajunior-stat6863): Will the final exam have multiple choice questions similar to the exercises done during the 10-week program or new material will be added to it?

  
[Course Structure Quiz, Problem 8]
- Question (lsilveirajunior-stat6863): Will extra credits be provided for implemented suggestions and corrections or just the participation and interaction will allow the student to get better grades?
  
[Course Structure Quiz, Problem 9]
- Question (lsilveirajunior-stat6863): After using Slack, I feel that it's a much easier interface to communicate than through emails. DMing through Slack would be an appropriate tool in a workplace environment or emails are more recommended? 
  
[Course Structure Quiz, Problem 2]
- Question (lsilveirajunior-stat6863): As a question and also a suggestion, wouldn't it be easier to send the weekly forum post through Slack or GitHub as a way of concentrating our submissions in a single platform?
  
[Course Structure Quiz, Problem 6]
- Question (lsilveirajunior-stat6863): How much weight will Team-based Problem Solving Achievement affect the final grade? If the group doesn't perform well, is it possible to perform other tasks to achieve better grades?
