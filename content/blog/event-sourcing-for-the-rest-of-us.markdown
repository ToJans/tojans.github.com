---
layout: post
date: "2013-07-28"
slug: "event-sourcing-for-the-rest-of-us"
title: "Event sourcing for the rest of us"
comments: true
categories: 
---

I recently saw a discussion on twitter about the [definition](http://martinfowler.com/eaaDev/EventSourcing.html)
 of event sourcing:

<blockquote class="twitter-tweet"><p>Event sourcing: persisting entities by appending all state transitions to transaction log. To rebuild the state, we replay this log.</p>&mdash; Rinat Abdullin (@abdullin) <a href="https://twitter.com/abdullin/statuses/361079569933012992">July 27, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/thinkb4coding">@thinkb4coding</a> which problems in this paper stand out to you?</p>&mdash; Rinat Abdullin (@abdullin) <a href="https://twitter.com/abdullin/statuses/361108972478005250">July 27, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

After a response by [Jérémy](http://twitter.com/thinkb4coding) in 
[a blog post](http://thinkbeforecoding.com/post/2013/07/28/Event-Sourcing-vs-Command-Sourcing), 
I decided to offer you my interpretation of event sourcing as well. If my interpretation is not optimal, 
or simply wrong, feel free to tell me.

## Event sourcing explained in a tweet

This was my initial response to [Rinat](http://twitter.com/abdullin):

<blockquote class="twitter-tweet"><p>An event is a semantic log entry of a state transition.&#10;Event sourcing rebuilds state by applying historic events. &#10;/cc <a href="https://twitter.com/abdullin">@abdullin</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/361429914580291586">July 28, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Let me walk you through it briefly:

## An event is a semantic log entry of a state transition.

First we need to define what a semantic or event log is.
I assume everyone knows what a state transition and a log entry is, so I will focus on a single 
word here: semantic.

> TL;DR: A transaction log logs the application implementation's state transitions, while a semantic/event log logs the problem's state transitions in a way it is understandable by non-developers (expressed in a language that people refer to as the [ubiquitous language](http://martinfowler.com/bliki/UbiquitousLanguage.html)).

A transaction log contains things like `update table abc set x=3,y=y+4 where z=123`. A developer might understand what this is about, and even a business user might know what it means, but _the intent of this log entry is implicit_ because it can only be derived from the implementation.

The intent might have been a status that was changed, an amount that was set, or even a new business rule  that has been enabled. Without knowing the details of the implementation, there is no way to figure out what this log entry actually means.

A semantic/event log entry looks slightly different; _it makes the intent explicit_ by expressing it in the ubiquitous language, f.e. `Business rule 3 was enabled for product 123 with a weight of 4`, or in JSON:
<!-- more -->
```
{
    "Business rule enabled":
    {
        product_id: 123,
        rule: 
        {   
            rule_id:3,
            weight:4
        }
    }
}
```

> Note that events are _always in the past tense_, i.e. events are a log entry of state transitions/something that has happened. As such a handler executing an event should not contain any problem logic at all, the only thing the handler should do is persist the state.

As you can imagine, having a semantic/event log makes a world of difference, as it is very explicit; there is no need to figure out the intent of the transitions as opposed to the transaction log.

>Note: in simple applications deriving intent from the transaction log is usually easy, but once the implementation gets more complicated, it will usually be quite hard - sometimes even impossible - to derive the intent of a log entry from the transaction log.

## Event sourcing rebuilds state by applying historic events.

What is event sourcing? Recreating state by starting with the initial state and applying past events to it.

How do you do this? Quite simple: for every single event that happened in the past, you feed it in to the state, you have some kind of a handler that translates this event log entry into a state change.

This also implies that you can not change state directly in your application, but you have to do it by emitting an event.

Let me explain it with a simple example in [Elixir](http://elixir-lang.org); I will show you the non-event-sourced code first:

```
   def EnableBusinessRule(product_id,{rule_id,weight}) do
     Guard.that rule_exists(rule_id) and product_exists(product_id) 
     if weight <0 do weight=0
     sql.execute_non_query('update table abc set x=&2,y=y+&3 where z=&1',[product_id,rule_id,weight]);
   end
```

Now let me show you the event-sourced example.

```
   def EnableBusinessRule(product_id,rule_id,weight) do
     Guard.that rule_exists(rule_id) and product_exists(product_id) 
     if weight <0 do weight=0
     :store <- {:'Business rule enabled',[product_id:product_id,[rule_id:rule_id,weight:weight]]}
   end
   
   def handle(:'Business rule enabled',[product_id:product_id,[rule_id:rule_id,weight:weight]]) do
     sql.execute_non_query('update table abc set x=&2,y=y+&3 where z=&1',[product_id,rule_id,weight]);
   end
```

`:store <- {msg}` will call the relevant `handle` method, and might actually store the event in an event log. After replaying all historic events using these handlers, the state will be up to date.

## Events have lots of advantages

There are a lot of advantages to using events, but as this might make this blog post to long, I will only mention a few:

- Tests/specs understandable by non-developers: `Given [some events] when [doing something] Then [some resulting events]`.
- Implementation can be changed without having to migrate data: as long as the intent of your event does not change (in that case you will probably need another type of event anyway), you can swap out implementations at will, as you still have your tests/specs to confirm behavior.
- Logs are understandable by non-developers, and can be used to track bugs/problems.
- Using messaging allows things to be distributed/persisted/postponed/....
- ... lots more ...

I hope this post helps to clarify some issues about event sourcing.
