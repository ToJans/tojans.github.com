---
layout: post
date: "2014-02-17"
slug: "why-bad-software-architecture-is-easy-to-monetize"
title: "Why bad software architecture is easy to monetize"
comments: true
categories: 
---

This morning I received yet another "interesting" job offer, which looked like this:

<blockquote class="twitter-tweet" lang="nl"><p>Wanted: &quot;senior .Net architect&quot;&#10;Description &quot;build one framework to build all future projects, using sharepoint&quot;&#10;<a href="https://twitter.com/search?q=%23ThanksButNoThanks&amp;src=hash">#ThanksButNoThanks</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/435299811324329984">17 februari 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Building a single framework to rule all your customers is just plain wrong. I did it in the past and now I know better.

Why do a lot of consultancy/web shops do it then?

# Let me tell you a story

... About someone building a house...

<iframe src="http://www.flickr.com/photos/30515687@N05/3856245334/in/photolist-6SLgow-6SLh31-6SLky7-6SLkFY-6SLn3P-6SLwFu-6SLwQs-6SLwUh-6SLxgX-6SLxvr-6SLxHV-6SLxU2-6SLyek-6SLynr-6SLzTJ-6SLAxu-6SM5TF-6SNr5d-6SNrtE-6SNrTq-6SNs3q-6SQbeb-6SQnXb-6SQoM7-6SQoY3-6SQA3b-6SQAwu-6SQATN-6SR5Tb-6WV5nB-6XgBwC-77u21V-77ubax-77xVYf-77xWsf-7u7UbR-7uX58a-7vbncH-7vbnvp-7vfafJ-7vfbdf-7vfbGm-7vtzxr-7vxowm-cAxjX5-8ny56k-dnhF9J-8VkCiB-bzvYAQ-e2GgF7-e2Aw34/player/" width="500" height="403" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>

## The project

You would like to build a house. The only guidelines you give, is that it needs to be a 2 story building, the ground floor needs to be a pub, and a total square footage needs to be about 4.000 foot squared.

## The tender

Some contractors give you a price of about 200.000 USD, while about 80% of them give you a price of about 50.000 USD. You verify whether the lower offers match all the specifications you provided - which they do -, and you pick the contractor that has about the average price of the 50.000 USD contractors.

## The build

They start building it, and after 2 weeks, the whole project is finished. You are flabbergasted and amazed that they managed to do it in such a small amount of time.

## The delivery

Then you get inside, and then you notice the walls are built out of multiplex, there is no insulation; the windows are made out of plexi glass, and there is no running water or electricity provided. However, the house still matches the contract's specifications, so you can't do anything about it legally.

## The fix

However, there is a solution: the contractor offers you to install running water and electricity, so you can get at least some tenants, and start monetizing your investment. This will set you back 100.000 USD. While this is a lot of money, your total investment is still lower then the initial amount asked by the more expensive contractors, so you accept the deal.

They get cracking, and after a few weeks the building is finished. You get some tenants, and the money starts flowing in.... End of story...

## A few months later

It is now winter. Your tenants start complaining about lack of insulation, and threaten to report you to a non-profit that guards the tenants' rights. So you go back to the contractor, and ask him how much it costs to apply insulation. You decide to accept the extra cost of 50.000 USD, which implies you now have paid the initial 200.000 USD, and had a lot of extra overhead with it.

## Not finished yet

Having found a way to achieve what he wants, the tenant now figured out that your plexi glass windows are not compliant with national standards. 
Disappointed, you go back to the contractor, and he tells you he can add proper windows for another 30.000 USD. You realize there is no other alternative, so you decide to do it...

## Finally resolved? Or not?

After applying proper windowing, you think you finally nailed it... But a few months later, the tenants are noticing cracks in the supporting beams. Apparently the foundation of the house was not built for all this extra weight, and you need to spend a whopping 100.000 USD to fix it...

# Conclusion

Building software works in a similar way. A lot of software shops will promise you heaven, and they might deliver something that looks like heaven, but in the long run it will **always** cost you money. 

In housing, usually stories like these are not possible, because there is a minimal - legal or other - standard that housing needs to comply to.

However, in software there is no such thing. Writing software software to handle your core domain (i.e. the thing that makes you different from your competitors) is never finished, because you need to change in order to stay ahead of the competition. 

If you opt for the cheap, short term solution, it will cost you a lot more money in the long run.

## It happens a lot

I have seen the growth of way too many organisations slowing down, and actually even stalling and shrinking again, just because they opted for the wrong contractor (i.e. software) in the beginning.

Software architecture can not be fixed, it needs to be tailored to your specific requirements, because writing software is a creative process with a lot of unknowns, which will grow exponentially in costs if you do not manage them properly.

While building a house might also have a lot of unknowns, the biggest part of houses that are being built are pretty standard; it are usually only the exceptional houses that go multiple times over budget. When writing software for your core domain, your software is custom; if it would not be, this would imply that you are the same as your competitors.

## Some might say: "we can configure this in our framework/application". 

That is in fact even worse, because usually your core domain (what provides your competitive advantage), will now be written in a language that is specific to your vendor's product. This will create an even bigger vendor lock-in.

## Finally

If you want to build software for your core domain, grow the architecture, do not opt for a predefined solution unless you properly understand the implications and you can properly justify your choice.

Tom.

Ps: I am always looking for interesting projects (Legacy, DDD, C#, Erlang, Haskell to name a few), so contact me if you think I can help you out!
