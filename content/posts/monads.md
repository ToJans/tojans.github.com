---
layout: post
date: "2013-10-06"
slug: "monads"
title: "monads"
comments: true
categories: 
---

# So, what is a monad?

I get sick and tired of people making simple things complicated, so when someone told me he was going to take a look at what a monad is, I assumed it was time to intervene; this is [the wikipedia explanation](https://en.wikipedia.org/wiki/Monad_(functional_programming):

>In functional programming, a monad is a structure that represents computations defined as sequences of steps. A type with a monad structure defines what it means to chain operations, or nest functions of that type together. This allows the programmer to build pipelines that process data in steps, in which each action is decorated with additional processing rules provided by the monad.[1] As such, monads have been described as "programmable semicolons"; a semicolon is the operator used to chain together individual statements in many imperative programming languages,[1] thus the expression implies that extra code will be executed between the statements in the pipeline. Monads have also been explained with a physical metaphor as assembly lines, where a conveyor belt transports data between functional units that transform it one step at a time.[2] They can also be seen as a functional design pattern to build generic types.

That sounds like a sentence that requires you to have a large beard, no social skills and an IQ of over 150 to understand it!!

<a href="https://www.flickr.com/photos/zieak/3556541709/" title="World Beard and Moustache Championship - Roland van Den Bremt by zieak, on Flickr"><img src="https://farm4.staticflickr.com/3631/3556541709_7a23f2d7ff.jpg" width="500" height="375" alt="I am not claiming these guys have no social skills, but they do have a great beard!"></a>

I go to wikipedia to understand things, not to feel like a dumb*ss!

# Here is my take on what a monad is

So here was my response:

<blockquote class="twitter-tweet"><p>A monad is just a functional wrapper, f.e. &#10;&quot;maybe(AnInst).print()&quot; translates to &quot;if (AnInst!=null) AnInst.print()&quot; /cc <a href="https://twitter.com/sinasamavati">@sinasamavati</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/386807529881088000">October 6, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

