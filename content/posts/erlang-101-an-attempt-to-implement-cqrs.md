---
layout: post
date: "2012-10-05"
slug: "erlang-101-an-attempt-to-implement-cqrs"
title: 'Erlang 101: an attempt to implement CQRS'
---

<h3>Introduction</h3>
<p>As you might have noticed in<a href="http://www.corebvba.be/blog/post/Getting-started-with-Erlang-and-Nitrogen-(in-a-single-tweet).aspx" target="_blank"> one of my previous posts</a>, I am currently focussing on <a href="http://learnyousomeerlang.com/" target="_blank">Erlang</a>, because I assume that this platform might be the most efficient way <a href="https://github.com/ericmoritz/wsdemo/blob/results-v1/results.md" target="_blank">to handle umphteen connections over the web for now</a>&nbsp;(but that is the subject for another post).</p>
<p>After running my first experiments and getting everything up and running on Windows, I finally decided to stop fighting usage of windows combined with Erlang so I installed myself a <a href="https://www.virtualbox.org/" target="_blank">virtualbox </a>with <a href="http://lxde.org/" target="_blank">Lubuntu LXDE</a> (please note that you have to set the available memory on the virtual appliance to 512MB, or the installation will crash).</p>
<blockquote class="twitter-tweet">
<p>2nd attempt for a virtualbox install of Lubuntu LXDE; aparently the installer crashes with mem != 512MB <a href="https://twitter.com/search/%23LOL">#LOL</a></p>
&mdash; Tom * suǝssuɐſ (@ToJans) <a href="https://twitter.com/ToJans/status/253763997659176961">October 4, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>Before I start implementing what might be my next startup, I tried implementing one of the things that I consider to be my personal kata <a href="https://github.com/ToJans" target="_blank">(I made numerous attempts in .Net</a>): a <a href="http://martinfowler.com/bliki/CQRS.html" target="_blank">CQRS</a> implementation of a simple stock system.</p>
<p>Disclaimer: I am a complete newb in Erlang, so I presume I am still miles away from a more elegant implementation.</p>
<p></p>
<h3>"Show me da Codez!!"</h3>
<p>Here are the events:</p>
<p>
<script src="https://gist.github.com/3818011.js?file=item.hrl"></script>
</p>
<p>And here is the code (including unit tests)</p>
<p>
<script src="https://gist.github.com/3818011.js?file=item.erl"></script>
</p>
<h3>Running this on windows</h3>
<p>In case you would like to test this on windows: install Erlang, and start werl.exe (= Erlang for windows). Download the source and save them in item.erl and item.hrl. Start up the Erlang console perform the following steps:</p>
<p>
<script src="https://gist.github.com/3818011.js?file=console.erl"></script>
</p>
<h3>Afterthoughts</h3>
<p>As usual, I learn new tech by diving in head-first; nevertheless this still looks ugly as hell; a few points where I could improve:</p>
<ul>
<li>Make sure the routing works in a proper way, i.e. spawn one process per id, and make sure the respective commands get sent to the correct AR's, this would allow me to remove the top 4 handle statements filtering out all the ones where the Id does not match the instance's.</li>
<li>Instead of passing in records to <code>handle</code> and <code>on</code> -methods, I could probably shortcut this using a custom behavior, and use some kind of a convention, so I could replace<br /> <code>handle(#state{active=false},#deposit_amount{id=_Id})</code><br /> by something like  <br /><code>handle_deposit_amount(#state{active=false})</code><br /> And the same for events. </li>
<li>Getting to learn Erlang/OTP to the state that it is usable will probably require at least some months, being able to produce "nice" code even longer...</li>
</ul>
<p>All in all this has been a valuable exercise to start with, next on my agenda is trying to build an minimum viable product for yet another start-up idea that crossed my mind.</p>
<p>In closing a message to more experienced Erlangers: feel free to fork the example and show me the proper way to do it!</p>
