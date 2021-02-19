---
layout: post
date: "2011-03-31"
slug: "continuous-thinking-nerdbeers-providing-business-value-by-issue-tracking"
title: 'Continuous thinking: Nerdbeers - Providing business value by issue tracking'
---

<p>Note: this post is part of a series; you can find the first post <a href="/posts/Continuous-thinking-just-ship-it-the-story-of-NerdBeers/">here</a>.</p>
<h3>Introduction</h3>
<p>Well, another 14 days passed by for the <a href="https://github.com/ToJans/NerdBeers" target="_blank">NerdBeers</a> project, and a lot has happened:</p>
<ul>
<li><a href="https://github.com/ToJans/NerdBeers/pull/6" target="_blank">@Grumpydev added a proper design</a></li>
<li>I did some major refactoring in the FailingSqlite branch, which will allow us in the future to have full integration testing available for doing proper BDD (or top-down TDD, if you prefer to call it like that). Unfortunately this branch is still pending for integration due to some problems.</li>
<li>I got some followers/forks over at github (Yay!!)</li>
<li>Some more people offered to help me out</li>
<li>Both @MarkRendle and @NotMyself progressed a lot with both Simple.Data and Simple.Data.SQLite</li>
<li>Spring started; I enjoyed the sunshine outside with the kids and the Mrs.</li>
<li>Social obligations            
<ul>
<li>My brother in law's house renovation deadline is approaching</li>
<li>My brother's birthday party</li>
<li>Lots of catching up with some friends</li>
<li>...</li>
</ul>
</li>
</ul>
<h3><br /></h3>
<h3>So Nerdbeers has not really changed a lot ? Are you lamenting ???</h3>
<p>No, in fact I am not, <a href="https://github.com/ToJans/NerdBeers/commits/FailingSqlite" target="_blank">I spent quite a lot of time on trying to get the "FailingSqlite branch" going</a>, but unfortunately I have not been able to finish it, so I can not integrate all my changes into the master branch.</p>
<p>After receiving a kind offer from someone to help me out on the project, he asked me what still needed to be implemented. This got me thinking:</p>
<p>In this project, I reject tools/methodology as long as possible. Since I noticed the project was starting to slip - I've spent a lot of time on it, but the Net result for the end user is still zero -, I wondered how I could prevent this from happening again.</p>
<p style="padding-left: 30px;"><strong><em>After all, that is what Agile/Lean is all about: be as efficient as possible in what you do, and the minute you are getting less efficient, look back at what happened, and find a way to make sure it does not happen again.</em></strong></p>
<p>I used this approach all the time in the Nerdbeers project: I started without any tests or IOC, I postponed them until the manual testing process was slowing me down/not error-prone enough. This might mean I have a suboptimal design, but since there is no real business value in this, I can safely neglect this. When the suboptimal design starts getting in the way of doing efficient development, I can always refactor.</p>
<p>Anyway, back to the slipping part.</p>
<h3><br /></h3>
<h3>How can I prevent this lamenting stuff ?</h3>
<p>The reason for lamenting is quite straightforward: I need a proper way to determine my - and the contributor's priorities. So I started creating issues on github, and after a few attempts of tagging, I finally found a method that works for me. It is heavily inspired by the Kanban stuff I use all the time during dev.</p>
<p>This is what the open issues list currently looks like:</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2011%2f3%2fOpenIssues.png" alt="" width="659" height="465" /></p>
<p>&nbsp;</p>
<h3>Whoa, that's a lot of tags!! Why is that ?</h3>
<p>Well, because I need them; let's look at them one by one, in the order they are assigned:</p>
<ul>
<li>Type: determine whether an issue is providing direct business value (bug or feature) or not (Tech)</li>
<li>Time: a very rough estimate how much time it might take to implement; the purpose is helping you prioritize issues</li>
<li>Care: this tag points to the person who is taking care of this issue (you could consider this a bit like an assignment)</li>
<li>Stat: (short for status) Using stat you can follow the progress of the task</li>
</ul>
<p>I tried searching for the minimal amount of tags which would allow to determine the correct priorities.</p>
<p>Using these tags I found out that the huge branch I'm currently working on, does not really provide a lot of added business value, so I decided to lower the priority and make it a bottom one. This is actually something that happens a lot with projects: things get implemented because they are "cool", but they actually do not provide a lot of direct business value. These tags should help me to prioritize.</p>
<p>Another cool thing is that the closed issues list now actually provides some value:</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2011%2f3%2fClosedIssues.png" alt="" width="659" height="465" /></p>
<p>&nbsp;</p>
<h3>Fixing the features</h3>
<p>As I was thinking about all the possible features, I noticed that I was adding a lot of them, without actually thinking them through. Since I wanted to avoid adding features which do not provide business value, I decided to implement a BDD technique into my feature definition.</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2011%2f3%2fIssueAddPinMap.png" alt="" width="659" height="465" /></p>
<p>Lets take a look at this in detail:</p>
<pre><span style="text-decoration: underline;"><strong>As a</strong></span> site owner
<span style="text-decoration: underline;"><strong>I would like</strong></span> the Nerd
<span style="text-decoration: underline;"><strong>To be able to</strong></span> view a map of all upcoming nerdbeers
<span style="text-decoration: underline;"><strong>So that</strong></span> he can choose whether he would organise one himself, or just join another one<br /></pre>
<p>This uses my favorte BDD format for BDD stories: you inform the reader who wants the feature, for whom it is designated, what it is and what the business value is.</p>
<p>This approach actually made me remove some of the issues I had entered, and made me alter some others. Someone who looks at a feature should now be able to figure out a lot based on these four simple sentences.</p>
<h3><br /></h3>
<h3>Conclusion</h3>
<p>While the app in itself has not really evolved a lot, the way we approached it now has; this is what Agile/Lean is all about to me: provide business value in small incremental steps, reducing waste/being efficient as much as you can. I am rather curious to know what the next step will be in this project !!!</p>
<p>&nbsp;</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
