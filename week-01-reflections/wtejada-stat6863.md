# Questions about Problems and Recipes

[Course Structure Quiz, Problem 1]
* Question (wtejada-stat6863):Is Github Desktop the same as Github accessed through a browser?

[Course Structure Quiz, Problem 2]
* Question (wtejada-stat6863):Can the forum posts be anything statistics related, or does it have to be based on programming? 

[Course Structure Quiz, Problem 3]
* Question (wtejada-stat6863): These answers are part of the reflection and are written in Markdown. Does that mean it is the same as the format RMarkdown uses?

[Course Structure Quiz, Problem 4]
* Question (wtejada-stat6863): The acheivement has the word “Team” in it. Does that mean we will be required to partner up at any point?

[Course Structure Quiz, Problem 5]
* Question (wtejada-stat6863):How long ago did you take the SAS Advanced Programmer Exam?

[hello-world Week 1 SAS Recipe]
* Question (wtejada-stat6863): In the 'Hello World!' program we used put to add a string to our dataset. Is there any other way to add a string other than by using put?

[fizz-buzz Week 1 SAS Recipe]
* Question (wtejada-stat6863):Is there another way of adding 'Fizz Buzz' other than using mod(i,15)?


# Recipes
```
* Recipe: hello-world ;
* original recipe:
data _null_;
    put 'Hello, World!';
run;
```
```
* Recipe: fizz-buzz ;
* original recipe:
data _null_;
    do i = 1 to 100;
        if mod(i,15)=0 then put 'Fizz Buzz';
		else if mod(i,3)=0 then put 'Fizz';
		else if mod(i,5)=0 the put 'Buzz';
		else put i=;
	end;
run;


```
***



```
