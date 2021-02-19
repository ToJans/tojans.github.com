---
layout: post
date: "2013-09-24"
slug: "software-architects-you-are-doing-it-wrong"
title: "Software architects, you are doing it wrong"
comments: true
categories: 
---

## Introduction

A [post by @abdullin](https://abdullin.com/journal/2013/9/23/how-to-produce-a-superb-software-design.html) nailed it pretty good: software architects are doing it wrong all the time. Here's why:
<blockquote class="twitter-tweet"><p>Made a sketch &quot;Software Architecture 101&quot;, but I REALLY need to use a thin marker or have less stuff <a href="https://twitter.com/search?q=%23Chaotic&amp;src=hash">#Chaotic</a> <a href="https://t.co/ZJptDRCD0z">pic.twitter.com/ZJptDRCD0z</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/382165786464231424">September 23, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


## CHAOS !!!

Well, it looks like chaos, but this is only because I used a big marker and no pencil, so there was no room for corrections, but allow me to clarify this [Behemoth](https://en.wikipedia.org/wiki/Behemoth).


<!-- more -->
## 1. Software architects need to rethink the reason for their existence.
![Why ???](https://i.snag.gy/QWtpz.jpg)

They need to reflect about why they exist. The stereotypical software architect used to be a really intelligent techie somewhat lacking social skills.
However, he was able to put together something that was a reasonable fit for the "regular devs", even though they did not really grasp everything that
happened behind the doors. The architect was the boss, and the developers were the followers.

The problem is the world is evolving; this approach made sense before we were in a knowledge economy, but the democratization of knowledge has resulted
in the fact that everyone can find, download and use a framework, library, platform, whatever and build out systems that meet the requirements. However,
it is the responsibility of a software architect to understand the cost, liability and impact of any given choice.

> The focus of a software architect has shifted from "what matches my requirements" to "what does not match my developers' requirements".

In the past you could either pick vendor and product A, B or C, and that was it. Now you have hundreds, maybe even thousands of vendors to choose from. 
You need a deeper understanding to grasp the true impact. 

Also, due to the plethora of choices, an architect [needs to be aware of a lot of things](https://skycoach.be/2013/04/04/the-modern-software-architect/), 
he can learn them at heart when he needs them. Because the architect needs to listen to it's developers, he should also be very proficient in social skills.


## 2. Software is not rigid.
![Antifragile? NOT !!](https://i.snag.gy/ojHyP.jpg)

When you build software, you start out with an idea. However, this is just one model; as you develop your piece of software you will notice it evolves.
This implies that your software architecture also might no longer be the best fit for the solution space.

> There is a [difference between easy and simple](/posts/continuous-thinking-essay-ease-and-simplicity-in-software-architecture//).
> Software architects should understand this, and use easy things for rigid parts, and simple things for instable parts.

A software architect needs to understand the potential cost and risk of his choices, and evolve his architecture where necessary, which brings us to the next 
part:


## 3. Flexibility is required.
![I am not THAT flexible ;-)](https://i.snag.gy/Fk3bo.jpg)

Some parts of your problem space might be relatively well known, and thus your initial ideas about the solution space might be quite good, so introducing some
technical debt (i.e. vendor lock-in etc) in that part should not be a problem, as long as you understand and motivate the change you make. 
Some parts of software are never touched after being initially written, and thus using quick win techniques (like drag 'n' drop development, 4GL's) should not be a problem really.

However, for the parts that are relatively unknown - and thus might change a lot - you require flexibility. Having a vendor lock-in in parts of your core domain
is an absolute no-no in my opinion, unless you are willing and able to do a complete rewrite. Once again it is the architect's responsibility to point out
liabilities like this.


## 4. Huge cost in "Silver Bullet" frameworks.
![Except for werewolves](https://i.snag.gy/btPt0.jpg)

Most of the software architects know ["No silver bullet" by Fred Brooks](https://en.wikipedia.org/wiki/No_Silver_Bullet) and are aware of things like 
["The second system effect"(i.e. one size fits all systems)](https://en.wikipedia.org/wiki/Second-system_effect).

However, every single architect - been there, done that, got the T-shirt - goes through the phase where he starts building a 
"generic software architecture framework" that will be used over the whole organisation. In fact, he or she might even evolve it into a vNext at the next
customer/client and so on.

> However, the fact is that - except for well-known problems and/or well-established solution spaces - a custom framework is almost never worth the
trouble. 

I am not saying that you should reimplement a http server, because that is a well-established domain, but for anything out of the ordinary
I would strongly advise against doing such a thing.

There are some exceptions to this rule (f.e. [NancyFx](https://nancyfx.org/), [Simple.Web](https://github.com/markrendle/Simple.Web)), but in an enterprise context the cost and risk of writing your own framework is usually not worth the potential gain.

Please note that this is my opinion regarding frameworks, libraries should not pose a problem given a reasonable approach.


## 5. But I need scalability
![Mine is bigger then yours!](https://i.snag.gy/o4AEJ.jpg)

Yes you do, so you can opt for framework/library X, but be aware:

> Just because you have a certain requirement that can be met by using component X, does not imply you have to use it everywhere.

Stereotypical architects love the "quest for the perfect model", having the ultimate utopian belief that something does exists which will fit all. 

He should pay attention to what the developers need, not the other way around, so choices are based on a need, which brings us to the next part:


## 6. Only when it hurts.
![Hurt - Johnny Cash is an epic cover IMO](https://i.snag.gy/kYu3Z.jpg)

Given some reasonable software development skills, one should avoid premature optimization as long as possible. Usually all this kind of optimization
comes at a cost, which might not be necessary at all...

I have seen way to many start-ups working on a piece of software for over a year without having a single customer; in fact, I am a well established member
of that club, so believe me when I refer to this quote:

> "Do the simplest thing that could possibly work" - Ward Cunningham

Why are you messing around with event buses and scalable platforms when you have not verified a single customer yet? You are basically 
[yak-shaving](https://sethgodin.typepad.com/seths_blog/2005/03/dont_shave_that.html) and saying
"Wow, look at the great architecture I can build". The resulting $$ on the bank account while doing that is exactly zero!


## 7. Five simple rules
![6 would be to hard to remember](https://i.snag.gy/wYIRC.jpg)

Respect the basic practices of software development, and teach your developers about them. I wrote some down [here](/posts/the-5-simple-rules-of-software-development//), but there is a plethora of resources available on the net.

> Make sure you and developers understand proper development practices and use them.


## 8. Grow organically
![Wifey, Housey, Tree, Kids etc](https://i.snag.gy/ayxfi.jpg)

Eric Evans had it right a decade ago: writing software is about exploring your problem domain; in fact, software might even be considered a by-product, as is
your software-architecture. Allow your systems to grow and evolve in a deeper understanding of your problem and solution domain. 

> Software is never done, but always a work in progress.

Adapt and adjust. Understand the cost and risk of growing and adjusting; make it very explicit.


## 9. And you will get to the finish
![Finally! Did you manage to read all of this stuff?](https://i.snag.gy/e5r6t.jpg)

Software architects unite! You no longer need to be the awkward-to-talk to techie in the room, but you should be a leader (not a manager) for your developers.
But - this is very important - your leadership style should be humbling, not top-down, what people in economics refer to as [level-5 leadership](https://en.wikipedia.org/wiki/Good_to_Great).

In today's ever changing world of knowledge everywhere it is no longer important what you know, but what you do with that knowledge, and most of all:

> "Efficiency is doing things right; effectiveness is doing the right things." - Peter F. Drucker


