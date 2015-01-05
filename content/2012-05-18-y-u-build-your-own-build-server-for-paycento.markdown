---
layout: post
title: Y U build your own build server for Paycento
---

<h3>Introduction</h3>
<p>As you might now <a href="http://www.corebvba.be/blog/post/It-is-official-on-the-second-of-May-I-will-join-the-start-up-Paycento.aspx">I started working quite recently for the startup Paycento</a>. One of the things I am currently doing is setting up a system that allows us to do continuous integration and deployment everywhere and anywhere...</p>
<blockquote class="twitter-tweet">
<p>@<a href="https://twitter.com/ToJans">ToJans</a> Why write &amp; maintain it if someone already solved the problem? (assuming something solves it). Spend time on competitive adv :)</p>
&mdash; Simon Guindon (@simongui) <a href="https://twitter.com/simongui/status/203554104138670080">May 18, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>As I got into an interesting discussion with Simon Guindon on twitter about the choice between a custom tool and an existing one like <a href="http://www.cruisecontrolnet.org/" target="_blank">CruiseControl.Net</a> for example, he suggested me to write a blog post about it. So here it is...</p>
<h3>You are suffering from the NIH (Not-Invented-Here) - syndrome!!</h3>
<p>So what! I get paid to write code, so I should not care what I write... or not ?</p>
<p>As a startup we have to make sure that everything we do provides business value, so why would one go to all this trouble to write his own CI/deployment system, if there are existing things available ?</p>
<p></p>
<p>Well, my friend, the argument is simple: as a startup, we have limited resources, and those do not include somebody who has either the time and the expertise to setup a full blown CI configuration. We tend to provide our time to features that actually provide value to the business.</p>
<p>By setting up a rudimentary c# app that pulls code from source control, copies some external dependencies and compiles the whole thing using simple MSBuild invokes, we have setup our very own CI server in just about an hour. (Removing and realigning all the dependencies so they matched all the required conventions took me a lot more time, but that is not really the point of discussion here)...</p>
<h3>Well, so you have now got a hard-coded build-package ? What happens if you need to change something ? You need to recompile it ??&nbsp;</h3>
<p>That, my friend, is exactly the idea. The people who will be deploying the app, will be the ones who write the code, so why add another extra layer/language if the target audience are devs anyway ? If deployment needs to be changed, this will have to be done by a coder, as I think the best way to feel responsibility for your changes is by making you the owner...</p>
<p>Will you be carefull when there is no extra layer of security between you and the world; would you be more motivated to add just that extra integration test on a feature you are not a 100% sure about? I am assuming you are, because when you deploy it, it is your responsibility if something goes wrong....</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2012%2f5%2fpower.jpg" alt="" /></p>
<p>This is not a blog post about the why when and how of continuous integration/deployment, but I am assuming you get the picture here...</p>
<h3>What do you think a coder will say when you ask him to change this code ?</h3>
<p>
<script src="https://gist.github.com/2727037.js?file=cruise.xml"></script>
</p>
<p>For the record: <a href="https://github.com/ccnet/CruiseControl.NET/blob/master/ccnet.build" target="_blank">this is the actual source from cruisecontrol.net</a>.</p>
<h3>Here is what the deployment looks like (for now) in our Heracles tool:</h3>
<p>
<script src="https://gist.github.com/2727037.js?file=Program.cs"></script>
</p>
<p>I know which one I would pick...</p>
<h3>Conclusion</h3>
<p>Sometimes it is good to take an existing tool and use it, but when you consider the long-term impact and dependency on such a tool, it might be better to consider your options very carefully before indulging in the next <a href="http://en.wikipedia.org/wiki/No_Silver_Bullet" target="_blank">Silver Bullet</a>. In the end both Simon and I did agree that it is all about balance; the only thing I wanted to point out with this post is that one sometimes has to think before going down that familiar road.</p>
<h3>P.S. 3 extra reasons</h3>
<p>This approach also gives us the possibility that our CI can run anywhere (local/server/cloud), as long as MSBuild and .Net 4.0 are available. Heck, one might even support a *nix tool and support CI over amazon, but I am not going to spend my time right now in finding this out...&nbsp;We simply need to copy the exe and the dependencies, start it up and the rest works by itself... No need to walk through xxx install steps to setup a CI server here...</p>
<p>Another reason is actually even more important: having your integration &amp; deployment tool and configuration under source control really gives you a FULL view of your project's history, especially in cloud-like environments this might be a big plus.</p>
<p>Finally, the last reason is the ease of setup for a new dev; whenever a new dev comes in, he just has to run the Heracles app, and he has all the right files in all the right places... fresh from the repository... and they build...</p>
<p>&nbsp;</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
