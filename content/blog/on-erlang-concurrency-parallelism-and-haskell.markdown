---
layout: post
date: "2013-09-05"
slug: "on-erlang-concurrency-parallelism-and-haskell"
title: "On Erlang, concurrency, parallelism and Haskell"
comments: true
categories: 
---

## Disclaimer

Please note that I have zero experience in Haskell, so these statements are all assumptions based on an afternoon of study. I will probably prove myself wrong pretty soon.

#Intro

This is a series of tweets that I consider interesting for future reference, so I decided to put them in a blog post:

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/ToJans">@ToJans</a> <a href="https://twitter.com/ptomasroos">@ptomasroos</a> And the 140-character summary is..?</p>&mdash; Graeme Foster (@GraemeF) <a href="https://twitter.com/GraemeF/statuses/375637193295155200">September 5, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## Answer

_Remark_: I initially included the original tweets, but this was unreadable, so I now just show the lines; they are clickable to get the original tweet:

- [Haskell sparks share state and are cheaper and more fine-grained then erlang processes who share nothing.](https://twitter.com/ToJans/statuses/375638609589571584)
- [Strong typing in Haskell allows the compiler to parallelize code, while Erlang is concurrent &amp; soft-realtime.](https://twitter.com/ToJans/statuses/375638959247724544)
- [In Erlang, a process is &quot;an atom&quot;, while in Haskell, a function call is...](https://twitter.com/ToJans/statuses/375639252219858944")

Clarification: by "Atom", I mean the smallest possible part that can be split on a single thread; in Erlang these are processes, in Haskell these are sparks (i.e. function calls.)

- [So if you talk about a few processors, Erlang will be fast, but if you talk about 100s of processors, Haskell wins!](https://twitter.com/ToJans/statuses/375640209997586432)
- [OTOH Erlang has OTP with a huge amount of manyears in it, while the thing in Haskell is nowhere near as mature.](https://twitter.com/ToJans/statuses/375640632720502785)
- [The guess is that Erlang will win on the short term, but Haskell might actually win as proc count rises ^ in the future](https://twitter.com/ToJans/statuses/375640882659086338)
- [Erlang allows concurrency, but not parallelism on the function call level, only on the process level](https://twitter.com/ToJans/statuses/375641060073938945)
- [While this makes no difference with the current amount of cores, it might make a big difference with &gt; n^2 cores!](https://twitter.com/ToJans/statuses/375641278194520065)
- [So Erlang allows you to run programs concurrently, but currently only Haskell can give you true parallelism](https://twitter.com/ToJans/statuses/375641498001227776)
- [The idea is retrofitting a type system - that probably would be required for implementing parallelism - is too hard.](https://twitter.com/ToJans/statuses/375641758052274176)

# Summary

In Erlang, the smallest parallelizable unit is a process, while in Haskell, a function call (aka spark) can be, because function calls can share immutable state over several processes, so it has the best of both worlds.

A big plus on the Erlang side of things however, is the "Let it crash approach", and while the probability for bugs might be way lower due the type system, a bug might still occur, and that is actually one of the strengths of the Erlang/OTP system: it requires no defensive programming at all.

<blockquote class="twitter-tweet"><p>First consideration when writing an app: &quot;How do I want this to crash?&quot; - <a href="https://twitter.com/duomark">@duomark</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/375526616220172288">September 5, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

The educated guess is that, as the numbers of processors goes up, the requirement for having a language that offers true parallelism (like Haskell) might actually win...

So we still think that at this moment Erlang is the best choice, but in the future our bets would be on Haskell or similar tools.

# Update

Looks like I have some more reading to do:

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/ToJans">@ToJans</a> <a href="https://twitter.com/ErlangInfo">@ErlangInfo</a> <a href="https://twitter.com/GraemeF">@GraemeF</a> <a href="https://twitter.com/ptomasroos">@ptomasroos</a> Haskell has so much more than sparks. Check out <a href="http://t.co/6cyqsLK7tb">http://t.co/6cyqsLK7tb</a></p>&mdash; Bob Ippolito (@etrepum) <a href="https://twitter.com/etrepum/statuses/375745710425407488">September 5, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
