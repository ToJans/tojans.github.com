+++
Description = "Software estimates done right"
date = "2021-02-23T12:00:00+01:00"
slug = "software-estimates-done-right"
title = "Software estimates done right"
+++


So, **how do you estimate** a software development effort?

>Ha, that's easy; there is a website called [The Estimate Goat][3], that provides you random estimates every time you resresh the page!

![An estimation by the estimate goat][4]

Joking aside, let me rephrase the question: **how do you reasonably estimate** a software effort?

According to software developers, this is hard. 

In fact, some people considered this so hard that they started the [#NoEstimates movement][1] in 2013, with the following motto: 

> Estimates are waste and we must eliminate estimates in software development.

It grew quite a following, so let's start by begging the question:

### Can we do without estimates?

Yes! No! Well, it depends... 

Typically we __commit__ to an engagement in the following ways:

- __Time and material__: provide __labour and resources__ for __n units of time__ - mostly freelancing or employment;
- __Fixed price__: provide certain __deliverables__ according to __predefined acceptance criteria__. This can be time-boxed and/or scoped, for example "renovate my bathroom";
- A __hybrid__, for example T&M development, but a fixed price analysis and support contract.

Based on the type of __engagement__, engaged stakeholders are exposed to __diffent kinds of uncertainty__:

- __Cost__ - "How much will it cost? How much effort do we need to invest?";
- __Time__ - "How long will it take?";
- __Scope__ - "What is included, and what is not?".

If __all engaged stakeholders are willing to accept uncertainty__, i.e. "I don't care how much it costs or how long it takes, just get it done", __estimates are useless__. 

But even in this case, people ask how long it typically takes, which is interpreted as an estimate with high uncertainty... So they do end up with an __implicit estimate__...

### #NoEstimates and the maturity of software development

Software development is a relatively young discipline; this implies some of our methodologies are very immature, and for some areas we do not even have a methodology.

If we want to increase the maturity of our profession, we need to use proven methodologies deeply rooted in scientific 
backgrounds, so we can do *proper engineering* as opposed to going with a hunch...

In my opinion, the #NoEstimates movement exposes a lack of proper methodologies regarding estimations.

The goal of this post is to present two complementary estimation approaches, backed by at least some scientific reasoning.

>**Disclaimer:**
>
>There is no silver bullet, but I hope that this approach at least inspires you to sit down and think about how you do estimates.

### Estimating in a historical context: ''Monte-Carlo forecasting''

Let's assume you have a team that has been developing software for a few weeks, months or even years.
Given enough historical data, we can run a [Monte-Carlo simulation][10] to forecast effort and duration with probablity ranges.

I could go to great lenghts explaining why you could use this approach, but the [wiki of this project][8] motivates this approach rather well.

If you have your own data available, you can create your own forecast using [this webpage][6]

This tool was mentioned to me by [Aram Koukia][9], and here is an excerpt about the data he uses for input:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">I use 7 weeks of historical data from past projects and with considering some % tasks being added to scope from the initial set of tasks. I also assume most tasks finish between 1 - 5 days. I report with 80% confidence. My estimate-less forecasts has been pretty accurate</p>&mdash; Aram Koukia (@aramkoukia) <a href="https://twitter.com/aramkoukia/status/1351754189441957889?ref_src=twsrc%5Etfw">January 20, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Here is a screenshot of the [example forecast included in the project][17]:

![A monte-carlo forecast example][2]

Feel free to take a look at the [source-code][7], if that is your kind of thing.

This approach has 2 main advantages:

1. The outcome should be at least as good, if not better than the [''Fingerspitzengefühl''][13] your team is using right now;
2. You no longer have to bother your team asking for estimates.

So it's a win-win for everyone!

### 2. Estimating for a future context: ''Gaussian estimates''

In some cases you need to provide an estimate in a context you do not know yet.

For a lot of those cases, I used to think about the happy path, and then applied a multiplier of 3. I had no idea why this worked, but it worked reasonably well...

> **Remark:** 
>
> People described this approach [before][14] (multiply with &Sqrt; &Pi;, &Pi; or &Pi;²), but I never found any scientific reasoning behind it. 
>
> Because it had not been properly named, I baptized it ''Gaussian estimates''.
>
> If this approach already has a well-defined name - which seems very likely, as my reasoning seems quite obvious after the fact - please let me know!

So let's try to figure out why 3 (or &Pi;) might be a good multiplier in some cases:

#### About uncertainty

In a future context you have the following __[knowns and unknowns][5]__:

- __The known knowns__: what you know you know;
- __The known unknowns__:  what you know you don't know;
- __The unknown unknowns__: what you don't know you don't know.

Some examples of known knowns:

 - We will have to integrate with systems a, b & c;
 - The functionality need to cover e, f & g;
 - Our SLA will need to be h.

 Some examples of known unknowns:

 - How responsive is the customer;
 - How well defined is the scope;
 - Do we have any constraints we need to take into account.
 
Next to this, there will be unknown unknowns: aspects that we do not know we do not know, for example

 - Person x might provide subpar cooperation;
 - Person y might get ill and not be available for a while;
 - There might be a history with technology z in the past, which results in a lack of trust.

We can factor in the known unknowns in the constraints and assumptions of our contract, but what about the unknown unknowns?

#### A little statistics primer

My approach to factoring in the unknown unknowns is rooted in statistics.

> *There are 3 kinds of lies: lies, damned lies & statistics - Mark Twain*

First we will take a look at 2 different statistical distributions:

We have something called a **Standard Uniform Distribution**:

![Standard uniform distribution][11]

  - mean = 1;
  - median = 1;
  - standard deviation = 0;
  - area = 1.

Basically this just means that `f(x) = 1`.

We also have something called the **Gaussian Distribution** or normal distribution:

![Gaussian distribution][12]

  - mean = 1;
  - median = 1;
  - standard deviation = &sigma; (sigma);
  - area = &Sqrt; &Pi;.

The most important aspect to Gaussian distribution is the relationship with randomness; here is an excerpt [from wikipedia][16]:

>Normal distributions are important in statistics and are often used in the natural and social sciences to represent real-valued random variables whose distributions are not known.Their importance is partly due to the central limit theorem. It states that, under some conditions, the average of many samples (observations) of a random variable with finite mean and variance is itself a random variable—whose distribution converges to a normal distribution as the number of samples increases. Therefore, physical quantities that are expected to be the sum of many independent processes, such as measurement errors, often have distributions that are nearly normal.

#### The ''Gaussian multiplier''

Imagine we are estimating a project where the requirements are very well defined and the team is operating smoothly; the only unknown you have is not knowing the integration API well.

We ask to estimate the happy path, broken down in fixed units of time (one day).
This would imply your tasks would have a standard uniform distribution.

As everything else is routine, only the things concerning the integration API will have uncertainty included...

In reality, when executing these integration tasks, some will take a lot longer, and some will be shorter. Because we do not know what the actual distribution would be, we fall back to the distribution that occurs naturally in most of these cases: the Gaussian distribution. So converting from a standard uniform distribution to a Gaussian distribution should help. 

To convert from one to the other, we divide by the differential (the filled part of the graph) of the standard uniform distribution (1), and multiply with the differential of the Gaussian distribution (&Sqrt; &Pi;). Note that all tasks still have a mean and median of 1, but we introduced the standard deviation.

Now, let's assume you also need to interact with another organisation that has control over the API for every task, and that you will estimate this with an overhead multiplier of 30% if everything goes well (so estimates should be multiplied by 1.3). 
As you have not worked with the provider before, your estimate will probably not have a uniform distribution but a Gaussian distribution, so multiply with (&Sqrt; &Pi;) again.

So the actual estimate for our integration task would be: 
        
>   happy path * 1.3 * (&Sqrt; &Pi;) * (&Sqrt; &Pi;)

> = happy path * 1.3 * &Pi;

#### A more pragmatic approach to the ''Gaussian multiplier''.

The above explanation contains the gist of the idea, but requires you to have a very good grasp of what an uncertainty dimension is:

- Time;
- Scope;
- Cost;
- ... .

In order to make this a bit more digestable, I created a pragmatic heuristic that should be good enough for most cases. 
Without further ado, I present to you my suggested model:

![Gaussian estimates][15]

This should provide you a pragmatic, but scientifically sound approach to doing estimates for future contexts.

I did not bother to go beyond &Pi;², because the probability of your estimate would be too low beyond that point...

### In closing

It has been over 5 years since my last blog post, but I sure enjoyed myself organizing my thoughts.

I hope this post is as valuable to you as it has been to me. 

If you see any flaws, mistakes or even typos feel free to contact me...

All the best, and let's hope it doesn't take another 5 years to publish a blog post,

Tom


[1]: http://zuill.us/WoodyZuill/2013/01/25/if-you-found-estimates-bring-no-value-what-would-you-do/
[2]: ./monte-carlo.png
[3]: http://theestimategoat.com/
[4]: ./estimate-goat.png
[5]: https://en.wikipedia.org/wiki/There_are_known_knowns
[6]: https://rodrigozr.github.io/ProjectForecaster/
[7]: https://github.com/rodrigozr/ProjectForecaster
[8]: https://github.com/rodrigozr/ProjectForecaster/wiki
[9]: https://twitter.com/aramkoukia
[10]: https://en.wikipedia.org/wiki/Monte_Carlo_method
[11]: ./rectangular-distribution.jpg
[12]: ./gaussian-distribution.jpg
[13]: https://en.wikipedia.org/wiki/Fingerspitzengef%C3%BChl
[14]: https://web.archive.org/web/20140329201346/http://alistair.cockburn.us/The+magic+of+pi+for+project+managers
[15]: ./gaussian-estimates.png
[16]: https://en.wikipedia.org/wiki/Normal_distribution#Standard_deviation_and_coverage
[17]: https://rodrigozr.github.io/ProjectForecaster/#eyJwcm9qZWN0TmFtZSI6IlRlc3QgcHJvamVjdCIsIm51bWJlck9mU2ltdWxhdGlvbnMiOjEwMDAwMCwiY29uZmlkZW5jZUxldmVsIjo4NSwidHBTYW1wbGVzIjpbOCw1LDQsNiw2LDUsMywxLDMsMywyLDcsNiw2LDMsNSwyLDIsNSw2LDQsM10sImx0U2FtcGxlcyI6WzEzLjEsOSwxMy44LDcuMiw4LjgsMC41LDE1LDguMiwyMS45LDIyLjUsOS43LDcuMiwyLjEsMjkuOSwxNi4zLDguMSw1LDguNiwyOC40LDAuNSw3LDIxLjcsMC41LDQsNy4xLDUsMi4xLDIuMyw0LDMuMSwxLjIsMi41LDEuOCw2LjEsNi4zLDIsMTIsMTIuMywyLjEsNy4zLDIwLjQsMTMuMSwwLjUsNDguOSw5LjgsNy40LDEuOCwxNywxMi4xLDMyLjcsMTQuMywwLjksMjIuMiw3LDE2LDEzLjIsNS4yLDE0LjUsNi4yLDIuMiwzLjIsNi4zLDkuNSwxOC4zLDcsMTMsMS40LDcuMywxMC4xLDE5LDEyLjMsMC44LDcuMiwyNC4xLDMuMiwwLjUsNy4xLDEwLjEsNiwyMy4xLDE0LjMsMTIsMjAsMTYuNyw2LjksMi4xLDEuMiw1LjcsNy4xLDcsNC41LDcsNSwxMC4xLDYuM10sInNwbGl0UmF0ZVNhbXBsZXMiOlsxLjI5LDEuNTYsMS40NywwLjc1LDEuMjUsMS4yNSwxLjE4LDEsMV0sInJpc2tzIjpbeyJsaWtlbGlob29kIjo1MCwibG93SW1wYWN0IjoxMiwiaGlnaEltcGFjdCI6MTUsImRlc2NyaXB0aW9uIjoiUGVudGVzdCBtYXkgYmUgcmVxdWlyZWQifSx7Imxpa2VsaWhvb2QiOjc1LCJsb3dJbXBhY3QiOjUsImhpZ2hJbXBhY3QiOjgsImRlc2NyaXB0aW9uIjoiRGF0YWJhc2UgdXBncmFkZSBtYXkgYmUgcmVxdWlyZWQifSx7Imxpa2VsaWhvb2QiOjUsImxvd0ltcGFjdCI6MTUsImhpZ2hJbXBhY3QiOjIwLCJkZXNjcmlwdGlvbiI6IlBvdGVudGlhbCB3b3JsZC13aWRlIHBhbmRlbWljIn1dLCJudW1iZXJPZlRhc2tzIjozOCwidG90YWxDb250cmlidXRvcnMiOjEwLCJtaW5Db250cmlidXRvcnMiOjEsIm1heENvbnRyaWJ1dG9ycyI6NSwic0N1cnZlU2l6ZSI6MjAsInN0YXJ0RGF0ZSI6IjIwMjAtMDktMDcifQ==