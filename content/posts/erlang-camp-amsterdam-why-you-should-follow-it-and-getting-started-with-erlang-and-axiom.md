---
layout: post
date: "2013-05-17"
slug: "erlang-camp-amsterdam-why-you-should-follow-it-and-getting-started-with-erlang-and-axiom"
title: 'Erlang Camp Amsterdam: why you should follow it and getting started with
  Erlang and Axiom'
comments: true
sharing: true
footer: true
---

<h2>Introduction</h2>
<p>The last two days of August there is a <a href="http://www.erlangcamp.com/amsterdam">2 day Erlang course in Amsterdam</a>. One of the most incredible things, is that there is a low cost offer sponsored by <a href="http://www.spilgames.com/">Spil games</a> that reduces the price to 55&euro; for both days; talk about a steal!!</p>
<h2>First things first: why should you follow a camp on Erlang?</h2>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f5%2ferlcamp.png" alt="" /></p>
<p>People who know me in person know that I am an avid fan of Erlang, even though I have only done some very small experiments with it.</p>
<p>Even if you are not planning on developing something in Erlang, you should at least try to grasp the basic concepts!!</p>
<p>You want to know why? Here is why:</p>
<!--more-->
<h3>Opinionated - but proven - architecture</h3>
<p>Today's world of always connected web-apps, is much more similar to the telecom world then the web-apps from a few decades ago. People are currently continuously connected, and they expect almost-immediate responses.</p>
<p>As you can imagine, designing a proper software architecture for this takes a lot of time, but this is one of the parts where Erlang excels:</p>
<p>All the time you spend on building infrastructure for a well-designed application can be simply skipped. Erlang offers a very opinionated but proven tech stack that implements this for you out of the box, including things like messaging, local and distributed persistent storage, supervisor processes, ...</p>
<p>Next to this it also does not care on which machine a process runs;there is no extra implementation cost to run your process on multiple machines. (cloud anyone?)</p>
<h3>The actor model</h3>
<p>Actors are the "mode du jour" when it comes down to development buzzwords, but they happen to work pretty good in distributed environments. The whole Erlang infrastructure is built around processes communicating to each other with mailboxes per process, and they to offer selective receives and timeouts in a pretty straightforward way.</p>
<p>Because the VM is custom built for this platform, it has some extra things other VM's do not have, like soft-realtime processing and per-process garbage collection. The VM is optimized for the actor model.</p>
<h3>Productivity</h3>
<p>Erlang has a bit of a quirky syntax due to it's origins (Prolog), so it takes some getting used to the difference between ending a line with a semicolon, a comma or a dot. While this might seem odd, it comes naturally after a while, but it takes some persistence.</p>
<p>Next to this, Erlang has pattern matching (a little bit comparable to polymorphism in OO languages, but it even goes way further then that).</p>
<p>They even have something like generics using behavior.</p>
<p></p>
<p>Another odd thing for someone coming from an imperative programmer's world is the advice of not using if statements. While this might sound really odd, it does offer a lot of advantages (i.e. the whole explicit vs implicit discussion).</p>
<p>All these and other things might sound a bit odd, but they allow you to focus your code on business behavior, and infrastructure is just there to use it, without interfering with your code.</p>
<p>Typical stories from multiple resources show that code is reduced to about a third when converting to Erlang.</p>
<h3>Others</h3>
<p>There are numerous other reasons why to opt for Erlang in certain cases, here are some resources:</p>
<ul>
<li><a href="http://www.erlang.org/download/armstrong_thesis_2003.pdf">Joe Armstrong's original paper on Erlang from 2003</a></li>
<li><a href="http://pragprog.com/articles/erlang">The pragmatic programmer's page on Erlang</a></li>
<li>Please post any other suggestions in the comments</li>
</ul>
<h2>Ok, you convinced me, but how do you get started on this?</h2>
<p>Quite simple: unicorns &amp; fairydust. Or, if those are not available, there is another way (it took me a while to figure all of this out, but once you know it, it is quite simple):</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f5%2fstart.png" alt="" /></p>
<h3>Install prerequisites</h3>
<p>First we need some kind of a package manager. As this example is currently in Windows, I will start by installing a package manager: <a href="http://chocolatey.org">Chocolatey</a>.</p>
<p>Open a command window as an administrator, and type the following (copied from the chocolatey website):</p>
<pre><code><strong>@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" &amp;&amp; SET PATH=%PATH%;%systemdrive%\chocolatey\bin
</strong></code></pre>
<p>Close the command window, and open it again, you will now be able to install applications using the command line; we will start by installing git and Erlang from the command line:</p>
<pre><code><strong>cinst git.install
cinst erlang
</strong></code></pre>
<p>You now should have both git and Erlang installed. If I am not mistaken git should be available from the command line right now</p>
<p>But we also need to make the Erlang binaries available on the command line. You can do this by setting the path in the windows settings, or just for this one command window.</p>
<p>As I am trying to keep this post short, I will just opt for the latter; in the command window you should type the following:</p>
<pre><code><strong>set path=%path%;c:\Program Files\erl5.10.1\bin
</strong></code></pre>
<p>Where path should of course match your install path.</p>
<h3>Get a package manager</h3>
<p>As most languages, Erlang has a package manager; I currently opt for rebar.</p>
<p>Go to a path where you want to put your code; type the following:</p>
<pre><code><strong>git clone https://github.com/basho/rebar.git</strong>
</code></pre>
<p>This should provide you the source, but also the binaries to the rebar package manager.</p>
<p>Tot test whether it works, just type <code>rebar -c</code> and it should show you the following output:</p>
<pre><code>E:\Dev\erlang\rebar&gt;<strong>rebar -c</strong>

clean                                Clean
compile                              Compile sources

escriptize                           Generate escript archive

create      template= [var=foo,...]  Create skel based on template and vars
create-app  [appid=myapp]            Create simple app skel
create-node [nodeid=mynode]          Create simple node skel
list-templates                       List available templates

doc                                  Generate Erlang program documentation

check-deps                           Display to be fetched dependencies
get-deps                             Fetch dependencies
update-deps                          Update fetched dependencies
----&gt;&lt;8------- cut for brevity
</code></pre>
<h2>Let's build a POC helloworld first</h2>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f5%2fHelloWorld.png" alt="" /></p>
<p>Create the folder where you want your app to reside, and copy the file <code>rebar.</code> and <code>rebar.cmd</code> into this folder.</p>
<p>First we are going to generate an app; this should create a subfolder <code>src</code> with 3 files in it.</p>
<pre><code>E:\Dev\erlang\erlcdemo&gt;<strong>rebar create-app appid=helloworld</strong>
==&gt; erlcdemo (create-app)
Writing src/helloworld.app.src
Writing src/helloworld_app.erl
Writing src/helloworld_sup.erl
</code></pre>
<p>For now we will ignore the <code>*app</code> and <code>*sup</code> files, but create another file under the <code>src</code> folder, named <code>helloworld.erl</code>. This should be the content:</p>
<pre><code><pre class="line-pre" style="font-size: 12px; line-height: 16px; font-family: Consolas, 'Liberation Mono', Courier, monospace; word-wrap: break-word; width: 744px; margin: 0px; padding: 0px;"><div id="file-014-erl-LC1" class="line"><span class="p">-</span><span class="ni" style="color: purple;">module</span><span class="p">(</span><span class="n" style="color: #333333;">helloworld</span><span class="p">).</span></div><div id="file-014-erl-LC2" class="line"><span class="p">-</span><span class="ni" style="color: purple;">compile</span><span class="p">(</span><span class="n" style="color: #333333;">export_all</span><span class="p">).</span></div><div id="file-014-erl-LC3" class="line">&nbsp;</div><div id="file-014-erl-LC4" class="line"><span class="nf" style="color: #990000; font-weight: bold;">hi</span><span class="p">()</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-014-erl-LC5" class="line">  <span class="n" style="color: #333333;">hi</span><span class="p">(</span><span class="s" style="color: #dd1144;">"stranger"</span><span class="p">).</span></div><div id="file-014-erl-LC6" class="line">&nbsp;</div><div id="file-014-erl-LC7" class="line"><span class="nf" style="color: #990000; font-weight: bold;">hi</span><span class="p">(</span><span class="s" style="color: #dd1144;">"Tom"</span><span class="p">)</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-014-erl-LC8" class="line">  <span class="n" style="color: #333333;">hi</span><span class="p">(</span><span class="s" style="color: #dd1144;">"silly sod"</span><span class="p">);</span></div><div id="file-014-erl-LC9" class="line">&nbsp;</div><div id="file-014-erl-LC10" class="line"><span class="nf" style="color: #990000; font-weight: bold;">hi</span><span class="p">(</span><span class="nv" style="color: teal;">Who</span><span class="p">)</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-014-erl-LC11" class="line">  <span class="nn" style="color: #555555;">io</span><span class="p">:</span><span class="nf" style="color: #990000; font-weight: bold;">format</span><span class="p">(</span><span class="s" style="color: #dd1144;">"Hello </span><span class="si" style="color: #dd1144;">~s</span><span class="s" style="color: #dd1144;">!</span><span class="si" style="color: #dd1144;">~n</span><span class="s" style="color: #dd1144;">"</span><span class="p">,[</span><span class="nv" style="color: teal;">Who</span><span class="p">]).</span></div></pre>
</code></pre>
<p>We will now open Erlang, compile the code and test it (without rebar). this is what it looks like:</p>
<pre><code>E:\Dev\erlang\erlcdemo\src&gt;<strong>erl</strong>
Eshell V5.10.1  (abort with ^G)
1&gt; <strong>c(helloworld).</strong>
{ok,helloworld}
2&gt; <strong>helloworld:hi().</strong>
Hello stranger!
ok
3&gt;<strong> helloworld:hi("Bart").</strong>
Hello Bart!
ok
4&gt; <strong>helloworld:hi("Tom").</strong>
Hello silly sod!
ok
5&gt;<strong> q().</strong>
ok
6&gt;
E:\Dev\erlang\erlcdemo\src&gt;
</code></pre>
<p>Ok, so this works, but it is not very impressive, so ...</p>
<h2>Let's convert the POC into a web app!</h2>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f5%2fHelloWorldWeb.png" alt="" /></p>
<h3>Get a web framework</h3>
<p>We will use rebar to download the <a href="https://github.com/tsujigiri/axiom">axiom framework</a>, which is a bit like Sinatra for Erlang.</p>
<p>We create a file in the root folder of our solution called <code>rebar.config</code>:</p>
<pre><code>E:\Dev\erlang\erlcdemo&gt;<strong>copy con rebar.config
{lib_dirs, ["deps"]}.
{deps, [
    {'axiom', "0.1.0", {git, "git://github.com/tsujigiri/axiom.git", {tag, "v0.1.0"}}}
]}.</strong>
^Z
        1 file(s) copied.
</code></pre>
<p>(You can also use notepad to create this file, but I wanted to show the path it was created in.)</p>
<p>Next, load all the dependencies:</p>
<pre><code>E:\Dev\erlang\erlcdemo&gt;<strong>rebar get-deps</strong>
==&gt; erlcdemo (get-deps)
Pulling axiom from {git,"git://github.com/tsujigiri/axiom.git",{tag,"v0.1.0"}}
Cloning into 'axiom'...
==&gt; axiom (get-deps)
Pulling cowboy from {git,"git://github.com/extend/cowboy.git",{tag,"0.8.3"}}
Cloning into 'cowboy'...
Pulling erlydtl from {git,"git://github.com/evanmiller/erlydtl.git","dda4db0"}
Cloning into 'erlydtl'...
Pulling mimetypes from {git,"git://github.com/spawngrid/mimetypes.git",
                            {tag,"1.0"}}
Cloning into 'mimetypes'...
==&gt; cowboy (get-deps)
Pulling ranch from {git,"git://github.com/extend/ranch.git","0.8.0"}
Cloning into 'ranch'...
==&gt; ranch (get-deps)
==&gt; erlydtl (get-deps)
==&gt; mimetypes (get-deps)

E:\Dev\erlang\erlcdemo&gt;
</code></pre>
<p>Now we have to convert our code into a web app: open the <code>src\helloworld.erl</code>-file, and change it to the following:</p>
<pre><code><pre class="line-pre" style="font-size: 12px; line-height: 16px; font-family: Consolas, 'Liberation Mono', Courier, monospace; word-wrap: break-word; width: 744px; margin: 0px; padding: 0px;"><div id="file-020-erl-LC1" class="line"><span class="p">-</span><span class="ni" style="color: purple;">module</span><span class="p">(</span><span class="n" style="color: #333333;">helloworld</span><span class="p">).</span></div><div id="file-020-erl-LC2" class="line"><span class="p">-</span><span class="ni" style="color: purple;">compile</span><span class="p">(</span><span class="n" style="color: #333333;">export_all</span><span class="p">).</span></div><div id="file-020-erl-LC3" class="line">&nbsp;</div><div id="file-020-erl-LC4" class="line"><span class="nf" style="color: #990000; font-weight: bold;">start</span><span class="p">()</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-020-erl-LC5" class="line">  <span class="nn" style="color: #555555;">application</span><span class="p">:</span><span class="nf" style="color: #990000; font-weight: bold;">start</span><span class="p">(</span><span class="n" style="color: #333333;">crypto</span><span class="p">),</span></div><div id="file-020-erl-LC6" class="line">  <span class="nn" style="color: #555555;">application</span><span class="p">:</span><span class="nf" style="color: #990000; font-weight: bold;">start</span><span class="p">(</span><span class="n" style="color: #333333;">ranch</span><span class="p">),</span></div><div id="file-020-erl-LC7" class="line">  <span class="nn" style="color: #555555;">application</span><span class="p">:</span><span class="nf" style="color: #990000; font-weight: bold;">start</span><span class="p">(</span><span class="n" style="color: #333333;">cowboy</span><span class="p">),</span></div><div id="file-020-erl-LC8" class="line">  <span class="nn" style="color: #555555;">axiom</span><span class="p">:</span><span class="nf" style="color: #990000; font-weight: bold;">start</span><span class="p">(</span><span class="o" style="font-weight: bold;">?</span><span class="nv" style="color: teal;">MODULE</span><span class="p">).</span></div><div id="file-020-erl-LC9" class="line">&nbsp;</div><div id="file-020-erl-LC10" class="line"><span class="c" style="color: #999988; font-style: italic;">% Hi url without parameter</span></div><div id="file-020-erl-LC11" class="line"><span class="nf" style="color: #990000; font-weight: bold;">handle</span><span class="p">(</span><span class="o" style="font-weight: bold;">&lt;&lt;</span><span class="s" style="color: #dd1144;">"GET"</span><span class="o" style="font-weight: bold;">&gt;&gt;</span><span class="p">,</span> <span class="p">[</span><span class="o" style="font-weight: bold;">&lt;&lt;</span><span class="s" style="color: #dd1144;">"hi"</span><span class="o" style="font-weight: bold;">&gt;&gt;</span><span class="p">],</span> <span class="p">_</span><span class="nv" style="color: teal;">Req</span><span class="p">)</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-020-erl-LC12" class="line">    <span class="n" style="color: #333333;">hi</span><span class="p">();</span></div><div id="file-020-erl-LC13" class="line">&nbsp;</div><div id="file-020-erl-LC14" class="line"><span class="c" style="color: #999988; font-style: italic;">% Hi url with parameter</span></div><div id="file-020-erl-LC15" class="line"><span class="nf" style="color: #990000; font-weight: bold;">handle</span><span class="p">(</span><span class="o" style="font-weight: bold;">&lt;&lt;</span><span class="s" style="color: #dd1144;">"GET"</span><span class="o" style="font-weight: bold;">&gt;&gt;</span><span class="p">,</span> <span class="p">[</span><span class="o" style="font-weight: bold;">&lt;&lt;</span><span class="s" style="color: #dd1144;">"hi"</span><span class="o" style="font-weight: bold;">&gt;&gt;</span><span class="p">,</span> <span class="nv" style="color: teal;">Name</span><span class="p">],</span> <span class="p">_</span><span class="nv" style="color: teal;">Req</span><span class="p">)</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-020-erl-LC16" class="line">    <span class="n" style="color: #333333;">hi</span><span class="p">(</span><span class="nv" style="color: teal;">Name</span><span class="p">).</span></div><div id="file-020-erl-LC17" class="line">&nbsp;</div><div id="file-020-erl-LC18" class="line"><span class="nf" style="color: #990000; font-weight: bold;">hi</span><span class="p">()</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-020-erl-LC19" class="line">  <span class="n" style="color: #333333;">hi</span><span class="p">(</span><span class="s" style="color: #dd1144;">"stranger"</span><span class="p">).</span></div><div id="file-020-erl-LC20" class="line">&nbsp;</div><div id="file-020-erl-LC21" class="line"><span class="nf" style="color: #990000; font-weight: bold;">hi</span><span class="p">(</span><span class="o" style="font-weight: bold;">&lt;&lt;</span><span class="s" style="color: #dd1144;">"Tom"</span><span class="o" style="font-weight: bold;">&gt;&gt;</span><span class="p">)</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-020-erl-LC22" class="line">  <span class="n" style="color: #333333;">hi</span><span class="p">(</span><span class="s" style="color: #dd1144;">"silly sod"</span><span class="p">);</span></div><div id="file-020-erl-LC23" class="line">&nbsp;</div><div id="file-020-erl-LC24" class="line"><span class="nf" style="color: #990000; font-weight: bold;">hi</span><span class="p">(</span><span class="nv" style="color: teal;">Who</span><span class="p">)</span> <span class="o" style="font-weight: bold;">-&gt;</span></div><div id="file-020-erl-LC25" class="line">  <span class="nv" style="color: teal;">FormattedList</span> <span class="o" style="font-weight: bold;">=</span> <span class="nn" style="color: #555555;">io_lib</span><span class="p">:</span><span class="nf" style="color: #990000; font-weight: bold;">format</span><span class="p">(</span><span class="s" style="color: #dd1144;">"&lt;h1&gt;Hello </span><span class="si" style="color: #dd1144;">~s</span><span class="s" style="color: #dd1144;">!&lt;/h1&gt;</span><span class="si" style="color: #dd1144;">~n</span><span class="s" style="color: #dd1144;">"</span><span class="p">,[</span><span class="nv" style="color: teal;">Who</span><span class="p">]),</span></div><div id="file-020-erl-LC26" class="line">  <span class="nn" style="color: #555555;">erlang</span><span class="p">:</span><span class="nb" style="color: #0086b3;">iolist_to_binary</span><span class="p">(</span><span class="nv" style="color: teal;">FormattedList</span><span class="p">).</span></div></pre>
</code></pre>
<p>Then we can compile everything; go to the root folder of your solution, and do this:</p>
<pre><code>E:\Dev\erlang\erlcdemo&gt;<strong>rebar compile</strong>
==&gt; ranch (compile)
Compiled src/ranch_protocol.erl
Compiled src/ranch_transport.erl
Compiled src/ranch_acceptor.erl
Compiled src/ranch_acceptors_sup.erl
Compiled src/ranch_app.erl
Compiled src/ranch_listener_sup.erl
Compiled src/ranch.erl
Compiled src/ranch_conns_sup.erl
Compiled src/ranch_sup.erl
Compiled src/ranch_server.erl
Compiled src/ranch_tcp.erl
Compiled src/ranch_ssl.erl
==&gt; cowboy (compile)
Compiled src/cowboy_http_handler.erl
Compiled src/cowboy_loop_handler.erl
----&gt;&lt;8------- cut for brevity
</code></pre>
<p>If everything compiled well, we are good to go, let us run the web app:</p>
<pre><code>E:\Dev\erlang\erlcdemo&gt;erl -pa ebin deps\crypto\ebin deps\ranch\ebin deps\cowboy\ebin deps\axiom\ebin deps\erlydtl\ebin
Eshell V5.10.1  (abort with ^G)
1&gt; helloworld:start().
{ok,&lt;0.49.0&gt;}
2&gt;
</code></pre>
<p>That's it; now surf to <a href="http://localhost:7654/">http://localhost:7654/</a> and you should get a 404 / Not found.</p>
<p>Next, surf to <a href="http://localhost:7654/hi">http://localhost:7654/hi</a> and you should get <code>Hello stranger!</code> as an answer.</p>
<p>Next, try <a href="http://localhost:7654/hi/Bart">http://localhost:7654/hi/Bart</a> and <a href="http://localhost:7654/hi/Tom">http://localhost:7654/hi/Tom</a>, and they should all work...</p>
<p>If you change the <code>helloworld.erl</code> file, there is no need to quit Erlang, just compile it from the shell, and code will hot-load:</p>
<pre><code>E:\Dev\erlang\erlcdemo&gt;<strong>erl -pa ebin deps\crypto\ebin deps\ranch\ebin deps\cowboy\ebin deps\axiom\ebin deps\erlydtl\ebin</strong>
Eshell V5.10.1  (abort with ^G)
1&gt; <strong>helloworld:start().</strong>
{ok,&lt;0.49.0&gt;}
2&gt; <strong>c("src/helloworld").</strong>
{ok,helloworld}
3&gt;
</code></pre>
<p>Probably the next thing to do would be using proper OTP behaviour, but I assume this will make this post to big, so I will call it a day for now.</p>
<h2>Conclusion</h2>
<p>Well, we only touched the top of the iceberg here, but the main idea of this post is to get you interested in Erlang, and show you how easy it is to get started if you know how to do it.</p>
<p>Erlang really shines in always available/connected/distributed systems.</p>
<p>And, if your interest is triggered, might I suggest you to join me on the <a href="http://www.erlangcamp.com/amsterdam">Erlang Camp course in Amsterdam</a>, as this is true value for the buck.</p>
<p>Laters!</p>
<p>Tom</p>
<p>&nbsp;</p>
<p>PS: a big thank you goes out to <a href="https://twitter.com/helgerausch" target="_blank">@helgeraush</a>&nbsp;(the author of the axiom framework) for reviewing this post!</p>
