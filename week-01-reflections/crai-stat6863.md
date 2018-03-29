# Questions about Problems and Recipes

[Course Structure Quiz, Problem 1]
* Question(chinki stat6863) how many steps are in week 01 setup.
week01 has 12 steps for setup.5 in one part and 7 setups in the second part.

[Course Structure Quiz, Problem 2]
* Question (Chinki stat6863): What is the meaning of Reading for Breadth Achievement in Forum post?
Ans- By the name, its suggesting importance of reading and completing forum post will give this credit.

[Course Structure Quiz, Problem 3]
* Question ( chinki stat6863) Reflections will be mostly reading of books?
Ans- As per my understanding, Reflections will be reading and practicing codes.which include some extra readings as well.

[Course Structure Quiz, Problem 4]
* Question (Chinki stat6863) selection of broad research interests is part of step1?
Ans- No, selection of broad research is selection project and step one is agenda or interest in the area.

[Course Structure Quiz, Problem 5]
* Question (chinki stat6863) Weekly Reflections will guide us to final exam?
Ans- Weekly Reflections will be helpful for final exams.

[Course Structure Quiz, Problem 6]
* Question (chinki stat6863) Do we have to complete all the achievements to score A.
Ans- yes, we have to as written in grading criteria.

[Course Structure Quiz, Problem 7]
* Question (chinki stat6863) Github part late submission comes for pushing code?
Ans- yes, we should make push request before the submission date.

[Course Structure Quiz, Problem 8]
* question(chinki stat6863)  Extra credit for suggestions for improving clarity in course materials?
Ans- yes, it will be helpful for us.

[Course Structure Quiz, Problem 9]
* Question (Chinki stat6863) Can I direct message sent through the course slack group?
Ans- yes, we can but it is advisable to the email from horizon account.

[Course Structure Quiz, Problem 10]
* Question (Chinki Stat6663)  Should we use GitHub on daily basis?
Ans- we should use technology on daily basis to be expert in technology.

[hello-world Week 1 SAS Recipe]
* Question (Chinki Stat6663)  Why he is asking to print log and code.He might ask for output as we are doing in other courses.
Ans- I think log explains the error and he wants to see our error-free code.

[fizz-buzz Week 1 SAS Recipe]
* Question (Chinki Stat6663)  What is the use of mod function?
Ans- mod is used for checking remainder.




* Recipe: hello-world ;
*Program name: Program01 is stored in C:\Computational Statistics\SAS\Week01.  
Programmer: Chinki Rai Date Written: 27 March 2018;

data _null_;
    put "Hello, STAT 6863! This is Chinki Rai!";
run;

* Trying in macros ;
%let name=Chinki Rai;
%let classname=stat6863;

data _null_;
	put "Hello,&classname.! This is &name.!";
run;

* Recipe: fizz-buzz ;

*Program name: Program02 is stored in C:\Computational Statistics\SAS\Week01.  
Programmer: Chinki Rai Date Written: 27 March 2018;

data _null_;
	do i=1 to 100;
		if mod(i,15)=0 then put 'FizzBuzz';
		else put i= ;
	end;
run;

*With the use of Macros;
%let mod_15=15;
data _null_;
	do i=1 to 100;
		if mod(i,&mod_15.)=0 then put 'FizzBuzz';
		else put i=;
	end;
run;














