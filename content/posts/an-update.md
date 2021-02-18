+++
Categories = []
Description = ""
Tags = []
date = "2016-09-01T09:26:11+02:00"
title = "An update"
+++

It has been a while since I have updated this blog, so I decided to give you a small overview of what happened and what I am currently doing.

# Grand strategy

## Bootstrapping and consulting

I have been bootstrapping [Virtual Sales Lab](https://virtualsaleslab.com), and doing some consultancy on the side to fund for it. 
This implies living on a shoe string budget without cutting the kids and Mrs. short of any assets.

Here is a short video, showing one of the online tools that [Virtual Sales Lab](https://virtualsaleslab.com)
 offers; try it yourself [here](https://vslweb.azurewebsites.net/r/vsl/en/designer/index/conservatory): 

<iframe width="560" height="315" src="https://www.youtube.com/embed/m-ngIgARRrs" frameborder="0" allowfullscreen></iframe>

Luckily, getting a co-founder on board seems to pay of, as sales is steadily ramping up.

## DDD

On the community side, I have done a few DDD things:

- a model storming session for the very first DDDNL meetup

<blockquote class="twitter-tweet" data-lang="nl"><p lang="en" dir="ltr">Great results :-) thanks <a href="https://twitter.com/ToJans">@ToJans</a>, <a href="https://twitter.com/Heimeshoff">@Heimeshoff</a>, <a href="https://twitter.com/yreynhout">@yreynhout</a>, <a href="https://twitter.com/triforkams">@triforkams</a> &amp; especially @PickUpMarket. <a href="https://twitter.com/hashtag/dddnl?src=hash">#dddnl</a> is a fact <a href="https://t.co/bVWcY2Z11w">pic.twitter.com/bVWcY2Z11w</a></p>&mdash; Marijn Huizendveld (@huizendveld) <a href="https://twitter.com/huizendveld/status/713109374143741953">24 maart 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

- an intro about DDD tactics for the first DDD Greece meetup).

<blockquote class="twitter-tweet" data-lang="nl"><p lang="en" dir="ltr">. <a href="https://twitter.com/ddd_eu">@ddd_eu</a> visit to Parthenon <a href="https://twitter.com/hashtag/DDDesign?src=hash">#DDDesign</a> /cc <a href="https://twitter.com/ToJans">@ToJans</a> <a href="https://t.co/vwmUehqeMe">pic.twitter.com/vwmUehqeMe</a></p>&mdash; DDD Greece (@DDDGreece) <a href="https://twitter.com/DDDGreece/status/722721350398451712">20 april 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## Others

Next to trolling people on twitter, I am heavily vested in social activities in the weekend.
We even started a "veteran soccer team" that trains every Sunday morning; good times with the homies ;) .

# Schedule

While working on your own stuff is fun, it can be brutal. Especially when things start ramping up, and you need to deliver while paying of technical debt. 
More on that later in this post.

Here is an overview of my commits in the last month, while in `crunch mode`: 

<blockquote class="twitter-tweet" data-lang="nl"><p lang="en" dir="ltr">Being in a startup: time of day/day of week &amp; commits... <a href="https://t.co/7cSuUPmiIm">pic.twitter.com/7cSuUPmiIm</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/status/768471861982146560">24 augustus 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## A day in the life

- I get up anywhere between 5am and 7.30am, depending on the time I go to sleep
- Currently, I sleep on average 5 hours/night. I tend to get a small dip in the afternoon, so I might need to ramp it up a bit.
- I spend between 2 and 4 hours a day on research: 
   - subjects: computer graphics, 
     computer vision, webgl, three.js, computer simulations, VR, AR, SfM, VR-UI, Procedural generation/-simulation, best practices in software dev, hardware, haskell ...
   - sources: people, google groups, reddit, popular sites, twitter search, github issues, blogs, ...
   - some learning tips: 
      - most of the research papers have an online draft available for free
      - my knowledge is usually not advanced enough, so I scan papers/posts/issues to get the main idea
      - if you don't get it, continue anyway, and try again the next day
      - the major idea is to get a "feel" for the domain you are working in: what's cutting edge, what might be the future?
      - I never skip a day, it's a good way to warm up your brain and get inspired. Even when deadlines are super tight, I try to squeeze in at least an hour, even if it is scattered all over the day 
- I spend on average 1 to 4 hours communicating with the other members:
   - subjects: sales, marketing, grand vision, quotes, fun, family, new stuff happening in our domain, an interesting competitor, persons, opinions, money, ...
   - via: Slack, Skype, meet-ups, small lunches, road trips...
   - all commits and mentions on twitter are integrated in Slack.
- The main part of my day is spent on development (probably anywhere between 4 and 16 hours)
   - I spike a lot of things in the beginning of the week, using [jsfiddle](https://jsfiddle.net/) for new [Vue.js](https://vuejs.org/) components, or a homegrown solution for parametric 3D models. Short feedback loops FTW!
   I tend to throw them together at the end of the week.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ua1pnk81jWI" frameborder="0" allowfullscreen></iframe>

   - Any bugs that are reported or that I notice myself are solved whenever I have commited my current code, bugs shouldn't last longer than a day after being noticed.
   - All of my effort is focused on the front-end: I reduce tech debt as much as possible there, and it gets better/faster/easier on every single designer I write.
   - My back-end was built by duck taping things like Azure storage and [Auth0](https://auth0.com) together using super simple .Net MVC code. 
   - The hardest part about software development while bootstrapping, is not vision, strategy or tactics, but logistics. F.e. I tend to avoid integration points etc, 
   but just send an email to the client. Another example: for two years, I've been using a google sheet as my table storage, using a simple form post.
   I know this might hurt in the long run, but I have it covered, because....
   - I skip a lot of best practices for the back-end during bootstrapping. I do the easiest - not the simplest - thing that might work,
   and come back when it hurts, because ...
   - ... I have an expert working on a proper version of the back-end, respecting DDD- and other practices.
   - Deployment is as simple as a `git push`; `master` is auto-deployed to the Azure test environment, and the `release` branch to production.
   - I use `Asp.Net MVC`, the expert is using [Suave](https://suave.io) for the back-end. 
   - Platforms:
     - Web servers: 
       - designers: Azure B1 App services + table/blob storage
       - website+CMS+mailings: [Wix](https://wix.com)
     - Quotes, CRM, marketing material, logos, ...:
       - drafts via google docs, final versions on dropbox in a file structure
     - Calendar:
       - both my co-founder and me share our personal calendar over google calendar.
     - Tasks:
       - Trello
     - Communication:
       - Slack, Skype, ...
       - Fixed telephone number: via VOIP
       - Integrated chat on the website
       - Email: routing all domains via [mailgun](https://mailgun.com) to gmail
- In non-crunch-mode I spend about 4 to 6 hours a day and weekends on the Mrs, kids, social contact, fun activities, etc. 
In crunch mode I spend about an hour watching TV when I go to bed, that's it.

# The team

I have worked solo on this thing for 2 years, before my co-founder joined me. He is making things happening, simply because:

> **A software developer thinks about problems, boundaries, a sales person thinks about opportunities and dreams.**

Next to this there are a few members on the slack room that I trust dearly. No one of them is getting paid ATM. 

These people chime in with different stuff:

- opinions
- bug reports
- domain-related news
- small successes
- translations
- source
- moral support
- feedback
- ... 

We did small team building activities in the past, which reminds me that we should do one again soon.

My co-founder was a bit hesitant about my HR strategy, which basically comes down to:

> **Hire people you'd like to work for yourself. Explain the grand vision, share the info you have, and believe in self-guidance.**
> **Explain commitments we make with customers, and make sure we share progress and/or problems.**
>
> **We don't hire toddlers, so we shouldn't treat them as toddlers, but as adults.**

It took some convincing, but he's now completely stoked about this. In fact, he even uses it as a sales argument.

I have a few people lined up, and the minute we can afford them, they will get paid for their efforts, whether they work full-time,
part-time, or on a project basis for us.

# In closing

The main goal of the company is:

- being a company where I would love to work
- being a company where people love to be a customer

We are not there yet, but are making vast progress.

I will repeat one of my favorite quotes to close off:

> **You're only here for a short visit. Don't hurry, don't worry. And be sure to smell the flowers along the way.**
>
> _Walter Hagen_

Signing off,

Tom

[Virtual Sales Lab](https://virtualsaleslab.com)