---
layout: post
date: "2014-02-26"
slug: "cqrs-and-functional-programming"
title: "CQRS and functional programming"
comments: true
categories: ["Development", "DDD"]
---
So, a little while ago, while I was studying Haskell, I decided to implement [Greg Young](https://twitter.com/gregyoung)'s
[SimpleCQRS example](https://github.com/gregoryyoung/m-r/tree/master/SimpleCQRS) in [Haskell](http://www.haskell.org/).

During the [last @DDDBE event](http://www.eventbrite.com/e/dddbe-5-ddd-basics-registration-9912037170), I was showing this to
[Mathias](https://twitter.com/mathiasverraes), and he decided to put it on the big screen.

The general response was:

> What's missing from Greg's example?

And my reply was that nothing was missing. As people seemed to be flabbergasted by this code, I decided to convert it into a blog post.

This is the code:

<script src="https://gist.github.com/ToJans/8219629.js"></script>

A little background for the people who don't know Haskell:

- The `data` statements define all the required commands, events and state; a pipe symbol for the data type means A `or` B
- `handle :: [Event] -> Command -> [Event]` implies that it is a function named `handle` that takes as parameters an array of events and a command,
and it returns an array of Events.
- `handle` first creates an `item` by assigning `apply events` to it, then it passes it into a function named `handle'`, which uses pattern matching
to figure out which `handle'` to invoke
- `item` (i.e. the state) is either `Nothing` or `Just Item`.
- `apply` events starts out with `Nothing` as the state, and then calls `apply'` for every event in the events, resulting in the modified state upon
applying every event.

I didn't consider this such a big thing, except for the terseness and the **very low** signal to noise ratio in the code, but as people seemed to like it
I decided to put this in a blog post for your enjoyment.

Have fun!
