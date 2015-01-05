---
layout: post
title: ! 'Scritchy: CQRS without plumbing - a preview'
---

<h3>Introduction</h3>
<p><a href="http://martinfowler.com/bliki/CQRS.html">CQRS</a> is one of my architectural pet peeves, as you might have noticed<a href="http://www.corebvba.be/blog/?tag=/CQRS"> from the numerous amount of blog posts I made on this subject</a>. However, I noticed the concept is complicated and hard to grasp for newcomers to CQRS. I have been spiking numerous attempts of a framework that makes CQRS both more manageable and understandable, failed hundreds of times, and even published a few of my acceptable attempts as gists <a href="https://github.com/tojans">over at github</a>...</p>
<p>A few days ago I was messing around with <a href="http://www.hanselman.com/blog/AsynchronousScalableWebApplicationsWithRealtimePersistentLongrunningConnectionsWithSignalR.aspx" target="_blank">SignalR</a> trying to setup again another CQRS attempt, and failed miserably.... However, 2 nights after that approach I had an ephiphany which had been lingering around in my head ever since.</p>
<p>Today I decided to get back to business, so this afternoon I started spiking a proof of concept (POC).</p>
<p>I think you will be happy to see that I managed to get most of the annoyance out of CQRS with this simple concept.</p>
<p></p>
<h3>Show me the codez !!!</h3>
<p>Before I show you the codes, I would like to mention a few things, since it is a POC:</p>
<ul>
<li>My eventstore is currently implemented as a List of objects. While this works for this concept, you can imagine that this might get you into trouble</li>
<li>The Aggregate roots get completely rebuilt every single time (no cache), so the app might get a litlle bit slow when you push numerous commands to it</li>
<li>The concept is completely synchronous, but making it asynchronous should be effortless.</li>
<li>The functionality I talked about in these 3 points are currently implemented as overrides of the abstract class ScratchBus, which requires you to override the function to load an ar, and to replay events on an object. As there are some nice alternatives available, I am not planning on reimplementing them, but for now I opt for <a href="http://www.corebvba.be/blog/post/Continuous-thinking-just-ship-it-the-story-of-NerdBeers.aspx">the simplest thing that could possibly work</a>.</li>
<li><span style="text-decoration: line-through;">I am currently still thinking about conventions for the viewmodels as these conventions need to provide more flexibiltity then just EVENT/AR.ID binding... I am not sure whether I will find an acceptable solution on that matter...</span>&nbsp;<strong>Update:</strong> KISS as usual, view instances are built/modified by stateless handlers; piece of cake !</li>
</ul>
<div>Anyway, enough stalling, here we go:</div>
<p>
<script src="https://gist.github.com/1304066.js"></script>
</p>
<p>This is the only code required to get a fully working AR with events... IMO it looks pretty clean. As you might have guessed there are some conventions used in order to get the plumbing out of the way.</p>
<p>What do you think ? Pretty clean I would assume ?</p>
<h3>Sold! Where can I get it ?</h3>
<p><span style="text-decoration: line-through;">Depending on the feedback I get, I might push it online <a href="https://github.com/tojans" target="_blank">over at my github account</a>, but for now, I would rather try to find a good solution for the viewmodel/event conventions</span>.</p>
<p><strong>Update:</strong> I published the sourcecode <a href="https://github.com/ToJans/Scritchy" target="_blank">over at my github account</a>.</p>
<p><strong>Update 2:</strong> Whenever I push the source to github, the <a href="http://scritchyexample.apphb.com/" target="_blank">demo at appharbor</a> gets updated as well automagically.</p>
<p>Feel free to PM me any time (or tweet; <a href="http://twitter.com/#/tojans" target="_blank">@tojans</a> )...</p>
<h3>Conclusion</h3>
<p>While this is still a work in progress, and nowhere near ready for production usage, I think this might actually be a pretty cool implementation. If I can somehow find a way to complete this framework, I think I might be on to something here.</p>
<p>I am aware that CQRS is considered to complicated by some, and I am aware that some experts advise against the usage of CQRS in most cases.&nbsp;However, it is my opinion that CQRS provides you with a proper template for development, where everything is nicely separated the way it is supposed to be, and easily adjustable. Another motivation for the CQRS approach is the spaghetti-code of the nillies, currently also known as lasagna-code: numerous amounts of layers over layers that make adding a simple field to a screen a few days of work.</p>
<p>By providing Scritchy, I am trying to find a way to make CQRS not only working, but also relatively easy to use and understand.</p>
<p>This is not the end, but the beginning of a new path...</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
