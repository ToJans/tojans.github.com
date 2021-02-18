---
layout: post
date: "2013-12-20"
slug: "towards-a-more-elegant-fizzbuzz"
title: "towards a more elegant fizzbuzz"
comments: true
categories: 
---

This morning I saw this tweet:
<blockquote class="twitter-tweet" lang="nl"><p>blogged: Clojure Kata #1 � Fizz Buzz <a href="https://t.co/kdZvqjzkRa">https://t.co/kdZvqjzkRa</a></p>&mdash; JanVanRyswyck (@JanVanRyswyck) <a href="https://twitter.com/JanVanRyswyck/statuses/413776508927635457">19 december 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

As Jan is learning [Clojure](https://clojure.org/), he was exploring the [fizzbuzz code kata](https://rosettacode.org/wiki/FizzBuzz). 

I have seen this kata being performed in a lot of languages, and the functional solutions I have seen always feel a bit imperative, so I tried to make a more elegant - functional - version in a language I am currently learning: [Haskell](https://www.haskell.org/); this is the result:

<script src="https://gist.github.com/ToJans/8051807.js"></script>

I like it; but what do you think? Please comment.

### Update
 
So, after tweeting about this post, I received this reply:

 <blockquote class="twitter-tweet" lang="nl"><p><a href="https://twitter.com/ToJans">@ToJans</a> <a href="https://twitter.com/JanVanRyswyck">@JanVanRyswyck</a> FIzzBuzz in a Tweet <a href="https://twitter.com/search?q=%23kotlin&amp;src=hash">#kotlin</a> <a href="https://t.co/pvFFrXD6TD">https://t.co/pvFFrXD6TD</a> :)</p>&mdash; Hadi Hariri (@hhariri) <a href="https://twitter.com/hhariri/statuses/413955432151920640">20 december 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Which is apparently about this:
<blockquote class="twitter-tweet" lang="nl"><p>(1..100).forEach{println(when{it%15&lt;1-&gt;&quot;FizzBuzz&quot;;it%3&lt;1-&gt;&quot;Fizz&quot;;it%5&lt;1-&gt;&quot;Buzz&quot;;else-&gt;it})}?<a href="https://twitter.com/search?q=%23Kotlin&amp;src=hash">#Kotlin</a></p>&mdash; Ziphil :: Antithesis (@Ziphil_) <a href="https://twitter.com/Ziphil_/statuses/412781812113354752">17 december 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

So I decided to sacrifice readability, and see how far I could get:

<blockquote class="twitter-tweet" lang="nl"><p>zipWith max(map show[1..100])(zipWith(++)(cycle[&quot;&quot;,&quot;&quot;,&quot;fizz&quot;])(cycle[&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;buzz&quot;]))&#10;<a href="https://twitter.com/search?q=%23FizzBuzz91CharsHaskell&amp;src=hash">#FizzBuzz91CharsHaskell</a>&#10;<a href="https://twitter.com/hhariri">@hhariri</a> <a href="https://twitter.com/JanVanRyswyck">@JanVanRyswyck</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/413960880951263232">20 december 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

91 Characters! Not bad, but utterly unreadable... So, while it is a good exercise to try to reduce the code to an absolute minimum, this should only be for learning purposes...
