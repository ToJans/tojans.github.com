---
layout: post
date: "2013-11-30"
slug: "enjoying-programmer-anarchy-happypancake-2"
title: "Enjoying programmer anarchy: HappyPancake - Remoting"
comments: true
categories: 
---

Note: This is the second post in a series of posts about my experiences working for [HappyPancake](http://www.happypancake.com/):
 
- [Introduction & Swedish culture.](http://tojans.me/blog/2013/11/30/enjoying-programmer-anarchy-happypancake)
- [Working remote.](http://tojans.me/blog/2013/11/30/enjoying-programmer-anarchy-happypancake-2)
- ~~Programmer anarchy.~~
- ~~The bit with Rinat.~~
- ~~The dev stack.~~
- ~~The infrastructure part.~~
- [Enjoyed programmer anarchy - looking for the next project](http://tojans.me/blog/2014/01/13/enjoyed-programmer-anarchy-looking-for-the-next-project/)

## Working remote: a small quest

Tomas and HappyPancake are located in Sweden, and I live in Belgium, so there is some remoting involved. 

Because we are working remote, quintessential communication is *very* important. It took us a while to figure out how we could do everything we wanted to do, but I think we currently pretty much nailed it... Here is an overview:

## Email, documents and video conferences: Google and dropbox

No big surprises here; google offers a very polished and well-integrated platform at a very affordable cost, and we combine that with dropbox every once in a while, because we both have dropbox. We are not really anal about it, just pragmatic.

In the beginning we used GTalk a lot, but as now someone else is joining in (more about that later), we needed a new way to communicate....

## Our virtual office: Campfire + hubot + shovel

After some time with GTalk and google Hangouts, we decided to have most communication over [Campfire](https://www.campfirenow.com/).

![It's like your own private mirc](http://i.snag.gy/tuO3Z.jpg)

This was for several reasons:

- We have a fully searchable history of our conversations.
- The team member that will join us on Monday lives in a different time-zone; there is a difference of 5 hours here. This will allow him to chime in and make sure that we all understand each other.

> Chat bots!!

- [Hubot](http://hubot.github.com/) has some nice features, like `/remind me in [timespan] to [subject]` or `/translate me [phrase]`, or `youtube me [some piece of music I'd like to listen to]` (although I do that in the sandbox room, not the R&D room).
- Yesterday we started using [shovel](https://github.com/seomoz/shovel) for devops, so we can deploy by typing
`shovel deploy hpc_web to devserver`, and it reports to us back in the chat room, so everyone can see what we are doing. Shovel has both a campfire, a command line and a webservice interface, so we can invoke our devops scripts in multiple ways...

## Cooperative brainstorming and analysis: Mindmup

This was somewhat of a challenge; we needed to find a way that we could organize and visualize our thoughts, and we tried several real-time collaborative platforms for that. We even tried using a tablet for that, on-screen drawing etc, but in the end, the thing that works pretty smooth is a tool called [mindmup](http://www.mindmup.com/), which allows you to cooperatively work on a hierarchically organised notes, and I have to say it works perfect! We combine that with google hangouts, and we end up with an experience comparable to seeing each other in real life.

We also used an approach comparable to event storming, but ending up with use cases to model the domain, but more on that in another post!

## Conclusion

Turns out that remoting is pretty workable if you understand the constraints you are working with, and not fight them but embrace them. Communication on a chat room might be a bit slower and more cumbersome, but the advantages far outweigh the disadvantages.


