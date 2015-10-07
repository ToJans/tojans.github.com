---
layout: post
date: "2013-11-24"
slug: "ddd-101-tips"
title: "DDD 101 tips"
comments: true
categories: ["Development", "DDD"]
---

Here are my tips for getting started with DDD; they were written as [a response to a question in the BE-DDD newsgroup](https://groups.google.com/d/msg/be-ddd/uI5t9BsvWjc/mKjbDybf62cJ):

IMO taking a look at the domains from a different POV also helps; f.e. now you only looked from a data-oriented POV; here are some possibilities:

- Find the use cases that define the behavior of your system
- Use personas and documents
- Try context mapping; you will probably have f.e. at least some distinct BC's IMO: one for registering hours and one for billing, another might be contact management. Not all BC's will benefit from a full DDD stack, some might benefit from using a CRUD-like approach (f.e. contact management might benefit from it). I prefer to have lots of very small BC's, others prefer bigger ones... Advantages & disadvantages of this approach are listed in the DDD book; read up on them and understand them.
- To add to the last one: avoid shared kernels in the beginning...
- Try to read up on value objects; a lot of initial DDD'ers tend to get this wrong
- Speak and reason about your app in as much different ways as possible: try to look at it from different POV, it does not matter if this is ERD/UML/flowchart/ui-prototype/chat with someone who does not know IT at all but does know invoicing (if you don't have another person, at least try to "rubber duck"); particularly notice the language...
- Be very picky about naming; if you group some responsibilities and do not have a name to match these perfectly, prefer to name them "Mumbo Jumbo", "Chuck Norris" or whatever non-relevant domain that might suit you (even porn-star-names might work ;) ). Decoupling the name from the implementation helps you to properly group responsibilities. If you do not do that, you usually end up putting behavior somewhere just because the name matches, not because the behavior actually belongs there... This provides me one of my biggest gains in context mapping and domain modelling: when a model does not "feel right", I replace the names with something bogus and map use cases/events/data/whatever to these bogus names. Afterwards I try to find a better name. If you name things in front, you restrict yourself to whatever might fit in there...
- From the BC POV: try to determine how the system will work; which BC's depend on each other; if a BC crashes, will the system still work/be usable or not. This is not only about up- and downstream but allows you to get a really solid understanding of how your system should function, where responsibilities should be etc.... Investing a lot of time in this before will save you lots of time afterwards. It's all about finding a simple solution, not an easy one, and as with all good things, that doesn't come cheap.
- Try to avoid a phase where you are "building an infrastructure", especially using buses etc, but focus on the way the system is composed. While message buses might seem like the silver bullet regarding decoupling dependencies etc, they are just moving coupling to another part of the system. I'd even say (but I'm really extreme on that part) that, unless you require a distributed system, you should avoid buses at all cost. (And yes, I am aware that about 5 year ago I was suggesting exactly the opposite.) If you figure out proper dependencies/responsibilities, a simple call to another DLL might work just as well.
- Always be learning; IMO DDD is about finding a model that currently matches your understanding of the domain; your system should be something living, especially in the beginning.

Most of all, have fun, and allow yourself to fail (fail early & often is my motto), but learn from it.
