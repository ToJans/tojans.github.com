---
layout: post
date: "2015-02-06"
slug: "how-to-explain-dependent-typing"
title: "How to explain dependent typing"
comments: true
categories: 
---
 
Take an average programmer - let's call him Joe D. - and have him talk to a fictitious academic called Alan T.:

## What doesn't work

Alan: Hi, Joe, what's up? What can I help you with?

Joe: Hi Alan. I heard about this thing called Idris and you are the expert; what is Idris exactly?

A: It's a dependently typed language, why are you asking?

J: Well, I heard you can improve your code with it, but I haven't got a clue how it works. What is this dependent typing thing?

A: Ah dependent typing is easy:

a dependent type is a type that depends on a value. It is an overlapping feature of math-encoding type theory and bug-stopping type systems. In intuitionistic type theory, dependent types are used to encode logic's quantifiers like "for all" and "there exists". In functional programming languages like ATS, Agda, Idris and Epigram, dependent types prevent bugs by allowing very expressive types.

J: Ok, thanks, that's too complicated for me, I think I'll pass for this one...

...

## What might work

That wasn't exactly a home-run, let's try again:

J: What is dependent typing?

A: Well, it's hard to explain, but I'll try to explain it in a few ways. I assume when you write code, you need to have all kinds of asserts and null checks to make sure the data you use as input is valid, correct?

J: Yes?

A: Well, if you concatenate 2 lists of length 2 and 3, then Idris figures out at compile time that your resulting list has a length of 5, so doing something like `list[10]` will throw a compile time error...

J: Hmm, I think I've seen something similar in code contracts?

A: Some of it is comparable, but it's actually different. For now just assume that dependent types allow you to describe types that can never have invalid instances, by enforcing this at compile time. (Like the list example I gave you.) You could specify for example a record `{a:int,b:int} where a<100 and a+b<100`, and enforce this at compile time.... But there's more!

J: I'm interested, please continue...

A: You heard about TDD/Test driven development?

J: Yes, it's where you use tests to specify what the behavior of your class or function should be, before you write the class.

A: The problem with that is, there are an infinite number of possibilities, so if you write a function `sum(int a,int b)`, you can start with a test of `0, 0`, then `0, 1`, then `1, 1`, and continue like that.

J: Sure, but after a while you realize you can extrapolate, correct, so you look for edge cases.

A: But how can you make sure you have all the edge cases?

J: Well, you are never a 100% sure, but hey, that's the way we roll as developers, don't we?

A: Have you ever heard about property based testing?

J: No, what's that?

A: I'll simplify it, but what if you defined your parameters for your tests using generators? And the results of the tests have to comply to some rules...

J: What do you mean?

A: Well, instead of writing all these tests for every single instance of `a` and `b` for the `sum` function, what if we generated a thousand random numbers for both, and just verified the outcome?

J: How would you do that?

A: Well, there's a few simple rules you can state for a sum of two integers `a` and `b`:

J: Yes?

A: `a+b = b+a;a<=a+b; b<=a+b` just to give a few

I know these sound rather silly, but there's a lot of edge cases that might show up if you are not talking about a simple sum..

J: That's a relatively new concept, can you give me another example?

A: Sure, think about `string.reverse`: the length should be equal every time, reversing a string twice should result in the original string etc...

J: Ah ok, I think I get it; if some random value doesn't comply with the rules you defined, you need to figure out if it's the rules that are wrong, or your behavior. 

A: Yes, if the rules are set for a while, and a test crashes, it is usually the behavior that will be wrong...

J: Ok, I get it; what does this have to do with dependent typing?

A: Let's go back to the sum example; imagine the rules `a+b = b+a` and `(a+b)+c = a+(b+c)`; do those ring a bell if you think back about school math?

J: Oh boy, that's been a while... The second one is associative, but the first one?

A: Commutative... Now, let's imagine these rules again. Do you remember using them at school to prove something?

J: Yes?

A: You can do that with your types to; you can actually prove that your types "work".

J: Hmmz sounds interesting, but also complicated... How would I get started and how long would it take to get up to speed with this.

A: Learning to prove something might take a bit longer, but you could start reaping the benefits by writing code in Idris using some predefined dependent types, like `Fin`, which defines natural numbers within the range `0..N-1`. 

J: ?

A: An instance of the type `Fin 100` can contain only values between 0 and smaller than 100.

J: Let's start with a simple code kata: did you ever hear about `99 bottles of beer on the wall` ?

...

We actually got started on this kata in our [Idris101 group learning project](https://twitter.com/search?q=idris101), and you can check progress [here](https://github.com/ToJans/idris101/tree/master/katas/001).



## How to explain dependent typing?

I see the same symptoms over and over again: whenever we learn a new tech/language/framework, we try to explain it to newcomers using the domain specific terminology. That doesn't work at all.

I remember that, when I was about the age of 7, I learned programming by typing the sourcecode that I had in a book. By changing the parameters, I slowly grasped more and more concepts.

This is similar to monads in Haskell: don't learn the theory, just use the implementations (`maybe`, `either`, ...). If you add a `do` in front, it's just like imperative programming. That should get you started; you can always figure it out later.

Also, find someone smart, who can explain it in a way you can understand it. When I was looking for someone who could explain me what Haskell lenses were; [Scott](https://twitter.com/ScottWlaschin) told me: it's something you could  compare to property getters and setters. Aha-Erlebnis on the spot!

Whenever I give a talk about [DDD](http://en.wikipedia.org/wiki/Domain-driven_design) to a crowd that's relatively unkown with DDD, I try to avoid as much DDD lingo as I can, because **making your audience feel stupid doesn't help to convey the message**.

If you ask my opinion: don't throw type category at people when they want to learn Idris, but try to give short and small examples and exercises that are a bit less abstract then the usual things academics propose. For inspiration I'd like to direct you to [rosettacode.org](http://rosettacode.org/). That how I usually learned languages, and for me it works!