---
layout: post
date: "2011-11-28"
slug: "continuous-thinking-cqrs-explained-to-a-10-year-old"
title: 'Continuous thinking: CQRS explained to a 10-year old'
categories: ["Development", "DDD"]
---

<h3>Introduction</h3>
<p>The concept behind CQRS is neat: detach your domain implementation completely from your representation requirements. I even wrote a framework for it&nbsp;as a learning tool, so somebody without any prior experience should be able to boot a CQRS app in a few minutes.</p>
<p>The main idea behind this framework is providing developers new to CQRS an operating room where they can compose their own little<a href="https://youtu.be/xos2MnVxe-c" target="_blank"> CQRS Frankenstein app</a>.</p>
<p>The whole framework is constructed in a way that it forces you to make your domain implementation completely persistence ignorant, respecting typical AR/transactional boundaries.</p>
<p><a href="https://github.com/ToJans/Scritchy/wiki" target="_blank">Scritchy</a> is not "the framework to write CQRS apps"; Scritchy is a framework that tries to provide you a learning platform where you can start grasping the basic principles, advantages and disadvantages in using CQRS.</p>
<p>Once you understand the basic principles behind the CQRS setup, and why everything is setup the way it is, I would advise anybody to gradually replace parts of the framework and just opt for whatever approach you like, using proper message busses, pub/sub/...&nbsp;</p>
<p>If you write your app following the conventions Scritchy dictates, the only thing you need to change to remove the Scritchy dependency is the base object your Aggregate Root inherits from; that is the only dependency that is ever necessary in you app implementation. This was by design,to make future migrations as easy as possible.</p>
<p>I wrote this framework to enable a dev new to CQRS to get his app up and running in a few minutes... But apparently that is not enough....</p>
<p></p>
<p>&nbsp;</p>
<h3>Once upon a time at a certain newsgroup...</h3>
<p>There has been <a href="https://groups.google.com/forum/#!topic/dddcqrs/cSgPPgMFEq8" target="_blank">a huge discussion over at the CQRS newsgroup about whether a CQRS framework has a "raison d'&ecirc;tre"</a>. I think it has, as a learning tool, some disagree; I'm fine with that:</p>
<p><a href="https://xkcd.com/386/" target="_blank"><img src="https://imgs.xkcd.com/comics/duty_calls.png" alt="XKCD: duty calls" /></a></p>
<p>What I find really odd however, is that white coats are now starting to draw <a href="https://groups.google.com/forum/#!topic/dddcqrs/XAq0lCyLDs4" target="_blank">"MetaSchema's"</a> or whatever the **** they call them, complicating and abstracting a very simple concept even more then necessary.</p>
<p>As an answer to that<a href="https://github.com/ToJans/MinimalisticCQRS/blob/master/MinimalisticCQRS/MiniCQRS.cs" target="_blank"> I wrapped up a basic app in a few hours which demonstrated about what I think CQRS is in it's core concept</a>, i.e. make a CQRS app as simple as possible, only abstracting what you absolutely have to...</p>
<p>This is the answer I got:</p>
<pre><span style="color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: 13px;">It is unfortunate that people learn programming without meeting the basic tenets of structured programming.&nbsp;
</span><span style="color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: 13px;">Programming with procedures (your commands and queries) has been here form more then 30 decades,&nbsp;
</span><span style="color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: 13px;">some are commands other are queries. CQS is usually applied here too!</span></pre>
<p>ROFL !! Talk about missing the point!! Anyway, after all these fruitless attempts I decided to invest my time in some things more productive and get away from all these semantic meta-level blahblahblah....</p>
<p>&nbsp;</p>
<h3>CQRS - the essence IMO - how would you explain it to a 10-year old ?</h3>
<p>All those neat diagrams perfectly aligned and perfectly abstracting away everything in CQRS usually give me the shivers, which is why I started writing this article in the first place. I think<a href="https://codeofrob.com/archive/2011/09/28/cqrs-is-too-complicated" target="_blank"> Rob Ashton's article was a great attempt</a>, but still a bit to complicated.</p>
<p>One of <a href="https://www.linkedin.com/in/tomjanssens" target="_blank">my current occupations as an ICT generalist is giving strategic ICT advice</a>. Every time we talk about customer interaction/transfering your intent to your customers, I suggest them to interact with their customers as if they were 10-year-olds as an exercise, in order to get to the essence of their intent... So I decided to dogfood this approach, and here is my attempt to explain CQRS to my 10-year-old audience:</p>
<p>&nbsp;</p>
<p><img src="/images/archive/corebvba/2011%2f11%2fCQRS10YO.png" alt="" /></p>
<p>&nbsp;</p>
<p>That is all there is to CQRS IMO, nothing more, nothing less.</p>
<p>(For all the font freaks, the typeface used in this graph is MouseDrawn&trade;, which will be available for ordering soon, SRP 10K&euro; ;) ).</p>
<p>&nbsp;</p>
<h3>Conclusion</h3>
<p>CQRS is a neat concept, and applying it <a href="/posts/My-CQRS-Cookbook/">gives you all kinds of advantages</a>... But there is no need to make it more complicated then it is; in essence it is just about separating your domain implementation from your UI representation, nothing more, nothin less.&nbsp;</p>
<p>I feel a lot of people are getting confused when they try to get started with CQRS. There is no need to; just separate your UI/domain implementation and UI representation.</p>
<p>People interested in the absolute minimum required to do CQRS, I suggest to take a look <a href="https://github.com/ToJans/MinimalisticCQRS/blob/master/MinimalisticCQRS/MiniCQRS.cs" target="_blank">at my example app over at github</a>. I would advise <a href="https://github.com/ToJans/Scritchy" target="_blank">Scritchy to people who want to experiment with CQRS for the first time and want a proper app architecture</a>&nbsp;(<a href="https://nuget.org/List/Packages/Scritchy" target="_blank">nuget available</a>). For others - the more experienced people - I suggest you opt for whatever you think is appropriate, as CQRS is not about components, it is about a concept.</p>
<p>&nbsp;</p>
<p>&nbsp;</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
