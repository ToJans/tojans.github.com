---
layout: post
date: "2012-06-14"
slug: "from-the-trenches-improving-scalability-in-.net-for-paycento"
title: From the trenches - improving scalability in .Net for Paycento
---

<h3>Introduction</h3>
<p>As most of you might know, I am currently in the process of improving the scalability of the <a href="http://www.paycento.com/" target="_blank">Paycento </a>backend..</p>
<p>As a real lean adept, the idea is to optimize where it hurts... As the creator of Node.js pointed out perfectly, the biggest pain is in the disk/network access etc.. Blocking threads hurt bigtime... So I started searching for easy low-cost optimizations that would not require to much effort....</p>
<p>
<object width="640" height="360">
<param name="movie" value="http://www.youtube.com/v/M-sc73Y-zQA?version=3&amp;hl=nl_NL" />
<param name="allowFullScreen" value="true" />
<param name="allowscriptaccess" value="always" /><embed type="application/x-shockwave-flash" width="640" height="360" src="http://www.youtube.com/v/M-sc73Y-zQA?version=3&amp;hl=nl_NL" allowscriptaccess="always" allowfullscreen="true"></embed>
</object>
</p>
<p>&nbsp;</p>
<h3>Before we begin: Phase 0 - measuring=knowing; ask Heracles</h3>
<p></p>
<p>&nbsp;</p>
<p>I spent a big part of last month coding a command line app called "Heracles", which is some kind of a helper app. It supports the following commands:</p>
<ul>
<li>checkout : downloads source and all solutions from SVN and puts them in the folders following our convention</li>
<li>build: builds all the source and publishes it to the publish &amp; publishweb folders</li>
<li>db: we have a "db drop xxx" and a "db restore xxx", which downloads a backup from our ref db from the web and restores it in SQL Express..</li>
<li>install: this is a simple wrapper that invokes chocolatey or downloads installer packages from the web, so we all have the same dev environment. "Heracles install *" is all one needs to have all the required prerequisites</li>
<li>performancetest: restores the db, fires up the api WCF service with this db, fires up memcached and then runs all integration tests that have the category "integration" and "speed". (simple MStest invoke, capturing relevant output). We redirect trace output to the console and append performance output in logs, so we have a log that contains every single performance test we ran....</li>
</ul>
<div style="text-align: left; ">This tool allows us to effectively measure our code adjustments in a few minutes, using two simple commands ("heracles build" and "heracles performancetest").</div>
<div>This implies we can measure if our effort is actually resulting in some real improvements...</div>
<p>&nbsp;</p>
<h3>First things first: Caching</h3>
<p>The easiest way to speed up network/disk access, is simply avoiding it, so I started with caching the part that requires scalability...</p>
<p>Caching is an essential part of scalable websites, and there is no need to reinvent the wheel here... I started of with a simple static in-memory dictionary to verify my hunches, and then I started considering established options...&nbsp;After some reading up between different caching solutions, I found it hard to decide which option to select, but luckily I found the wonderfull <a href="http://www.nuget.org/packages/Glav.CacheAdapter" target="_blank">CacheAdapter written and maintained by Paul Glavich</a>. It allows you to switch between different caching types by altering web/app.config. The current cache options are:</p>
<ul>
<li>No cache</li>
<li>.Net 4.0 ObjectCache</li>
<li>Asp.Net Cache</li>
<li>Appfabric cache</li>
<li>Memcached</li>
</ul>
<p>This improved performance bigtime wiithout a lot of effort.</p>
<p>&nbsp;</p>
<h3>Up next: blocking IO requests hurt bigtime</h3>
<p>After considering the option to convert our WCF service into an async one (way to much effort for now), I discovered that one can easily improve performance of parallel requests by replacing simple calls with their async counterpart and just wait for them to complete...</p>
<p>I wrote a simple benchmark to download my homepage 20 times using async &amp; sync approaches, and the results were unbelievable:</p>
<p><strong><em>The async method was 28 times faster then the sync method...</em></strong></p>
<p>How does it work ?</p>
<p>It is actually quite simple; I wrote a little helper function in a static class called Wait.Async. Here is the complete sample code with the stats included, let us take a look first:</p>
<p>
<script src="https://gist.github.com/2929935.js?file=asynctest.cs"></script>
</p>
<p>So, the code is really simple; I simple wait for the ResetEvent to be set... As this is quite repetetive code I wrote a little helper for it...</p>
<p>&nbsp;</p>
<h3>Can we use it to optimize database access ? Even Linq2SQL ?</h3>
<p>It is a little hackerisch for LinqToSQL and it has its limitations for the queries, but it is actually quite easy to do so... As we are a big fan of the community and like to give back, we offer you the code we use to improve LinqToSQL scalability.</p>
<p>&nbsp;</p>
<p>
<script src="https://gist.github.com/2929935.js?file=Paycento.API.Tasks.cs"></script>
</p>
<p>Unfortunately non-selects are AFAIK (close to) impossible to make async, so we currently simply opt to update the cached values directly and process the SQL on a background thread...</p>
<p>&nbsp;</p>
<h3>What's up next ?</h3>
<p>For now, we have the tools and options in place to start optimizing the code... We applied the principles to 2 execution paths that require performance, and reached our initial performance goal. So now we need to optimize other paths as well. As my pseudo-fulltime consultancy period for Paycento is about to end next week, I can only assume it will be quite a busy week.. Fortunately, I will still be a member of the Paycento team, even though it will (for now) be more on an ad-hoc basis...</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
