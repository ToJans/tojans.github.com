+++
Categories = ["Development", "Tesla"]
Description = ""
date = "2015-11-24T15:25:03+01:00"
slug = "tesla-2"
title = "Brain dump #2: How I'd implement Tesla's Autopilot feature - levels of AI"
+++

About two weeks ago, I decided to have some healthy life changes, and one of them is walking to my office. This walk takes about half an hour, so it is easy to fit this in my daily schedule.

<blockquote class="twitter-tweet" lang="nl"><p lang="en" dir="ltr">My daily walk to and from the office... <a href="https://t.co/GPi3WGOPKr">pic.twitter.com/GPi3WGOPKr</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/status/668711173433499648">23 november 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

While walking to my office, I think about my goals for the day, and on the way back, I self-reflect and think about the things I did that day.

I do believe this is a good habit, but that is not what this post is about.

# Tesla's Autopilot feature: several levels of AI:

Based on [my previous observations](http://tojans.me/blog/2015/11/23/tesla/) and some thinking on the way back yesterday, I would assume there would be three levels of thinking:

- The instinctive layer
- The short-term layer
- The long-term layer

## The instinctive layer

Human instinct is there for a reason: when a big animal is threatening us, or we bungee-jump from a bridge, our instincts take over, and fighting them is really, really hard. The car should have something similar, based on simple rules.

The most obvious rule that comes to my mind is: keep a minimum distance from the thing in front of you, based on the speed of what you detect in the front of you, coupled with your own speed and estimated braking range. You might have the ability to overrule these, but it should be really a conscious choice (like for example an automatic transmission kickdown).

Other obvious instincts would be turning left and/or right based on detected objects (and having some resistance in the steering wheel while doing something unnatural).

This would also include sensors that detect defects like a flat tire.

## The short-term layer

This is basically the environment you see around you, while you are driving. Things this layer should do:

- optimizes for the drivers demand; you might want to get there:
  - as fast as possible (might require a lot of manual interaction from the driver)
  - as safely as possible (avoid any potential risk, so for example always use the slowest lane)
  - with the least amount of manual interventions (somewhat similar to the safe mode, but it might be more pragmatic than the mode above)
- detects roads, other objects in the neighbourhood with the odds of them moving somewhere in space-time.
  - computer vision would be really important
  - needs to be absolutely rock solid
  - would probably learn by aggregating from all the cars on the world
  - would probably use a complicated model of space-time
- builds experience based on previous driver interceptions, and learns from other drivers too
- probably uses some kind of cost-optimizing solution, where every single action that changes the current situation comes at a cost, so status quo is preferable
- visualizes the current and future situation, together with the plan of what to do next
- will work fast and parallelized, might communicate with nearby cars as well

## The long-term layer

This is everything beyond what you can see:

- analyzes routes based on speed, safety, probability of manual intervention
- takes into account existing traffic
- considers energy usage
- also takes into account the amount of communicating cars it can find on the route; the more it can find, the better it can guesstimate
- might interact with chargers as well
- if every car solves some of the problems, we have a huge cluster of processing power available to solve traffic problems
- communication with other cars will probably have some kind of blockchain verification, so cars can reduce the risk of someone hacking it's way in to the network
- should never interfere with direct driving, so it's better to take the next exit and drive back, than to take big risks and get an exit anyway

# Interesting, but what is the goal of this post?

This is an exercise in software modelling. Please allow me to elaborate:

I am a big fan of Einstein's "[Gedankenexperiment](https://en.wikipedia.org/wiki/Thought_experiment): what would happen if". One of Einstein's most famous ones was:
"what would happen if I would sit on a rocket travelling at the speed of light; would I see the beam it leaves behind or not?"


![Einstein sitting on a rocket](https://scontent-ams3-1.xx.fbcdn.net/hphotos-xfa1/v/t1.0-9/165376_179973225360942_1660294_n.jpg?oh=50e434d107a3afe2d67c3280c4c8fffb&oe=56E5CD03)

I do this a lot in software as well: before I write a single line of code, I explore the possibilities and edges of my model and do little experiments:

- what happens when I leave this piece out
- what happens if one piece always gives faulty results
- what happens if we simplify this
- what happens if ...

The advantage of these experiments is, that the cost is virtually nothing; changing code is a lot harder than changing your thoughts. When you get a new problem, don't start coding right away, but truly learn to understand the problem. Go back and do this exercise on regular bases, and you will see it will help big-time on your software modelling.
