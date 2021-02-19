---
layout: post
date: "2013-12-16"
slug: "the-extrema-of-system-integration"
title: "The extrema of system integration"
comments: true
categories: 
---
There seems to be a lot of confusion on this subject, so I decided to give my very opinionated view on the subject.

There are 2 extrema in how to handle integration between different systems:

## Implicit integration: Fred George's micro-service architecture

The concept of [micro-service architecture](https://vimeo.com/79866979) is ["Antifragile"](https://www.amazon.com/Antifragile-Things-That-Gain-Disorder/dp/1400067820) applied to software architecture: have lots of versions of very tiny micro-services running, without precisely knowing which service does what. 

This comes down to an approach where you publish all messages to a single enterprise bus, and then several children act as proxies for this message bus.

You don't care about how all these services work, but monitor the state of the system. If a problem occurs, you can usually just write a new service that solves the issue. This implies that you might have services running that no longer provide actual value, and comes down to this single fact:

> You don't care how the system works, as long as it works!

As you can imagine this relies mostly on investing in your monitoring.

The advantage is that integrating new things, replacing services and services that fail are non-events, as you have these happening all the time, but the disadvantage is that you don't have an explicit map about how the system works, you just need to look everywhere and browse around a lot.

## Explicit integration: Alistair Cockburn's Hexagonal pattern + explicit interfacing

On the other side of the spectrum, you can do [hexagonal architecture](https://alistair.cockburn.us/Hexagonal+architecture) with very explicit integration handling. Both incoming and outgoing things go through explicit interfaces using adapters and ports. This is like CQS - or even CQRS - applied to system integration.

Whenever one would cross an AR instance boundary, one might do this through a plethora of interfaces:

- `SharedKernel.IPublish[SomeBC]Events`
- `SharedKernel.IConsume[SomeBC]Events`
- `SharedKernel.IQuery[SomeBC]State`
- `[SomeBC].IQuery[SomeAR]State`
- `[SomeBC].IPublishEvents`
- `[SomeBC].IConsumeEvents`
 
This is typically an explicit interface or a protocol, and your domain model should access these directly.

If you opt for the extreme side of this explicit approach, this would imply that you do not have any untyped contracts at all (So no method exposing things like message buses etc., every single method exposed by this interface would expose exactly one single type of message/functionality, so no `publish(object message)`, but a `publish(SomeCertainMessageType a)`.)

Advantages are the transparency of the system (as everything is explicit in code), but the disadvantage is that this does add some overhead.

## Conclusion

So there you have it: the two extrema of software integration. Both have their advantages and disadvantages. The thing I would like to mention the most, is that one should never forget about [Conway's law](https://en.wikipedia.org/wiki/Conway's_law), i.e. system models will mimic the organisation's model they were built with.

Take a look at the organisation culture you have, and base your architecture decision on that.

Other than that, be pragmatic. Executing multiple AR updates in a single UOW might not be a problem, if you are aware about it. It's all about [easy vs simplicity](/posts/continuous-thinking-essay-ease-and-simplicity-in-software-architecture//) in the end.

> Technical debt only becomes debt when "the loan" is claimed. If you have an ugly hack, but it works, and you'll never have to change it, so be it. However, one can always come in to claim the loan (one or multiple times), you need to be aware of that. In the end it is all about risk management.

This whole story actually shows a lot of similarities to the extrema of management IRL: output-driven management vs. micro-management.
