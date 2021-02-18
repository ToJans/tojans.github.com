---
layout: post
date: "2011-11-15"
slug: "pragmatic-cqrs-verifying-username-uniqueness-when-registering-a-new-user"
title: 'Pragmatic CQRS: Verifying username uniqueness when registering a new user'
---

<h3>Introduction</h3>
<p>Most people who get started with CQRS have issues with this classical example: "how do we verify username uniqueness when a new user registers ?".</p>
<p>While user authentication is something that has been implemented numerous amounts of times before, and one should usually not reinvent the wheel but use an existing software library for this particular case, the problem in itself is rather interesting, and happens quite a lot in a domain.</p>
<p>
<script src="https://gist.github.com/1366502.js?file=00%20Old%20specs.txt"></script>
</p>
<p>In this small article I will show you a simple proper way to resolve the issue respecting CQRS/DDD principles.</p>
<p></p>
<h3><br /></h3>
<h3>Is that really what we want ?</h3>
<p>Let us think about another way to solve the issue. I will rewrite the scenario a little bit:</p>
<p>
<script src="https://gist.github.com/1366502.js?file=01%20New%20specs.txt%20"></script>
</p>
<h3><br /></h3>
<h3>Great, now we have a pending registration ! How is that helpful ?</h3>
<p>Not so quick! I have a rule of thumb: whenever I have to communicate between different AR's (even the ones of the same AR type), I use a saga. What is uniqueness validation when you think about it ? Exactly !! A question to all the other AR's whether an entity with the same properties exists. So let us have a second scenario for the saga:</p>
<p>
<script src="https://gist.github.com/1366502.js?file=03%20The%20saga%20specs"></script>
</p>
<p>Please note that scenario's for sagas are a little different:</p>
<p>
<script src="https://gist.github.com/1366502.js?file=04%20Saga%20specs%20template"></script>
</p>
<h3><br /></h3>
<h3>Example code</h3>
<p>
<script src="https://gist.github.com/1366502.js?file=05%20Example%20saga.cs"></script>
</p>
<h3><br /></h3>
<h3>Conclusion</h3>
<p>There you have it, a simple and elegant solution to a problem everybody struggles with in the beginning.</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
