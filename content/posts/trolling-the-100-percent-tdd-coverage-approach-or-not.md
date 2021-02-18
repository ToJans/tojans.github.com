---
layout: post
date: "2014-02-24"
slug: "trolling-the-100-percent-tdd-coverage-approach-or-not"
title: "Trolling the 100% TDD coverage approach - or not"
comments: true
categories: 
---
When I read [this blog post](https://dupdob.wordpress.com/2014/02/21/the-secret-for-100-test-coverage-remove-code) about how and why one should achieve 100% code coverage on his code, I was flabbergasted, and when I noticed Bart's reply, I decided to check:

<blockquote class="twitter-tweet" lang="nl"><p><a href="https://twitter.com/ToJans">@ToJans</a> It&#39;s a troll right ?</p>&mdash; Bart Waterschoot (@bwaterschoot) <a href="https://twitter.com/bwaterschoot/statuses/437954629545242624">24 februari 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### The subject 

Here is the gist of [the article](https://dupdob.wordpress.com/2014/02/21/the-secret-for-100-test-coverage-remove-code):

> For me, there is no question **100% coverage is** the **only** worthy **objective, do not settle for less**.

> There is one simple golden rule: to reach and maintain 100% coverage, you do not need to add tests, you have to **remove not covered lines!**
>
> This is important, so let me restate that: a line of code that is not covered is **not maintainable, must be seen as not working and must be removed!**

### Trolling?

In my personal opinion, this is wrong on so many levels so I decided to ask if he was trolling.... He said he was not, so this was my reply:

> Well, IRL working code providing business value beats coverage/good design by miles... Also, there is a lot of added business value in legacy code, so don't delete it, but refactor it (see fowler's book).
>
> Another thing people sometimes do is throw away test code, as it is holding them back (in fact, lots of tests are considered legacy), so I wouldn't approach this black & white.
>
>While I love good, well written code (preferably developed with BDD or similar), that is not always the case. Just deleting it would be ...
>
>To quote someone replying on twitter: "rm -rf /"; 100% coverage done, now let's grab a beer...

This was the tweet I was referring to, BTW:

<blockquote class="twitter-tweet" data-conversation="none" lang="nl"><p><a href="https://twitter.com/ToJans">@ToJans</a> rm -rf /path/to/legacy-app&#10;&#10;100% coverage achieved! Time for a beer.</p>&mdash; Michael Moussa (@michaelmoussa) <a href="https://twitter.com/michaelmoussa/statuses/437966254180007936">24 februari 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### The reply

>Thanks for your feedback. Working software over anything else, yes :-), but working software without adequate automated tests getting legacy by the minute..
>
> Definitely, I did not have legacy code in mind, so I will edit the post to clarify that.
Adding test before refactoring is a good approach, but 100 % coverage is not only overkill, but counterproductive.
>
> When tests are thrown away, someone has failed: either the test was not relevant (probably too close to the implementation) or the maintainer was lazy...
>
> My 2 cts

Which might sound reasonable, however, there are some caveats IMO:

### My reply

>There's different concepts of testing; TDD usually tests the implementation, not the behavior AFAIK... So when you change your implementation, you need to change your tests. BDD removes some of those issues.
>
>Using TDD for problem exploration is usually a major PITA; Peter Norvig's Sudoku [1] is a commonly known example...
>
>When you think about the problem first, manage to understand it and keep the solution simple, a few integration tests are all you need...
>
>Test-driven design can help you to create an implementation, not to find a solution. Proper modelling is necessary and way too often people forget that.
>
>Also, if you want to verify whether your code works: 100% test coverage actually proves nothing; take the simple example if forgetting to check for a division by zero somewhere.
>
>If you really want to verify how good your solution matches the problem space, I would suggest you to use property based testing; that will discover way more edge- and side-cases then you could ever imagine....
>
>[1] https://devgrind.com/2007/04/25/how-to-not-solve-a-sudoku/

### In conclusion

Don't get me wrong; I love Behaviour-Driven development, and even use some TDD from time to time, but if the problem is not complicated I just verify whether my solution model covers my problem space, using integration-like tests.

If something really needs to be thoroughly tested, I would suggest to try property-based testing; at least that will show you where the problems in your solution space are.
