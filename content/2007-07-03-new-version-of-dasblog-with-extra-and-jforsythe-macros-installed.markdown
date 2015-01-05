---
layout: post
title: New version of DasBlog with extra and jforsythe macros installed
---

<p>
As you might or might not have noticed, last weekend I upgraded to <a href="http://dasblog.info/dbftp/">newtelligence DasBlog 1.9.7174.0 nightly build</a>, and modified my layout a little bit.<br />
I have also installed the <a href="http://www.vasanth.in/Software.aspx?=dasblogextra">Extra</a> and <a href="http://www.jforsythe.com/jforsythe/proj_dasblog.aspx#tabi_2">jforsythe</a> macro plug ins.
</p>
<p>
Some advantages :
</p>
<ul>
	<li><a href="http://www.gravatar.com">Gravatar</a> support (though it does not seem to work correctly yet) </li>
	<li>Automatic spam comment filtering with <a href="http://akismet.com/">AKSIMET</a>&nbsp; </li>
	<li>Ability to track your comments with <a href="http://www.cocomment.com/">coComment</a> </li>
	<li>Show recent comments </li>
	<li>Show related articles </li>
	<li>Allow paging in category view </li>
	<li>Show next and previous articles </li>
	<li>Track back anti-spam verification </li>
	<li>... and much more</li>
</ul>
<p>
I have also made some modifications to the used templates/site layout.<br />
The whole idea was to improve the usability/click through rate... Let us see if it helps..
</p>
<p>
<a href="http://adwords.google.com/">Google ads</a> are currently still disabled. This version of dasBlog also has a $w(Robots.txt)
</p>
<p>
For the&nbsp;dasBlog users: here are some of the <a href="http://www.jforsythe.com/jforsythe/projects/DasBlogMacros.html">macros</a> used :
</p>
<ul>
	<li>&lt;%RelatedPostList%&gt;&nbsp; </li>
	<li>&lt;%PreviousLink(&quot;&amp;laquo;&amp;nbsp;&quot;,40)%&gt;<br />
	&lt;%PreviousNextSeparator(&quot;|&quot;)%&gt;<br />
	&lt;%NextLink(&quot;&amp;nbsp;&amp;raquo;&quot;,40)%&gt; </li>
	<li>&lt;%NavigatorLinksList()|extra%&gt; </li>
	<li>&lt;%RecentComments(5, 30, 20, 100, 12, true)</li>
</ul>
<p>
If you have any questions, just post them in the comment section.
</p>
<p>
&nbsp;
</p>
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
