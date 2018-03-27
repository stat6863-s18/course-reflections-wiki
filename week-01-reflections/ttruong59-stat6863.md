
# Questions about Problems and Recipes



[Course Textbook Chapter 9, Problem 1]
- Question (ttruong59-stat6863): Are macro variables always user-defined, and their values remain constant until they are changed by the user? 
- Answer (ttruong59-stat6863): No. There are 2 types of macro variables: automatic and user-defined. SAS provides automatic macro variables that contain information about the computing environment. Automatic macro variables are created when SAS is invoked. We also can create and define own macro variables with the %LET statement.



[Course Textbook Chapter 9, Problem 2]
- Question (ttruong59-stat6863): How do users reference a macro variable?
- Answer (ttruong59-stat6863): Users need to precede the name with an ampersand (&) to reference a macro variable. 



[Course Textbook Chapter 9, Problem 4]
- Question (ttruong59-stat6863): Is it necessary to enclose the assigned value in quotation marks when creating a macro variable?
- Answer (ttruong59-stat6863): No. There’s no need to enclose the value in quotation marks. If we do, the quotation marks will be stored as part of the value exactly as it is assigned.



[Course Textbook Chapter 9, Problem 7]
- Question (ttruong59-stat6863): To manipulate character strings, which macro character functions enable users to perform character manipulations and/or change the value of a macro variable value?
- Answer (ttruong59-stat6863): Macro character functions like %UPCASE and %SUBSTR allow users to perform character manipulations on macro variable values. For instance, %UPCASE function allow users to change the value of a macro variable from lowercase to uppercase before submitting the value in a SAS program while %SUBSTR enables users to extract part of a character string from the value of a macro variable.



[Course Textbook Chapter 9, Problem 8]
- Question (ttruong59-stat6863): Is it possible to combine a macro variable reference with text?
- Answer (ttruong59-stat6863): Yes, it is possible to do so. Users can place text immediately before or after a macro variable reference. We can also be able to combine 2 macro variable references to create a new token. And there are 4 types of token that SAS recognizes as follows: literals, names, numbers, and special characters.




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
