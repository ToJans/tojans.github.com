---
layout: post
title: "The 5 simple rules of software development"
date: 2013-08-22 16:20
comments: true
categories: 
---

## 1. Throw away first iterations > Do it right the first time

When writing software, good enough is usually all it takes; the minute your good enough code starts hurting, is when you should replace it.

Trying to write code from an unknown domain perfectly during the first iteration will fail almost every time, as you start of with assumptions that are usually wrong.

I usually start over about 3 or 4 times before I have a decent base I can build my further explorations on.

Using this approach also avoids the fact that some people seem to get stuck on the start of a project, because they are afraid of failing. If you start with the assumption your first attempts are going to fail, this allows you to grow your understanding and be more flexible about your solution.

I would call this deliberate exploration.

### Update - some extras

Just to avoid some mistakes, this should be a really short period of time:

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/talboomerik">@talboomerik</a> <a href="https://twitter.com/unclebobmartin">@unclebobmartin</a> I am talking really short cycles here (i.e. spans of max a few hours, but usually way less)..</p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/384685527040946176">September 30, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/talboomerik">@talboomerik</a> <a href="https://twitter.com/unclebobmartin">@unclebobmartin</a> A typical example would be exploring your temporary solution using a REPL, to see whether it is usable.</p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/384684916509655041">September 30, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

So this is important: I just use these iterations to find a good fit for my solution space, after that I retrofit tests and start doing TDD, or I rewrite it
using TDD.



## 2. TDD retrofit > TDD always

Adhering to my first rule, I tend to switch from duct-tape development to TDD the moment I feel there is some complexity creeping in the code. 

Note that this complexity is usually the reason I throw away my first few iterations, as I need to find a good model to fit the problem/solution space.

Retrofitting tests and then switching to TDD seems to work out just fine for me.

## 3. Libraries > Frameworks

I have been bitten by this quite a few times, but usually frameworks get in the way after the initial ramp-up of a project, so I tend to opt for libraries instead.

FYI the difference between a library and a framework could be loosely specified as follows: a library is something you call from your code, and a framework is something that calls your code.

Given a mature enough system, the 80/20 rule usually applies: this is how using frameworks usually evolves:

- Spend 2 months building 80% of the product using a framework.
- Spend 8 months on 20% of the product working around the framework's limitations.

## 4. Many small things > A few big things

Explicit, short code wins every time. Try to express the model in the [ubiquitous language](http://martinfowler.com/bliki/UbiquitousLanguage.html), and minimize the amount of things happening in a single function/class/... . In functional language, a function should contain at max 5 lines, for example.

If it contains more then 5 lines, you might be doing things the wrong way. The 5 line rule might be harder in languages where you do not have things like pattern matching.

Make distinct functions for things that might change state and things that query state, almost never intermingle these. People refer to this as [Command-Query separation / CQS](http://en.wikipedia.org/wiki/Command%E2%80%93query_separation).

Small, share-nothing systems inspired by nature tend to be able to make complexity manageable, provided you use it in a proper way.

### BUT !!!

Don't overshoot the goal; only use extractions and abstractions to remove complexity. Never introduce these before you have the need for it. (Preferrably it has to hurt multiple times before you start abstracting/extracting away.)

> Make everything as simple as possible, but not simpler. - A. Einstein

## 5. Explicitness > Implicitness

Respecting rule #4, make sure you use intent-revealing function names, preferably in the [ubiquitous language](http://martinfowler.com/bliki/UbiquitousLanguage.html). 

Also, always respect [Tell-Don't-Ask / TDA ](http://pragprog.com/articles/tell-dont-ask); A simple example:

This is implicit:

```
if (account.Type == AccountType.A && account.Percentile > 90) then
  Mailer.Send(HolidayInitiative)
````

This is explicit:

```
if (account.IsVIP()) then
  Mailer.Send(HolidayInitiative)
```

If you think you don't have a proper name, invent one (`IsBogus` for example), and sooner or later the correct name will emerge.

# That's it

These are my 5 simple rules; however they took me over 20 years to acquire. I hope you enjoy them.

Use them ad libitum!

Tom