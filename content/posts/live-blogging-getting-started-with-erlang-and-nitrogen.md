---
layout: post
date: "2012-09-13"
slug: "live-blogging-getting-started-with-erlang-and-nitrogen"
title: 'Live Blogging: getting started with Erlang and Nitrogen'
---

<h3>Note</h3>
<p>This is an experiment where I try "live blogging": I blog as I get along further in the process... Feel free to comment/tweet during the process...</p>
<blockquote class="twitter-tweet">
<p>Trying a new concept: "Live blogging: getting started with Erlang and Nitrogen" - feel free to comment during the post <a title="/posts/Live-Blogging-getting-started-with-Erlang-and-Nitrogen" href="https://t.co/VlzLeMqt/">corebvba.be/blog/post/Live&hellip;</a></p>
&mdash; Tom * suǝssuɐſ (@ToJans) <a href="https://twitter.com/ToJans/status/246174492982902784">September 13, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>&nbsp;</p>
<h3>Introduction</h3>
<p>As I had yet another idea for a startup, I fired up Visual Studio and started implementing a small demo...</p>
<blockquote class="twitter-tweet">
<p>Flexing my idea muscle; trying to build a POC for another startup idea <a href="https://twitter.com/search/%23startup10">#startup10</a> <a href="https://twitter.com/search/%23ElliottWave">#ElliottWave</a> <a title="https://twitter.com/ToJans/status/243754758123446272/photo/1" href="https://t.co/T6BNnaBY">twitter.com/ToJans/status/&hellip;</a></p>
&mdash; Tom * suǝssuɐſ (@ToJans) <a href="https://twitter.com/ToJans/status/243754758123446272">September 6, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>However, the main feature that would elevate my example requires a lot of interaction, and quite frankly, interaction is a pain in web apps IMO, as there is still a mental shift between frontend and backend. For this particular thing I needed the distance to be as small as possible, so I started searching and found Erlang...</p>
<blockquote class="twitter-tweet">
<p>One more last video before I go to bed <a title="https://vimeo.com/8258045" href="https://t.co/PqJ0zUOF">vimeo.com/8258045</a> <a href="https://twitter.com/search/%23erlang">#erlang</a> <a href="https://twitter.com/search/%23nitrogen">#nitrogen</a> <a href="https://twitter.com/search/%23riak">#riak</a></p>
&mdash; Tom * suǝssuɐſ (@ToJans) <a href="https://twitter.com/ToJans/status/246020043907944448">September 12, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>I will not go into the details why this looks like a perfect match, because I would like to build an MVP first, but I can tell you that it resembles the bee's knees at this current moment to me... So how do I get started? This is a walkthrough where I will post my progress... This post will evolve as I manage to get further....</p>
<p></p>
<h3>Installation</h3>
<p>Well, I still work on windows, so I downloaded the binary erlang package from here:&nbsp;<a href="https://www.erlang-solutions.com/downloads/download-erlang-otp">https://www.erlang-solutions.com/downloads/download-erlang-otp</a></p>
<p>I downloaded the win x64 binary and ran it, as simple as that; mission #1 accomplished; a few more to go.</p>
<p></p>
<h3>The web framework</h3>
<p>Well, I decided to go for nitrogen, as it looks pretty neat IMO, so I created a nitrogen folder and downloaded the windows package from&nbsp;<a href="https://nitrogenproject.com/downloads">https://nitrogenproject.com/downloads</a>&nbsp;and unzipped it.</p>
<p>#2 accomplished</p>
<h3>Hello world</h3>
<p>I copied the whole nitrogen package to a new folder called HelloWorld - how original - opened a cmd window in the folder, and this is what I typed and the result..</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2ferlang-error.png" alt="" /></p>
<p>So I opened up Windows explorer and checked... Aha!</p>
<p>&nbsp;</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2ferlang-folder.png" alt="" /></p>
<p>I copied the bin path, went back to my hello-world folder, right-clicked start.cmd and chose for edit, and assumed replacing 5.7.5 (the Erlang version in the nitrogen package) with 5.9.2 would be enough, but then I noticed: there is also and erts-5.7.5 subfolderfolder in the hello world project, which looks like it contains the whole erlang version...</p>
<p>So I decided to look a bit closer...</p>
<p>When running the commands from the batch file manually with the installed erlang&nbsp; (i.e. the one from c:\program files)&nbsp;I get a crash on the execution of the last line, so it compiles, but refuses to run. So I decide to uninstall erlang, as I assume it is some kind of a version conflict, and I probably do not need the installation anyway.</p>
<p>So I removed the installed Erlang, and also found out I had another (32-bit) version installed, so I removed that one as well...</p>
<p>However, when I try to compile using the following statement I still get an error:</p>
<p>&nbsp;</p>
<pre>C:\blah\nitrogen\helloworld&gt;"erts-5.7.5\bin\erl.exe" -pa %PA% -make<br />Could not load module C:\Program Files\erl5.7.5\erts-5.7.5\bin\erlexec.dll.</pre>
<p>So I decided to go looking for erlang 5.7.5 for windows.... But then it hit me; google to the rescue:&nbsp;<a href="https://groups.google.com/forum/?fromgroups=#!topic/nitrogenweb/0vXvXwLvBOM">https://groups.google.com/forum/?fromgroups=#!topic/nitrogenweb/0vXvXwLvBOM</a></p>
<p>So I should probably reinstall the Erlang binaries I first installed and try to build nitrogen myself...</p>
<p>Let's try again....</p>
<p>Ok, installed the initial erlang version again (had to kill an apparently still running erlang proces).</p>
<p>Now I went looking into a nitrogen tutorial (<a href="https://nitrogenproject.com/doc/tutorial.html">https://nitrogenproject.com/doc/tutorial.html</a>) and pulled in the <a href="https://github.com/nitrogen/nitrogen/zipball/master">nitrogen source code</a> from <a href="https://github.com/nitrogen/nitrogen" target="_blank">github</a>.</p>
<p>I browsed a bit further in the git project, and found <a href="https://github.com/nitrogen/nitrogen/blob/master/rel/overlay/win/README.md" target="_blank">this document</a> mentioned on the readme: "Compiling Nitrogen on Windows"... There they advise to install Erlang for win R15B02 for windows and install it in the folder "<span style="background-color: #f8f8f8; color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; line-height: 19px; white-space: nowrap;">c:\erl5.9</span>", so I installed yet another erlang (5.9.2), but now in the recommended folder, and tried running nitrogen again; here's what happened:</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2ferlang-error2.png" alt="" /></p>
<p>As it still does not work, I assume it is time to try and compile the thing...</p>
<p>So I add&nbsp;<span style="background-color: #f8f8f8; color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; line-height: 19px; white-space: nowrap;">c:\erl5.9\bin</span> to the path in my environment settings.</p>
<p>Now I install<a href="https://code.google.com/p/msysgit/downloads/list?q=netinstall" target="_blank"> msysgit using the netinstaller</a>, <strong>not the regular one</strong>, and install into the default&nbsp;<span style="background-color: #f8f8f8; color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; line-height: 19px; white-space: nowrap;">c:\msysgit</span></p>
<p>You need to use this version, as this downloads the source for git and enables you with a complete mingw build environment, which allows you to build the nitrogen source code as well...</p>
<p>Building git apparently seems to take a few minutes...</p>
<p>... And some more...</p>
<p>And we're finally there!!!&nbsp;</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2fgit-finally.png" alt="" /></p>
<p>Now time to clean up the folders and pull in the sourcecode and build it...</p>
<p>&nbsp;</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2fnitro-pull.png" alt="" /></p>
<p>And we fail again...&nbsp;</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2fnitro-fail.png" alt="" /></p>
<p>So I am now digging into the rebar mailing lists:&nbsp;<a href="https://lists.basho.com/pipermail/rebar_lists.basho.com/2011-September/001074.html">https://lists.basho.com/pipermail/rebar_lists.basho.com/2011-September/001074.html</a></p>
<p>&nbsp;</p>
<p>Aha, found it; I simply have to make sure c:\msysgit\bin is contained in the PATH environment variable; it now fetches all dependencies....</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2fnitro-rebar-ok.png" alt="" /></p>
<p>Crap... Now I get a compile error in nitrogen itself...</p>
<p>&nbsp;</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2fnitro-compilation-fail.png" alt="" /></p>
<p>So I checked to see if there was any Erlang feedback available on twitter...</p>
<blockquote class="twitter-tweet">
<p>Well, the live blogging experiment is certainly a challenge: still not able to run nitrogen on windows <a href="https://twitter.com/search/%23erlang">#erlang</a> <a href="https://twitter.com/search/%23help">#help</a> <a title="/posts/Live-Blogging-getting-started-with-Erlang-and-Nitrogen" href="https://t.co/VlzLeMqt/">corebvba.be/blog/post/Live&hellip;</a></p>
&mdash; Tom * suǝssuɐſ (@ToJans) <a href="https://twitter.com/ToJans/status/246196814615826434">September 13, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>In the mean time I'll start looking at the source over at github; maybe I have a stable branch or similar...</p>
<p>&nbsp;</p>
<p>Aha, I found an open issue regarding the mimetypes library on github, but apparently there's not a lot of response there....&nbsp;<a href="https://github.com/spawngrid/mimetypes/issues/10">https://github.com/spawngrid/mimetypes/issues/10</a></p>
<p>Currently in the process of digging in the source code of the mimetypes lib, and I also received a good tip from Neil:</p>
<blockquote class="twitter-tweet">
<p>@<a href="https://twitter.com/tojans">tojans</a> top tip - buy a mac :)</p>
&mdash; Neil Robbins (@NeilRobbins) <a href="https://twitter.com/NeilRobbins/status/246199358171783168">September 13, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>Ok; I took a small break; looks like the problem is actually in the post_compile script for the mimetypes; currently debugging erlang script!!!&nbsp;</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2fdebugging-escript.png" alt="" /></p>
<p>My understanding of erlang is growing slowly&nbsp;<img title="Cool" src="https://www.corebvba.be/blog/editors/tiny_mce3/plugins/emotions/img/smiley-cool.gif" border="0" alt="Cool" />... Looks like this file just extracts all method definitions, since these have not changed, there is no need to change it, so I just commented the whole enchilada (gist here:&nbsp;<a href="https://gist.github.com/3714046">https://gist.github.com/3714046</a>) et voila, it compiles!</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2fnitro-compiles.png" alt="" /></p>
<h3>AAAAAAAAAAAAAAAAAAAAARGH !&nbsp;</h3>
<p>Still no go; I'll call it a day for today, as I have some other stuff to do as well, and this took way longer then I hoped.... Laters!</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2fnitro-compiles-or-not.png" alt="" /></p>
<blockquote class="twitter-tweet">
<p>Put the Live Blog on hold, as it took to much of my time already... To be continued <a href="https://twitter.com/search/%23erlang">#erlang</a> <a href="https://twitter.com/search/%23nitrogen">#nitrogen</a> <a title="/posts/Live-Blogging-getting-started-with-Erlang-and-Nitrogen" href="https://t.co/VlzLeMqt/">corebvba.be/blog/post/Live&hellip;</a></p>
&mdash; Tom * suǝssuɐſ (@ToJans) <a href="https://twitter.com/ToJans/status/246229805404672000">September 13, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<h3>I'm back</h3>
<p>... with a vengeance, I hope...</p>
<blockquote class="twitter-tweet">
<p>Time to resume my Live Blogging: getting started with Erlang and Nitrogen <a title="/posts/Live-Blogging-getting-started-with-Erlang-and-Nitrogen" href="https://t.co/VlzLeMqt/">corebvba.be/blog/post/Live&hellip;</a></p>
&mdash; Tom * suǝssuɐſ (@ToJans) <a href="https://twitter.com/ToJans/status/246552005630361600">September 14, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>A new day, new ideas, so I started looking at the google groups, and apparently I'm not the first one having this problem:&nbsp;<a href="https://groups.google.com/d/msg/nitrogenweb/KoBJCXr5SEI/UhgkWWTp09wJ" target="_blank">https://groups.google.com/d/msg/nitrogenweb/KoBJCXr5SEI/UhgkWWTp09wJ</a> .</p>
<p>So let us try that....</p>
<p>Uninstalled all erlang..</p>
<p>Removed original folder</p>
<p>Now downloading and installing windows release from&nbsp;<a href="https://www.erlang.org/download_release/6">https://www.erlang.org/download_release/6</a>&nbsp;in "C:\Program Files\erl5.7.5", not the (x86) folder.</p>
<p>Double click start.cmd in the nitrogen folder, it should open up the erlang console. surf to https://localhost:8000 et voila !!! FINALLY !!!</p>
<p>&nbsp;</p>
<p><img src="https://www.corebvba.be/blog/image.axd?picture=2012%2f9%2ffinally.png" alt="" /></p>
<h3>Finally</h3>
<p>I wrote a small<a href="/posts/Getting-started-with-Erlang-and-Nitrogen-(in-a-single-tweet)/"> follow-up post</a>.</p>
