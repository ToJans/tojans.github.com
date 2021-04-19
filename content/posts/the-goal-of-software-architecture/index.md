+++
date = "2021-04-18T10:00:00+02:00"
draft = false
title = "The goal of software architecture"
slug = "the-goal-of-software-architecture"
+++

The goal of software architecture is to build abstract models on top of behavioral models, so your software becomes easier to maintain and/or optimize.

## Why do you need software architects?

If you look at it from a user point-of-view, the most adaptable software architecture is basically a PC with an office suite, custom apps and an internet connection. 

However, from an IT point-of-view, this approach is not very cost-efficient and has some risks implied, especially if the process of the user is intertwined with other users or systems:

1. The cost of changing your process;
2. The risk of discontinued and or wrongly interpreted steps in the process. 

Users tend to understand that cost and risk if they create their own solution using Excel, email and a plethora of other tools.
They even understand it increases exponentially if other people are using their solution, when it has a longer lifecycle, ...

This is where a software architect comes in: a software architect is usually quite good at assuming which dependencies will remain fixed, and worth his/her value if he/she manages to bring the cost and risk down to the point where the decrease in cost of change and risk outweigh the expenses paid to support the software architect.

This also implies that the boundary between senior developers and software architects is a very fluffy line, some might even state there is no distinction.

In my opinion a software (or system/infra/marketplace/enterprise/... - and whatever else is possible) architect is someone who has **a lot** of experience in designing these systems and focuses more on the design than on the actual implementation. He/she identifies the foundations which typically remain over the whole lifecycle of a project. And as everybody knows, choosing the wrong foundations will have a **huge impact** on the rest of the lifecycle.

## What is wrong with a lot of software (and other -) architecture

![Tower of Babel by Breughel](./babel.png)

Over the years, the field has evolved into something that resembles a cargo-cult community, or even a small echo chamber if you will. 

While it is certainly not the norm, I have seen some very high-potential projects going haywire because the software/system architect made the wrong decisions from the start, due to not listening to the client's problems, but going for the "architectural-pattern-of-the-day" flavor instead, because the client asked for it.

As I have done a lot of IT road maps for large organizations during my last consulting gig, I noticed clients themselves are asking us for solutions instead of telling us what their problems are. This typically results in technology-driven road maps, where "approach XYZ" will resolve all the issues. This is not the client's fault, but our fault as ITers.

Let me get one thing clear: a technology or process alone cannot exist in the void, it is always a people thing first. We as IT people seem to be unable to properly declare our intent without introducing terminology like micro-services, blockchain, SAFe, or whatever the latest CxO-hipster trends are. We are now at a point where clients ask organizations to "go to the cloud", "set-up a block-chain" or use "technology ABC" because it is what society expects them to do.

It is unfortunate that in the world we live in today, we tend to be disconnected from the actual problems we are solving, and go directly into the solution space. This is where you might be solving the wrong problem, and are stuck in a local maxima due to the inability of the client to see beyond the horizon of the local maxima.

It is only a hunch, but I think that the mythical "10X engineer" people talk about actually exists, but... Instead of writing 10 times more code/faster implementations/... he manages to multiply the value of the outcome his efforts by 10, by simply looking for the best solution for a problem as opposed to blindly implementing the solution as proposed. It is my firm belief that you can bring the most value if you truly understand why people are asking you to do something.

For the people who are into this kind of thing: this is one of my pet-peeves; here's an almost impromptu lightning talk I gave at DDD Europe in 2020.

<iframe width="560" height="315" src="https://www.youtube.com/embed/UYw7Kzk_gdQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

As far as I am concerned, we need to stop thinking about software architecture in an abstract way, and use more real-world inspiration to model our software. 

## The real-world &trade; ?

All these Babylonian layers of indirection we tend to introduce result in a disconnection from the true purpose of why we are doing things. Systems exist for a purpose, and every component in a system exists for a reason. Sometimes these systems get so complicated the initial goal gets lost, and people start optimizing for the sake of the system.

It is my firm belief that everything on this world is governed by the laws of physics/nature, even IT. To model our systems, we need to take a good deep look at the real world, both at the macro- and micro-level.

In order to prove my point, I'll explain it with a well known, universal concept that most people are familiar with: [the 3 fundamental laws of thermodynamics](https://en.wikipedia.org/wiki/Laws_of_thermodynamics), and I'll explain how these apply to software architecture as well:

### 1/ Conservation of energy

In general, the conservation law states that the total energy of an isolated system is constant; energy can be transformed from one form to another, but can be neither created nor destroyed.

The same goes for software architecture: abstractions always require constraints on the behavior, so you exchange flexibility for maintainability.
Introducing an abstraction implies that you also introduce at least one constraint. These constraints are a liability. You cannot introduce abstractions and think it has no associated cost or risk.

### 2/ The sum of entropies never changes

you cannot remove complexity, only move it somewhere else.

This is why I consider the micro-services movement so ridiculous: instead of separating your system based on non-functional constraints, you group everything into small units. 
Your small units might now be more maintainable, but you ignore the fact that services are part of bigger systems, and the relationship between these systems is usually equally important. With micro-services you usually end up implicit service relationships.

You need to go for a "natural equilibrium" instead, where your design is driven by your needs, not by some "fashion du jour".

> This statement caused a little bit of a stir on twitter, so I would like to elaborate: for some systems there might be an actual need for micro-services, but it needs to be a conscious decision, that also takes in to account the disadvantages of micro-services. Turning your system into micro-services will not magically fix your design, and it introduces the concept of distribution, which is - according to a famous quote - on of the hardest problems in computer science.

### 3/ A system's entropy approaches a constant value as its temperature approaches absolute zero

You can build a perfectly abstracted software architecture with all complexities logically grouped if and only if your requirements are fully frozen. 

Any change increases entropy. If you start from the solution space, you might have missed an import aspect which will result in having the wrong foundations from the start.

## In closing: 2 simple tips

Instead of trying to hide reality, try to embrace it. Here are 2 simple tips:
 - Think about your software architecture as if there were no computers: how would you organize your work if you only had pens, paper, cabinets and a copier?
 - As always, it is a people problem first, so while this post is very nice in theory, in practice you might have to take into account the people you are working with/for might have other drivers, so get to know your stakeholders and figure out what kind of impact they can have on the system, and what kind of impact the system can have on them as well.

TL;DR: thousands of years of evolution resulted in magnificently designed systems; think about what you are doing and how it would be resolved by nature.

Tom.

---

Note: The gist of this post was originally a [series of tweets](https://twitter.com/ToJans/status/1383363888008232967), but I turned it into a blog post to make it more digestible, and added some side notes an elaborated a bit on some aspects that needed clarification.
