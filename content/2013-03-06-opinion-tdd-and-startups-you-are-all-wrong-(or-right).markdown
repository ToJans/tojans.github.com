---
layout: post
title: ! 'Opinion: TDD and startups - you are all wrong (or right)'
comments: true
sharing: true
footer: true
---

<h3>Introduction</h3>
<p>There has been a lot of buzz lately about <a href="http://blog.8thlight.com/uncle-bob/2013/03/05/TheStartUpTrap.html" target="_blank">a post of Uncle Bob Martin</a>, who claims that skipping Test-driven design is the worst mistake you can make when in a startup. This generated a lot of yay-and-nays on the twitter sphere, with mostly black and white opinions. I think they might all be right, but miss one important distinction: you always need to formalize what you are working on...</p>
<h3>"So what" - Miles Davis</h3>
<p>In my opinion, you need something to drive your behavior of your app, or as you put it in the context of startups, you need something to drive your search for a market fit. So while TDD might provide you "better" code in the end, it is not the code that matters, it is the behavior of the code that is all important. TDD for a startup should help you to reason about that behavior, i.e. what exactly are you trying to achieve.</p>
<p style="text-align: left; padding-left: 30px;"><strong><em>Defining in an explicit way what (and even why) you are going to do something before you do it, allows you to:</em></strong></p>
<ul>
<li><strong><em>focus on your task</em></strong></li>
<li><strong><em>define scope</em></strong></li>
<li><strong><em>reason about it in a strategic way</em></strong></li>
</ul>
<p>If you are able to reason about what you are about to do in another way, please feel free. I can think of at least 5 ways to define what you are doing:</p>
<ul>
<li>An explicit analysis document</li>
<li><a href="http://en.wikipedia.org/wiki/Literate_programming" target="_blank">Literate programming</a></li>
<li><a href="http://en.wikipedia.org/wiki/Test-driven_development" target="_blank">TDD</a></li>
<li>BDD (<a href="http://en.wikipedia.org/wiki/Behavior-driven_development" target="_blank">behavior-</a>&nbsp;and <a href="http://en.wikipedia.org/wiki/Business-driven_development" target="_blank">business</a>-)</li>
<li>Interface-driven design, the top down approach (although this is probably one of the lesser approaches)</li>
<li>...</li>
</ul>
<div><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f3%2fCunningplan.jpg" alt="" /></div>
<div><br /></div>
<div>So, whatever comes naturally to you might be the best fit. The most important thing is making something explicit (aka "ze cunning plan"), as I have found out multiple times in the past: without a proper plan to support your vision, you are doomed to wander around in eternity, as you never have a proper definition of done and/or scope, or even priorities...</div>
<div><br /></div>
<div>As a developer, the best fit for me is usually some kind of a bastardized combo of all the techniques mentioned above, even combined with some <a href="http://impactmapping.org/">impact mapping</a> or other <a href="http://en.wikipedia.org/wiki/Domain-driven_design" target="_blank">DDD </a>techniques...</div>
<div><br /></div>
<div>On a sidenote: currently halfway into <a href="http://www.amazon.com/Implementing-Domain-Driven-Design-Vaughn-Vernon/dp/0321834577" target="_blank">Vaughn's IDDD book</a>, and this proves to be very helpfull as well, it's like <a href="http://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215/ref=bxgy_cc_b_img_b/185-2294219-9118450" target="_blank">Eric Evan's blue book</a>, but written in a more accessible and pleasant way...</div>
<div><br /></div>
<h3>Conclusion</h3>
<p>So in the end, what it all comes down to, is that you need a formal/explicit spec about what you are working on, whether that is a design doc, some unit tests or something else, does not really mather; just find out whatever fits your methods best.</p>