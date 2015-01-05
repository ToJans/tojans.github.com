---
layout: post
title: "about dependent typing, Idris and the road to Valhalla"
date: 2014-11-27 08:36
comments: true
categories: 
---
Due to my DDD background, I am constantly on a quest for the utopian domain model. 

Last week during [the Build Stuff 2014 conference](http://buildstuff.lt) I saw a presentation by [Amanda Laucher](https://twitter.com/pandamonial) 
about dependent typing that spiked my interest. Here is a short interview with her:
<iframe width="560" height="315" src="//www.youtube.com/embed/E5XbCwwPTb0" frameborder="0" allowfullscreen></iframe>

I somehow feel that dependent typing might bring us one step closer to the utopian domain model, and in this post I will try to explain you why I think this is the case.

# So, what exactly is dependent typing?

You can check the validity of your model on different points in the software lifecycle. 
I will give an opinionated list ordered from `check everything at run-time` to `check everything at compile-time`:

## Dynamically typed code

* Compile time checks: none
* Post-compile checks: none
* Run-time checks: none

## Statically typed code

* Compile time checks: primitives and classes
* Post-compile checks: none
* Run-time checks: in some cases overflow and downcasting mismatches

## Statically typed code using TDD

* Compile time checks: primitives and classes
* Post-compile checks: some behavior gets verified using a static set of test cases
* Run-time checks: in some cases overflow and downcasting mismatches

## Statically typed code using property-based testing

* Compile time checks: primitives and classes
* Post-compile checks: some behavior gets verified using a dynamic set of test cases built at test-time based on some constraints the developer defines 
* Run-time checks: in some cases overflow and downcasting mismatches

## Statically typed code using code contracts

(I have never used this, so I am making some assumptions here. If I made a mistake, please tell me in the comments, and I'll fix it.)

* Compile time checks: primitives and classes
* Post-compile checks: some behavior gets verified to see whether there is no mismatch between the functions calling eachother and the contracts they adhere to
* Run-time checks: pre-and post-conditions might be verified at runtime

## Dependently typed code

* Compile time checks: primitives, classes and kinds (f.e. an `int` can be of kind `negative`, `positive` or `zero`), 
  full proof that your model behaves in the way that you programmed it. This might sound odd, so I'll give an example in the next section.
* Post-compile checks: none AFAIK
* Run-time checks: none AFAIK
  
Based on my previous assumptions mentioned here, you could say that dependent typing is something that allows you verify your system's behavior at compile-time, 
and even have proof that it works the way you want it to work, so this is the utopian goal I was trying to achieve, correct?

![Nailed it](http://4.bp.blogspot.com/-bRpZyy2YqpY/U392wDd-qSI/AAAAAAAACbk/y_t7M5t7Ff0/s1600/1231622_244281602442693_997882900_n.jpg)

Wrong! I will tell you later why this reasoning is flawed, but first I will show you how I got to a deeper understanding about the necessity of dependent typing:

# So, what exactly is dependent typing - again?

## The insight

As I was trying to figure out what dependent typing exactly was by nagging [Mathias Brandewinter](https://twitter.com/brandewinder) and 
[Andrea Magnorsky](https://twitter.com/silverSpoon), I had an idea: I would try spiking [the bowling kata](http://codingdojo.org/cgi-bin/index.pl?KataBowling) 
in [Idris](https://twitter.com/silverSpoon), one of the more recent dependently typed languages that looks similar to Haskell.

I got as far as installing the Idris executable using the link that Andrea provided me. When I told them about the idea to do the bowling kata in Idris, they 
told me it was way too complicated to get started, and that I should follow the tutorial instead.

Of course, being the obnoxius wiseacre that I always am, I decided I first needed to find out **why** dependently typed languages even needed to exist. 
So I decided to do the bowling kata in F#, but trying to craft a model that did not allow any invalid states, only using types.

## "Only using types" - WHUT?

Only using types would imply that any instance you can declare is valid, so an invalid state is not representable. 

For example:

- a `frame` either has one `throw` in which case it is a `strike`, or it can have 2 `throws`
- if a `frame` has 2 `throws`, the sum of the `pins down` can be no larger than 10
- a `game` has exactly 10 `frames`

So I started experimenting, and luckily, after he'd seen me struggling, [Andrew](https://twitter.com/andrewscj) joined in. 

I explained him what I was trying to achieve, and in the beginning of our experiments we were running around in circles trying to find the proper way to do this. 
It was only after Mathias Brandewinter gave us some pointers about the fact that we shouldn't be using an `int` to count, but explicit types, 
that we got on the right track.

For example, because a `game` has exactly 10 `frames`, and we cannot enforce this using typing, so we needed a record instead, containing 10 `frames`.
(This turned out to be wrong as well, because the `final frame` is a different type, as you'll see later.)

Anyway, we did not get very far with this spike - probably due to the lack of sleep during the week of the conference ;) -, but luckily Andrew went the extra mile, and
actually implemented the whole thing using F#, and [pushed it to github](https://github.com/ascjones/BowlingKata) yesterday. 

I'll add the excerpt of the types here, but I'd advise you to take a look at the full thing.

<code>
    type Game =
        { F1 : Frame; F2 : Frame; F3 : Frame; F4 : Frame; F5 : Frame; F6 : Frame; F7 : Frame; F8 : Frame; F9 : Frame; F10 : FinalFrame } 
        
    and Frame = 
        | Strike
        | Spare of PinCount 
        | Pins of PinCombo
        
    // Separate type for final frame because it is special, e.g. only have bonus rolls when it's a strike
    and FinalFrame =
        | Strike of StrikeBonusRolls
        | Spare of PinCount * SpareBonusRoll
        | Pins of PinCombo
        
    and StrikeBonusRolls = 
        | TwoStrikes
        | BonusSpare
        | BonusPins of PinCombo
        
    and SpareBonusRoll = 
        | BonusPins of PinCount
        | BonusStrike
        
    and PinCount = P0 | P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 | P9

    // All the allowable combinations of pins that are not spares
    and PinCombo = 
        | P0_0 | P0_1 | P0_2 | P0_3 | P0_4 | P0_5 | P0_6
        | P0_7 | P0_8 | P0_9 | P1_0 | P1_1 | P1_2 | P1_3
        | P1_4 | P1_5 | P1_6 | P1_7 | P1_8 | P2_0 | P2_1
        | P2_2 | P2_3 | P2_4 | P2_5 | P2_6 | P2_7 | P3_0
        | P3_1 | P3_2 | P3_3 | P3_4 | P3_5 | P3_6 | P4_0
        | P4_1 | P4_2 | P4_3 | P4_4 | P4_5 | P5_0 | P5_1
        | P5_2 | P5_3 | P5_4 | P6_0 | P6_1 | P6_2 | P6_3
        | P7_0 | P7_1 | P7_2 | P8_0 | P8_1 | P9_0
</code>
While really verbose, the thing you'll notice if you look into it, is that you are unable to represent illegal state, just due to 
the way the types have been implemented, **and that, my dear friends, is why we need dependent typing**!

Dependent typing would allow you to define constraints like: if there are 2 `throws` in a `frame` the `pincombo` can never exceed 10 pins...

So we could probably replace all these auto-generated types representing values by defining `kinds`.

# Why isn't this the utopian model I was trying to achieve?

If I can prove that the system does what I tell it to do, then there can be no flaws, so I have just showed you a perfect software model, correct?

** WRONG **

Well, it might be, but to be honest, I cannot really prove this, even if I would be able to prove this using dependent typing. 

Why not? It was during one of those nightly discussions at the bar that [Ronan Klyne](https://twitter.com/ronanklyne) pinpointed me to the exact 
flaw in my reasoning...

Dependent typing can prove that the model does what you tell it to do, and nothing more. Let's say for example that some function in my solution domain should be associative, i.e. 
`(a <+> b) <+> c = a <+> (b <+> c)`.

If I somehow forget to mention this property in my code, but it is in my domain model, I have an imperfect model of reality, because I missed some aspects. 

> So dependent typing only proves my model does what I tell it to do; if I tell it the wrong or incomplete things, it might still be wrong.

However, I would assume that dependent typing might bring development one step closer to the thruth, so I want to learn to do this properly.

# What's next ?

I want to be able to develop the bowling kata in Idris by the time we go the same conference next year (i.e. November 2015).
I have setup a github repo where **you can join our learning group by submitting a pull request that adds your name to the README**. 

So if you want to learn Idris over the course of the next year, please join; 

> You can sign up by submitting a pull request [here](https://github.com/ToJans/idris101).







