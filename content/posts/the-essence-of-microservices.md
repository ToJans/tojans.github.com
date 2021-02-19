---
layout: post
date: "2014-08-28"
slug: "the-essence-of-microservices"
title: "The essence of microservices"
comments: true
categories: 
---
During the DDDQ lean coffee last weekend the question on [microservices](https://martinfowler.com/articles/microservices.html) popped up once again.

This is [not my first post about this subject](/posts/micro-service-architecture-versus-soa-eda//), 
but apparently [people wanted to know more](https://twitter.com/ToJans/status/504718485403222016).

# Whyyyy !?! Whyyyyy!

![Whyyy](https://a0.1nsk.ru/3/a32b30b66d.png)

From my understanding ** you should only use microservices when you want to run small controlled business experiments**.

That is in fact the key takeaway for me: [if you write software for an agile business](https://www.youtube.com/watch?v=2rKEveL55TY), 
you might want to try something new everyday, for example:

- setting up an online crossword puzzle contest
- organizing an ad hoc platform for a certain event
- engage new customers in a poll
- write a service that emails you a list of potential customers every day
- ... (You get the picture)

> When you do microservices, you apply agile principles to your business.
>
> You (temporarily) extend your software functionality to run small controlled business experiments.

If you would like to know more about "small controlled experiments", I would suggest you to read [Mathias' post](https://verraes.net/2014/03/small-controlled-experiments/). 
He applies these principles to agile software development, but you can also apply these principles to doing business.

# What

A lot of people seem to think that using microservices is an excuse for not properly designing your system. 

> People use the term micro-service architecture as an excuse to develop an SOA "big ball of mud".

The biggest risk using this approach, is that most of the knowledge about how the system works is implicit. When people leave, the knowledge is gone.

# When

Quite simple: as most businesses have a steady core, I would suggest you to properly develop and design the core of your system using the more conventional approaches. 
Then , you figure out a way to do micro-services on the side, to run small controlled experiments:

- Message busses
- Scripting
- Plugins
- ...

# Conclusion

Most businesses are not fully agile, so I would advise against using microservices for non-agile parts. 

Figure out which part of your business is
agile, and which is not, and find a way to run small controlled business experiments.

<blockquote class="twitter-tweet" lang="nl"><p><a href="https://twitter.com/hashtag/microservices?src=hash">#microservices</a> <a href="https://t.co/T7XOjcUE73">pic.twitter.com/T7XOjcUE73</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/448360079159328768">25 maart 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
