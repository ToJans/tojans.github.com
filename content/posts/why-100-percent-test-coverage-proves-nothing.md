---
layout: post
date: "2014-02-26"
slug: "why-100-percent-test-coverage-proves-nothing"
title: "Why 100% test coverage proves nothing"
comments: true
categories: 
---
This is the follow-up to [my previous post](https://tojans.me/blog/2014/02/24/trolling-the-100-percent-tdd-coverage-approach-or-not/).

I wrote an example - obviously badly written on purpose - by which I prove why 100% code coverage is useless.

<blockquote class="twitter-tweet" lang="nl"><p><a href="https://twitter.com/ToJans">@ToJans</a> �testing can be used very effectively to show the presence of bugs but never to show their absence� <a href="https://t.co/l9FujorBfo">https://t.co/l9FujorBfo</a></p>&mdash; ? Michel Rijnders (@mrijn) <a href="https://twitter.com/mrijn/statuses/438667338590982144">26 februari 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

While these tests cover 100%, they miss a test case that I added in the comments on the bottom.

<script src="https://gist.github.com/ToJans/9228503.js"></script>
