
# Questions about Problems and Recipes

[Course Structure Quiz, Question 1]
* Question (amartinez145-stat6863): What method will be used to share the Week1 setup demo (screen-sharing, video/teleconference, hangout IM only)? Should we send any files in advance?

[Course Structure Quiz, Question 10]
* Question (amartinez145-stat6863): Why are there multiple technologies with overlapping functionalities (file-sharing, messaging) used for this class?
* Answer (amartinez145-stat6863): To simulate potential work environments where technology is adopted piecemeal and holistic solutions are rare

[Weekly Reflections Instructions, Preparing contributions]
* Question (amartinez145-stat6863): What are good resources for identifying opportunities to explore coding options in SAS? SAS can be very procedure specific (only certain functions can be performed in certain procedures) and sometimes I am challenged by not understanding the limitations of certain commands/procedures and/or the meaning of a specific command or option.

[Weekly Reflections Instructions, Preparing contributions]
* Question (amartinez145-stat6863): Why do you call SAS codes “recipes”?

[Week 1 Project Step Instructions, Overall Workflow]
* Question (amartinez145-stat6863): How are collaboration teams determined? Are students required to build their own teams? How many students are allowed/preferred per team?

[hello-world Week 1 SAS Recipe]
* Question (amartinez145-stat6863): Is there a way of having SAS print to a different output destination than the log? (I had this question, too)

[fizz-buzz Week 1 SAS Recipe]
* Question (amartinez145-stat6863): I’m new to SAS macros. In this case, it seems that using a macro does not improve efficiency (more typing involved). Is there a rubric to help newer programmers decide when a macro should be used?




***



# Recipes Exploration Results



```

**Recipe: hello-world;

data _null_;
put "Hello World!!!";
run;


** Recipe: fizz-buzz;

data _null_;
do i = 1 to 100;
if mod(i,3) = 0 then put 'Fizz';
else if mod(i, 5) = 0 then put 'Buzz';
else put i=;
end;
run;

* modified to use macro variables to parametrize what's printed when; 
corrected code provided in the example contribution to reference “&mod2msg.” instead of "&mod1msg." 
in line 3 of the data step.

%let mod1 = 3;
%let mod1msg = Fizz;
%let mod2 = 5;
%let mod2msg = Buzz;
data _null_;
    do i = 1 to 100;
        if mod(i,&mod1.) = 0 then put "&mod1msg.";
        else if mod(i,&mod2.) = 0 then put "&mod2msg.";
        else put i=;
    end;
run;






```
