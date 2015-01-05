---
layout: post
date: "2013-08-10"
slug: "reply-to-mathias-blog-post-about-systemantics-the-systems-bible"
title: "reply to Mathias' blog post about Systemantics - The Systems Bible"
comments: true
categories: 
---

# Some context

[@MathiasVerraes](http://twitter.com/mathiasverraes) just published [a short review](http://verraes.net/2013/08/john-gall-systemantics-the-systems-bible/) about a book called ["Systemantics - The Systems Bible" by John Gall](http://www.amazon.com/SYSTEMANTICS-THE-SYSTEMS-BIBLE-ebook/dp/B00AK1BIDM).

One of the quotes he mentioned was the following one:

>Systems are seductive. They promise to do a hard job faster, better, and more easily than you could do it by yourself. But if you set up a System, you are likely to find your time and effort now being consumed in the care and feeding of the System itself. New Problems are created by its very presence. Once set up, it won’t Go Away; it Grows and Encroaches. It begins to do Strange and Wonderful Things and Breaks Down in Ways You Never Thought Possible. It Kicks Back, Gets In The Way and Opposes Its Own Proper Function. Your own perspective becomes distorted by being In The System. You become anxious and Push On It To Make It Work. Eventually you come to believe that the misbegotten product it so grudgingly delivers is What You Really Wanted all the time. At that point, Encroachment has become complete. You have become absorbed. You are now a Systems-person.

# Here is what I learned recently

The whole quote refers to [what Taleb baptized "Anti-fragile"](http://www.amazon.com/Antifragile-Things-That-Gain-Disorder/dp/1400067820/ref=sr_1_1?ie=UTF8&qid=1376114525&sr=8-1&keywords=antifragile):
You begin with a very fragile system (it breaks all the time), so people add rules and fix things with feedback to make it more robust.

The more robust your system gets, the harder it will become to incorporate something that completely ignores expected behavior.

Taleb says that, given enough time and a system that gets more robust as time progresses, an unexpected thing should happen that will break the system.

The problem is that, by the time this ["black swan"](http://en.wikipedia.org/wiki/The_Black_Swan_(2007_book)) occurs, people will have grown so reliable on the system, that the impact of the failure will be huge (Consider the whole story with the [Credit Default Swaps](http://nl.wikipedia.org/wiki/Credit_default_swap#Risico.27s_verbonden_aan_credit_default_swaps) in the banking industries for a recent example.)

> TL;DR: There is no such thing as "Too big to fail"

His solution is building systems that grown stronger upon unexpected behavior, and the only way to build such a system, is by continuously forcing unexpected behavior upon it, causing it to fail. A system that is used to failure, will less likely have stronger survival chances if a "Black swan" would occur.

One very known and understandable example is [the Chaos monkey by NetFlix](http://techblog.netflix.com/2012/07/chaos-monkey-released-into-wild.html), another one could be [genetic algorithms](http://en.wikipedia.org/wiki/Genetic_algorithm). What is typical about these systems, is that they are built out of small, independent units, and when these small parts fail, the whole system knows how to handle this.

# Once again about Erlang/Elixir/the BEAM VM

The BEAM (Erlang/Elixir) VM is exactly built like this; apps are built out of small autonomous processes that just get restarted in case of failure (gross simplification, but you should get the picture).

In an app built for the BEAM VM, you start by defining your supervisor processes (i.e. process who will monitor the system and react accordingly), so this whole philosophy is an essential part of the whole BEAM VM....
