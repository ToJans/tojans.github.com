+++
Categories = ["Development", "Tesla"]
Description = ""
date = "2015-11-23T15:25:03+01:00"
slug = "tesla"
title = "Brain dump: How I'd implement Tesla's Autopilot feature"

+++

I recently saw this tweet by Elon Musk, who is looking for developers for their Autopilot feature:

<blockquote class="twitter-tweet" lang="nl"><p lang="en" dir="ltr">We are looking for hardcore software engineers. No prior experience with cars required. Please include code sample or link to your work.</p>&mdash; Elon Musk (@elonmusk) <a href="https://twitter.com/elonmusk/status/667517215390863360">20 november 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

As a long time Tesla fan, I couldn't help but wonder what kind of solution they will come up with, so I decided to do a little brain dump myself:

# Requirements

## Trustable

Above all, software should be trustable. False positives are preferred over false negatives, as I wouldn't want to accidentally hit into another driver in
case of doubt.

## Reliable

But, somewhat opposed to "trustable", the software also needs to be reliable. If a car starts exposing unexpected behavior - by having to many false positives and braking all the time, for example -, people will stop using it.

## Fast

When you are driving at higher speeds, every millisecond counts, so software would need to be extremely fast, and probably highly parallelized.

## Continuously (self-)improving

People learn from their mistakes. Humans can learn from other humans at the rate of speaking or writing. Cars can learn from other cars at networking speeds. It would be silly not to use this as an advantage.

## Context-aware

We listen to the radio, and look around while driving, listen to other cars etcetera. So cars would probably need to have the same kind of awareness.

## Flexible

Cars will be in a lot of different environments, which might require different kind of Autopilots in different circumstances.

## Fully-automated, semi-automated and manual modes

Whenever an Autopilot is in doubt, he should anticipate and allow the driver to decide.

# Implementation

Based on the requirements, I would opt for the following architecture:

## Context determination

A layer to figure out the current context the car is in: where am I, where am I going, how's traffic, who's around me etcetera...

This would probably include the following layers:

- A primitive HAL that includes some basic rules, f.e. when you detect an object less than a meter in front of you, never accelerate more than the object in front of you.
- A computer vision and identification layer that interprets the objects in the environment. This could be based on a combo of neural networks and sensible heuristics. You'd want an outcome that says: on the right you have 2 trucks driving 30km/h slower than you, and one wants to pass the other one.
- A centralized layer that processes global traffic info, webcams, whatever is available to determine more context for the car, and sends info relevant to the car on regular intervals.

## Command determination

Once you know where you're at and what your goal is, you can figure out what to do next. There would be several systems working in parallel, and than one "master system" that decides which outputs to use, and whether to defer them to the driver or perform the commands automatically.

  - A hard-coded rule engine where every rule is based on the input of a few sensors, and only has simple output as well, f.e. accel (m²/s) and/or turn (degrees). The main motivation behind this engine would be comparable to "Conway's game of life", where simple rules can enable complex behavior.
  - One or more deep learning networks that takes into account the environment, location, weather, ... These would be based on the stats that are collected from cars all over the world.
  - A decision layer built on top of all the previous layers, that evaluates the situation and figures out what to do next:
    - no change.
    - change required.
      - no driver approval necessary.
      - driver approval preferred.
      - driver approval required.

## Providing feedback

While the Autopilot might only have a few potential outcomes, I do think it is important to visualize the whole process.

  - visualize what the car is thinking, so drivers can anticipate and understand the car's reactions.
  - Allows the car to do some things for himself, based on some heuristics that determine the safety of the current situation.
  - Alerts the driver in case of emergency.
  - Might also show some hints on more than just the current driving situation:
    - A better route to take.
    - How to be more energy efficient.
    - Suggesting to visit an old friend living in the neighbourhood when an appointment in your calendar got cancelled.
    - Reminder to call your wife to wish her a happy wedding anniversary.
    - ...

# Conclusion

Well, that's it. That's how I'd probably get started on my first version of the Autopilot. Of course, once you start implementing a system with this amount of inherent complexity, you will discover a lot of unknown unknowns, so I could easily imagine that extra layers and system might be added and removed as the system evolves.

Please not that this is a 60-minute brain dump, so don't take this to seriously. Anyway, Mr. Musk, if you'd like to know more: have your people call my people, maybe we can talk ;).
