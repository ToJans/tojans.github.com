---
layout: post
date: "2013-10-19"
slug: "dddbe-meetup-2-legacy-inferno"
title: "DDDBE meetup #2 - Legacy Inferno"
comments: true
categories: ["Development", "DDD"]
---
![This is probably what it looks just before matter turns into antimatter](https://i.snag.gy/azzFo.jpg)

After [the great feedback of the first event](/posts/the-very-first-dddbe-event-the-modellathon/), the [Belgian DDD community](https://domaindriven.be/) had to do [a second one](https://legacy-inferno.eventbrite.com//), and last Thursday we did:

<blockquote class="twitter-tweet"><p>De <a href="https://twitter.com/DDDBE">@dddbe</a> meeting at <a href="https://twitter.com/nucleus_hosting">@nucleus_hosting</a> begint behoorlijk vol te lopen :) <a href="https://t.co/E70TaIvQNd">pic.twitter.com/E70TaIvQNd</a></p>&mdash; Chris Ramakers (@ChrisRamakers) <a href="https://twitter.com/ChrisRamakers/statuses/390881240577892352">October 17, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

We would like sincerely thank [@nucleus_hosting](https://twitter.com/nucleus_hosting) - [nucleus.be](https://www.nucleus.be/) for providing us a location and some food!

<blockquote class="twitter-tweet"><p>We&#39;d be nowhere without companies like <a href="https://twitter.com/nucleus_hosting">@nucleus_hosting</a> who provide us with a location. Can your company help us for the next meetup?</p>&mdash; DDD Belgium (@DDDBE) <a href="https://twitter.com/DDDBE/statuses/391133983896915968">October 18, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

If you happen to have a venue and you are willing to host a DDDBE event, please [do let us know](https://domaindriven.be/)!

# Part 1: Turns out writing advanced Excel is a lot like writing software

The subject of the first part of this meeting was simple: legacy all over the place, even in places where you do not expect it to be: Excel files!!
One might wonder what this had to do with DDD, and well, apparently some Excel files are not that different from software programs.
<!-- more -->
I could try explaining this, but I would assume that our presenter [@Felienne](https://twitter.com/Felienne)'s slides explain it way better, so here we go:

<iframe src="https://www.slideshare.net/slideshow/embed_code/17674149" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/Felienne/an-overview-of-my-phd-research" title="An overview of my PhD research" target="_blank">An overview of my PhD research</a> </strong> from <strong><a href="https://www.slideshare.net/Felienne" target="_blank">Felienne Hermans</a></strong> </div>

## TL;DR

Turns out a lot of companies are using Excel as a tool to write software, and it is one of biggest sources of hidden legacy in the enterprise.
She even told us about a horror story where Excel files were actually used to monitor and manage a system that handled the distribution of gasses like argon...
And apparently that is just the tip of the iceberg, and there are a lot more of these stories to be found over at [eusprig.org](https://eusprig.org/horror-stories.htm).

## Feedback

Felienne is a very animated and entertaining presenter, with an interesting subject; here are a few impressions to give you an idea:

<blockquote class="twitter-tweet"><p>Very entertaining talk by <a href="https://twitter.com/Felienne">@Felienne</a> on spreadsheet refactoring. Horror stories FTW! :-) <a href="https://twitter.com/search?q=%23dddbe&amp;src=hash">#dddbe</a> <a href="https://t.co/odAr511QBa">pic.twitter.com/odAr511QBa</a></p>&mdash; m@ttias.be (@mattiasgeniar) <a href="https://twitter.com/mattiasgeniar/statuses/390890984974090240">October 17, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>Spreadsheets exist under the radar in enterprises. Nobody knows where they are, how many, what the critical ones do.</p>&mdash; DDD Belgium (@DDDBE) <a href="https://twitter.com/DDDBE/statuses/390889614367813632">October 17, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>A machine to fill gas tanks, being run by one giant excel file? Yep.</p>&mdash; DDD Belgium (@DDDBE) <a href="https://twitter.com/DDDBE/statuses/390888528957411328">October 17, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet"><p>Funny talk by <a href="https://twitter.com/Felienne">@Felienne</a> on spreadsheets &amp; software at <a href="https://twitter.com/search?q=%23DDDBE&amp;src=hash">#DDDBE</a></p>&mdash; Stijn Volders (@ONE75) <a href="https://twitter.com/ONE75/statuses/390892754685149184">October 17, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## Why do people even use Excel for this? My personal opinion.

I would think that, when you ask people what they like the most about Excel, they would tend to forget **the most important thing**: instant feedback!
Enter a formula somewhere, and you can see right away what the outcome is on your screen, no need to compile, run etc, just enter some data or formula
and you will see directly whether your code works or not.

> Excel provided continuous testing avant la lettre!

This might seem like an obvious thing, but it is not! Consider all the things people are doing in the latest decade to shorten the feedback cycle of their
unit tests; this is a big thing.

In fact, I think there is one guy who realized this, and he actually started building an IDE that provides instant feedback:

<iframe width="480" height="360" src="https://www.kickstarter.com/projects/ibdknox/light-table/widget/video.html" frameborder="0" scrolling="no"> </iframe>

This is an IDE that allows you to write software in the same way Excel works, and, to be honest, it looks awesome!!
(While writing this post, I noticed [an alpha is available](https://www.lighttable.com/), so that's another thing on my todo list.)

## Software design principles apply

In Excel these are in fact even more obvious; the classic paradigm of easy versus simple especially applies in Excel; things might be easy to write,
but they are hard to figure out, so they are not simple. If attendees wonder what I was rambling about afterwards during the lean coffee over "easy versus simple", I would like to take a look at this video, or [a more detailed post I wrote about it](/posts/continuous-thinking-essay-ease-and-simplicity-in-software-architecture//):

<iframe width="640" height="360" src="//www.youtube.com/embed/rI8tNMsozo0" frameborder="0" allowfullscreen></iframe>

## Back to the excel thingy

In my opinion (and I think a lot of the attendees agreed), there is a lot of unexplored opportunity in this hidden gem called excel file refactoring.
The more people start writing higher-level tools, the more the software design principles apply to the configuration/usage of those tools; there will
probably be a whole brave new world out there...

<a href="https://www.flickr.com/photos/twm_news/5730159124/" title="World Unicorn by Tyne &amp; Wear Archives &amp; Museums, on Flickr"><img src="https://farm3.staticflickr.com/2698/5730159124_ec4d3b31e9.jpg" width="500" height="399" alt="World Unicorn"></a>

# 2 Free tickets for the BuildStuffLt conference!

A few weeks ago Greg Young kindly provided us 2 free tickets for the [BuildStuff.lt]((https://buildstuff.lt/) conference, and the idea was to hand
them out during this meeting...

And, for this one time that we did have a woman in the crowd, we asked her to pick out 2 cards out of a pile, which she did.
Thank you [@BuildStuffLt](https://twitter.com/BuildStuffLT) for this opportunity!

<blockquote class="twitter-tweet"><p>Just won a ticket to <a href="https://twitter.com/BuildStuffLT">@BuildStuffLT</a> ! Thanks <a href="https://twitter.com/DDDBE">@DDDBE</a> and <a href="https://twitter.com/gregyoung">@gregyoung</a> !</p>&mdash; Bart Waterschoot (@bwaterschoot) <a href="https://twitter.com/bwaterschoot/statuses/390890629670400000">October 17, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

BTW, this is a great conference where some of us will be attending, and some others might, so make sure you [check it out](https://buildstuff.lt/)!

# Part two: lean coffee

<blockquote class="twitter-tweet"><p>Lean coffee at <a href="https://twitter.com/search?q=%23dddbe&amp;src=hash">#dddbe</a>. Great format for sharing ideas and insights! <a href="https://t.co/BwcSi36F3n">pic.twitter.com/BwcSi36F3n</a></p>&mdash; Stijn Volders (@ONE75) <a href="https://twitter.com/ONE75/statuses/390920024351068161">October 17, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

The next part was a non-conference using the lean coffee format. The crowd was interesting, but I honestly do think that we needed to split up in smaller
groups, so we could give everyone the opportunity to speak up...

As an attempt to do that, I even promised to the group to keep my mouth shut for 10 minutes - which is hard for me, as I tend to have an opinion about anything ;-) -.

I would suggest that, for the next time we do this, we keep the groups smaller. I noticed during the [DDD Barbecue](https://www.heimeshoff.de/wordpress/?p=276) with the German DDD community a while back, that when you have smaller groups (7 or 8 tops), everybody tends to speak up.

Nevertheless, a lot of interesting stuff passed, like what is DDD, what is CQRS, how to get started with DDD, what soft skills does a developer require?

I even got a few minutes to declare my current love for [Erlang](https://www.erlang.org/)/[Elixir](https://elixir-lang.org/), for heaven's sake.

The random quotes [Mathias](https://verraes.net/) wrote down on the whiteboard during the event provide a good overview.

<blockquote class="twitter-tweet"><p>Yes, yes, yes RT <a href="https://twitter.com/stijnvnh">@stijnvnh</a>: <a href="https://twitter.com/mathiasverraes">@mathiasverraes</a> <a href="https://twitter.com/ylorph">@ylorph</a> <a href="https://twitter.com/DDDBE">@DDDBE</a> some notes extracted from the leancoffee yesterday <a href="https://t.co/ZcuZxOn2mC">pic.twitter.com/ZcuZxOn2mC</a></p>&mdash; Jan Fellien (@janekf) <a href="https://twitter.com/janekf/statuses/391426338772779008">October 19, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

# Wrapping it up

To wrap up this interesting evening, a few members of the community decided to have one last drink, talk about how it went and think about the next thing to do. We will [keep you posted](https://groups.google.com/forum/#!forum/be-ddd)!

Thank you all for attending, we had a blast, and we hope you did as well!

Signing off,

Tom
Expert in Tomfoolery

PS: if you do find any errors in this text or would like to add something, feel free to do so by editing this file [here](https://github.com/ToJans/tojans.me.dev/blob/master/source/_posts/2013-10-19-DDDBE-meetup-2-legacy-inferno.markdown) and sending me a pull request...
