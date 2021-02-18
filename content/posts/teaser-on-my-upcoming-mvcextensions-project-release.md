---
layout: post
date: "2010-01-18"
slug: "teaser-on-my-upcoming-mvcextensions-project-release"
title: Teaser on my upcoming mvcextensions project release
---

<p>Hi there,</p>
<p>I am going to give you a quick teaser on how to setup a full asp.net mvc application with database &amp; all the rest using my soon-to-be-updated MVCExtensions library.</p>
<p></p>
<p>Take the following steps :</p>
<ol>
<li>Create a new asp.net MVC project</li>
<li>Add a reference to the MVCExtensions DLL and it's dependencies</li>
<li>Create your model <br />
<script src="http://gist.github.com/280330.js?file=Task.cs"></script>
</li>
<li>Create your database mappings <br />
<script src="http://gist.github.com/280330.js?file=TaskDatabaseFluentMapping.cs"></script>
</li>
<li>Create your viewmodels<br />
<script src="http://gist.github.com/280330.js?file=VMIndex.cs"></script>
<script src="http://gist.github.com/280330.js?file=VMEdit.cs"></script>
</li>
<li>Create your views<br />
<script src="http://gist.github.com/280330.js?file=application.spark.html"></script>
<script src="http://gist.github.com/280330.js?file=index.spark.html"></script>
<script src="http://gist.github.com/280330.js?file=edit.spark.html"></script>
</li>
<li>Create your controller<br />
<script src="http://gist.github.com/280330.js?file=HomeController.cs"></script>
</li>
<li>Create your custom childcontainer for the homecontroller<br />
<script src="http://gist.github.com/280330.js?file=homecontainer.cs"></script>
</li>
<li>Wire up everything in global.asax
<script src="http://gist.github.com/280330.js?file=AAAA_global.asax.cs"></script>
</li>
</ol>
<p>That is all there is to it; you now have a fully functional ASP.Net MVC application that  uses Castle.Windsor IOC/Automapper/Spark viewengine with al_a and al_form support !!!</p>
<p>I still have a few things to finish first (namely the string1024 and memofields need custom Modelbinders in order to mimic a string type), but as soon as I implemented those I can push everything to <a href="http://github.com/ToJans/MVCExtensions"> this github repository</a></p>
<p>Enjoy !!</p>
<p>&nbsp;</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
