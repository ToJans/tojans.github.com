---
layout: post
date: "2012-03-19"
slug: "project-yakshayqrs-another-cqrs-evolution"
title: 'Project YakShayQRS : another CQRS evolution'
---

<h3>Introduction</h3>
<p>TL;DR: I managed to minimize the CQRS overhead even further.</p>
<p>Over the years, I have been trying to minimize <a href="https://www.corebvba.be/blog/?tag=/CQRS">CQRS in several iterations</a>, even releasing a framework and a lib in doing so. Yet, I have still not been satisfied by the approach I reached. This time I once again am pretty satisfied with the way things turned out, and they actually seem to require even way less overhead...</p>
<h3><br /></h3>
<h3>How it works</h3>
<p>The concept is quite simple: I use a generic message class to implement messaging. Next to this I use the virtual keyword:</p>
<p>&nbsp;</p>
<ul>
<li>A class can contain virtual properties; these properties define the unique key of the instance. (f.e. an "Account" class has a "protected virtual string AccountId {get;set;}").</li>
<li>When invoking a message on a class type, an instance is loaded where the unique key is loaded based on the match between the message parameters and the classes' virtual properties. A message only gets invoked if it contains all the virtual properties from the class.</li>
<li>In order to alter state, one should use a virtual method.</li>
<li>One can only send messages targetting non-virtual methods to a class instance.</li>
<li>Non-virtual methods should never alter state, but instead call a virtual method that alters the state...</li>
<li>When rebuilding state based on past events, only the messages targetting the virtual methods are invoked to rebuild the state; no messages are emitted.</li>
</ul>
<div>The advantage: all the wiring is convention-based; and once you get it it is quite easy: altering state should only happen through virtual methods, but these virtual methods should never contain any logic and just alter state or do nothing. The intercepted call to the virtual method gets emitted and gets processed by any non-virtual methods in other classes (if the message matches the classes' key).</div>
<div><br /></div>
<div></div>
<h3>Maybe an example can make it more clear</h3>
<p>&nbsp;</p>
<p>
<script src="https://gist.github.com/2126696.js"></script>
</p>
<p>As usual, the full source can be found <a href="https://github.com/ToJans/YakShayQRS/tree/RinatMode" target="_blank">over at github</a>.</p>
<h3>Conclusion</h3>
<p>This is yet another evolutionary approach to CQRS, and it feels pretty neat (event though the same things applied to the previous versions. Let me know what you think !</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
