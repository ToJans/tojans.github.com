---
layout: post
date: "2013-09-04"
slug: "the-very-first-dddbe-event-the-modellathon"
title: "The very first #DDDBE event: the modellathon"
comments: true
Tags: ["Development", "DDD"]
---

This is my personal review of the [@DDDBE](https://twitter.com/dddbe) inaugural meeting: a [modellathon](https://modellathon.eventbrite.com/).

# Some background info

So, last night we had the very first event of [the Belgian DDD community](https://domaindriven.be/): a modellathon facilitated by [Mathias Verraes](https://twitter.com/mathiasverraes) and [Stijn Vannieuwenhuyse](https://twitter.com/stijnvnh), and kindly hosted by the hosting company [Combell](https://twitter.com/combell).

For the people who do not know the concept of a modellathon - in fact, I think we might even have invented the term maybe, but I am not quite sure -, it was something we spiked like a while a go, while coming back from the [London DDD Exchange](https://skillsmatter.com/event/design-architecture/dddx-2013):
As we were sitting together on the train with some of the [#CQRSBeers](https://twitter.com/ToJans/statuses/297059516049137664) guys, we considered starting a Belgian DDD community, and having real workshops.

Somehow the idea for the first workshop emerged: instead of having hackathons (hacking away on code), why not have a modellathon (hacking away on domain models).

### UPDATE
Apparently the modellathon term was [Jef Claes](https://twitter.com/JefClaes)' idea !

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/ToJans">@ToJans</a> For the record, I coined the term on our way back from DDDX ;)</p>&mdash; Jef Claes (@JefClaes) <a href="https://twitter.com/JefClaes/statuses/375266359875481600">September 4, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

So one thing came to another, and all of a sudden we were in this situation:

# The modellathon

<blockquote class="twitter-tweet"><p>Kickoff of the first <a href="https://twitter.com/DDDBE">@dddbe</a> event the <a href="https://twitter.com/combell">@combell</a> offices: the modellathon! <a href="https://t.co/moCuAjYqqS">pic.twitter.com/moCuAjYqqS</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/374938677522464768">September 3, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
<!-- more -->
Our assignment for the workshop was to model a system that was used as a reporting tool in the Kazachstan Education System.

This was not your average fictuous model, we even received some official Kazachstan documents:

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/search?q=%23DDDBE&amp;src=hash">#DDDBE</a> is starting, and I have the strong feeling that <a href="https://twitter.com/DDD_Borat">@DDD_Borat</a> has his filthy fingers in this ;) <a href="https://t.co/q1LjjACz4d">pic.twitter.com/q1LjjACz4d</a></p>&mdash; Marco Heimeshoff (@Heimeshoff) <a href="https://twitter.com/Heimeshoff/statuses/374940972167495680">September 3, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

We were divided into groups of 4 people, trying to make sure that at least one person having experience in domain modelling was in every group.

Just to elaborate on the "experienced" part: when we asked who had experience in domain modelling, not a lot of fingers went up, but when we asked who had managed to build a domain model in the past, that somehow turned out to be completely wrong, some more fingers went up.

The role of the expert was just to find a way to get started, but once you have the juices flowing, the expert's opinion is as valuable as anyone else's. So it is more about facilitating the process then being good in the whole modelling part.

# On to the modelling part

During the first pomodoro of the modellathon (after a general introduction by the domain experts), people started experimenting with different kinds of modelling at different groups.

A lot of people were trying to use the event storming approach - as they had experienced the value of the technique in a really great workshop with [Alberto Brandolini](https://twitter.com/ziobrando) during [Vaughn Vernon](https://twitter.com/VaughnVernon)'s [IDDD tour](https://idddtour.com/) in [Belgium](/posts/idddtour-2013-belgium-an-immersive-experience//).

Somehow this approach did not feel valuable to us in this phase of the domain analysis, as the question was more about the report we initially got:

- Why was having only this piece of paper not a viable solution?
- Why does the business need the system? What does it need to do?

So we started asking questions from there, and all of a sudden the domain experts were mentioning concepts like observations and evaluations. So instead of focussing on the part where you process grades/tests/students/whatever, the domain experts were  focussed on that part; the report was only a deliverable from the system, not the system in itself.

From this knowledge we could build a conceptual model of teachers being able to track the observations, progress and expectations in a graph-like model with time on one axis and skill on the other, just finding a way to represent the domain to the experts on paper...

![It is only the left half, the right half came in the next pomodoro](https://i.snag.gy/x17zw.jpg)

The @DDDBE guys decided to put a picture of us explaining our model on twitter, and I would like to sincerely thank them for for photographing me from my best side ;-).

<blockquote class="twitter-tweet"><p>. <a href="https://twitter.com/ToJans">@ToJans</a> is showing off a model of pupil reports for the Kazakhstan Education System <a href="https://t.co/ZjIhMj2amZ">pic.twitter.com/ZjIhMj2amZ</a></p>&mdash; Belgian DDD group (@DDDBE) <a href="https://twitter.com/DDDBE/statuses/374951596805095424">September 3, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

After another pomodoro, we evolved into this high overview model where we found out that observations (like grades, tests, but also subjective observations) were not always side-effect free, and there had to be some kind of a formal evaluation process for an observation; this finally resulted in the flow of
observation (1..n) -> evaluation (1..n) -> progress x learning goals (1..n) -> expectations and back....

Then all of a sudden [the DDD cowboy - AKA Yves Reynhout](https://twitter.com/yreynhout) came along, and he stated the model might be to abstract to be usable, and challenged us to mock up a UI to prove it.

So we did, and by building this mockup for the evaluation part, we managed to get an even deeper understanding of the domain...

We noticed the higher level overview might have been all that was required for this particular bounded context or subdomain, because it made sense by mocking up the UI.

The most interesting part however, is how we progressed from mapping nouns  from the specs to trying to find out why the system was needed ([Root cause analysis/5 why's - anyone?](https://en.wikipedia.org/wiki/5_Whys)).
Then, by modelling our UI mockup, we were able to verify whether our assumed domain model would be usable in the real world...

# Conclusion

Well, this was a really interesting exercise to perform; I think the biggest lesson in all this, was to experiment, and not being afraid of starting over, especially using a different modelling approach. As we all observed in the end, and Mathias mentioned in the beginning:

>  "essentially, all models are wrong, but some are useful" - George Edward Pelham Box

Hence, we could coin the concept model storming (initally mentioned by Mr. Brandolini I assume - give credit when it's due -) as the best approach to doing things: find several ways to model your domain, and gain new insights every time you do it.

# A note about the #DDDBE community

Well, there is not a lot to say about that from my side, except that you were all pretty awesome; this was a huge experiment, but somehow we managed to get an interactive workshop where A LOT of people contributed.

Based on the feedback you provided, I am quite confident we can do a lot more with this community, so once again, everyone, feel free to suggest and improve, or even join!!

We also had - once again - some interesting discussions afterwards, and I even managed to see a fellow DDD practitioner (which shall remain unnamed) perform a musical masterpiece on the day after!

<blockquote class="twitter-tweet"><p>Marco &quot;owning the didg&quot; at my place ;) <a href="https://t.co/xHFQFNfKde">pic.twitter.com/xHFQFNfKde</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/375169904716296192">September 4, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I hope we see you at the next event!

Tom/[@ToJans](https://twitter.com/ToJans)

T.

# More:
<ul>
  <li>Belgian Domain-Driven Design community <a href="https://domaindriven.be">domaindriven.be</a></li>
  <li><a href="https://twitter.com/DDDBE">@DDDBE</a> on Twitter</li>
  <li><a href="https://verraes.net/2013/09/dddbe-modellathon/">Writeup by Mathias Verraes</a></li>
  <li><a href="https://www.flickr.com/photos/91274760@N08/sets/72157635393106480/">Photo’s by Stijn Volders</a></li>
  <li><a href="https://www.jefclaes.be/2013/09/the-first-dddbe-modellathon.html">Writeup by Jef Claes</a></li>
</ul>

# !!! Breaking news !!!

This just came in; _he who shall not be named_ A.K.A. the Mob/Godfather of Event- & Modelstorming approves!

<blockquote class="twitter-tweet"><p>Fantastic blog posts from <a href="https://twitter.com/ToJans">@ToJans</a> <a href="https://t.co/AyV1SxUlvZ">https://t.co/AyV1SxUlvZ</a> and <a href="https://twitter.com/mathiasverraes">@mathiasverraes</a> <a href="https://t.co/PwG2NMR4Jg">https://t.co/PwG2NMR4Jg</a> about <a href="https://twitter.com/search?q=%23eventstorming&amp;src=hash">#eventstorming</a> &amp; <a href="https://twitter.com/search?q=%23modelstorming&amp;src=hash">#modelstorming</a></p>&mdash; ziobrando (@ziobrando) <a href="https://twitter.com/ziobrando/statuses/375725315730837506">September 5, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
