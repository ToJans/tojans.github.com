---
layout: post
date: "2013-03-17"
slug: "fixing-corrupt-downloads-with-your-isp"
title: Fixing corrupt downloads with your ISP
comments: true
sharing: true
footer: true
---

<p>About 3 days ago my internet connection with telenet started being really slow, and gave me corrupted downloads if files were larger then a few megabytes. Every file I tried to download gave me corrupt files.</p>
<p>As this problem appeared on 4 different PC's simultaneously, I knew the problem was not related to a specific PC configuration.</p>
<p>As one of my PC's was wired (through a router), and that one was not working either, I decided to shortcut the router, and connect directly to the telenet router (without my own router), and that seemed to work.</p>
<p>So the problem had to be located within my router. After checking the logs and upgrading the firmware, the issue still remained, so I started looking around on the net.</p>
<p>After some browsing I found the cause of my connection problems; apparently <span style="text-decoration: line-through;">telenet lowered the MTU</span>? <strong>UPDATE:</strong> lowering my MTU might work...</p>
<h3>What's MTU?</h3>
<p>This would bring us down to networking, and layer 2, the data layer, but I assume wikipedia can explain it way better (<a href="https://en.wikipedia.org/wiki/MTU" target="_blank">here</a>).</p>
<p>What it comes down to is that large packages on the network fail, so you need to find out how large your packages can be when you send them over the network.</p>
<h3>How can you do this?</h3>
<p>First of all you have to find out your MTU setting of your router; it's probably at 1500 for cable or 1492 for DSL. Next you have to find the size that works with your provider. For now I settled on a size of 1200.</p>
<p>You can find out this size by doing the following (min is at 500-something AFAIK):</p>
<p>start a command window and start pinging with a packet that can not be separated (IPv4 only, BTW):</p>
<p><img src="/images/archive/corebvba/2013%2f3%2fSchermafbeelding+(2).png" alt="" /></p>
<p>You get the picture I presume.</p>
<p>After finding the matching packet size, you should set the MTU in your router to your value; problem solved...</p>
<h3>Update:&nbsp;</h3>
<p>While my big downloads now are fixed, @dvaneven mentioned his internet with the same provider still worked on MTU 1500, so I think I probably might need to replace my router.</p>
<blockquote class="twitter-tweet" lang="nl">
<p>@<a href="https://twitter.com/tojans">tojans</a> @<a href="https://twitter.com/telenet">telenet</a> Why would they lower the MTU?</p>
&mdash; Dave Van Even (@dvaneven) <a href="https://twitter.com/dvaneven/status/313271752220356608">17 maart 2013</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>For now my workaround works, but I will buy another router ASAP.</p>
<h3>Update 2:</h3>
<p>I installed another router... problem solved !!</p>
