---
layout: post
date: "2010-04-12"
slug: "major-update-for-mvcextensions"
title: Major update for MvcExtensions
---

<p>It has been a while, but I finally managed to push a major upgrade to MvcExtensions; this is the change list:</p>
<p>&nbsp;&nbsp;&nbsp; * Upgraded spark for MVC RC2<br />&nbsp;&nbsp;&nbsp; + Extra string operators for MyText<br />&nbsp;&nbsp;&nbsp; + Added abstract model for Joe Celko's NestedSet<br />&nbsp;&nbsp;&nbsp; + Added Dynamic SQL (text sorts etc)<br />&nbsp;&nbsp;&nbsp; + Added HttpContextBoundObject<br />&nbsp;&nbsp;&nbsp; * Improved &amp; extended FluentNhibernate/Database<br />&nbsp;&nbsp;&nbsp; + Added Fluentnhibernate TextAlteration for mytext field length in db<br />&nbsp;&nbsp;&nbsp; * Improved SetCultureLanguageAttribute<br />&nbsp;&nbsp;&nbsp; + Added a class SetCultureHelper for temporary changing language<br />&nbsp;&nbsp;&nbsp; + Added IEnumerableHelper extensions for Page &amp; Paging<br />&nbsp;&nbsp;&nbsp; + Added helper for building jQuery jqGrid models<br />&nbsp;&nbsp;&nbsp; * Bugfixed MyTextModelBinder<br />&nbsp;&nbsp;&nbsp; * Improved MvcExtensionsModule</p>
<p>This application framework has allready been used for 2 custom customer applications, and I have to say that it made my development quite successfull.</p>
<p>I have to admit that the documentation is still lacking a lot, but there is a sample project included.</p>
<p>As always, you can download the code here :</p>
<p><a href="http://github.com/ToJans/MVCExtensions" target="_blank">http://github.com/ToJans/MVCExtensions</a></p>
<p>&nbsp;</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
